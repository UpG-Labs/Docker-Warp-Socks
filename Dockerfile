FROM alpine:3.21

LABEL maintainer="romracer <romracer@users.noreply.github.com>" \
    alpine-version="3.21.3" \
    org.opencontainers.image.title="Docker-Warp-Socks" \
    org.opencontainers.image.description="Connet to CloudFlare WARP, exposing `socks5` proxy all together." \
    org.opencontainers.image.authors="romracer <romracer@users.noreply.github.com>" \
    org.opencontainers.image.vendor="romracer" \
    org.opencontainers.image.version="4.0.0" \
    org.opencontainers.image.url="https://github.com/UpG-Labs/Docker-Warp-Socks/pkgs/container/docker-warp-socks" \
    org.opencontainers.image.source="https://github.com/UpG-Labs/Docker-Warp-Socks" \
    org.opencontainers.image.base.name="ghcr.io/upg-labs/docker-warp-socks"

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" | tee -a /etc/apk/repositories

RUN apk update && apk upgrade \
    && apk add --no-cache curl openssl sing-box \
    && rm -rf /var/cache/apk/*

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

CMD ["rws-cli"]
