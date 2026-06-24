FROM ghcr.io/lavalink-devs/lavalink:4

# Lavalink's working dir in the official image is /opt/Lavalink
COPY application.yml /opt/Lavalink/application.yml

# Railway injects a dynamic PORT; Lavalink reads SERVER_PORT (Spring Boot override).
# We also default to 0.0.0.0 so the service is reachable.
ENV SERVER_ADDRESS=0.0.0.0
