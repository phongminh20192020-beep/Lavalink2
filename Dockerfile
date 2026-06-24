FROM ghcr.io/lavalink-devs/lavalink:4

COPY application.yml /opt/Lavalink/application.yml

ENV SERVER_ADDRESS=0.0.0.0
# Limit JVM heap to 400MB max, 64MB initial — fits Railway's free tier (512MB)
ENV _JAVA_OPTIONS="-Xmx400m -Xms64m -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:+UseStringDeduplication"
