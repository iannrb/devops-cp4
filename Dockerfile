ARG DOTNET_RUNTIME=mcr.microsoft.com/dotnet/aspnet:9.0
ARG DOTNET_SDK=mcr.microsoft.com/dotnet/sdk:9.0

FROM ${DOTNET_SDK} AS build
WORKDIR /source

COPY ["DevOpsCp4.csproj", "./"]
RUN dotnet restore DevOpsCp4.csproj

COPY . .
RUN dotnet publish DevOpsCp4.csproj -c Release -o /app/publish

FROM ${DOTNET_RUNTIME} AS final

RUN groupadd -r appuser && useradd -r -g appuser -u 1001 -m appuser

WORKDIR /app

RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=build /app/publish .

RUN echo '#!/bin/bash\n\
echo "🚀 DevOps CP4 - Starting Application"\n\
echo "📊 Checking environment variables..."\n\
if [ -z "$DB_URL" ]; then\n\
    echo "❌ DB_URL environment variable is required"\n\
    exit 1\n\
fi\n\
echo "✅ Environment variables validated"\n\
echo "🌐 Starting ASP.NET Core application..."\n\
exec dotnet DevOpsCp4.dll' > /app/start.sh

RUN chmod +x /app/start.sh && \
    chown -R appuser:appuser /app

USER appuser

ENV ASPNETCORE_URLS=http://+:8080
ENV DB_URL=""

EXPOSE 8080

ENTRYPOINT ["/app/start.sh"]
