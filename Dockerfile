FROM cm2network/steamcmd:root

LABEL org.opencontainers.image.source="https://github.com/Ekman/Nightingale-Docker"
LABEL org.opencontainers.image.authors="Niklas Ekman <nikl.ekman@gmail.com>"
LABEL org.opencontainers.image.licenses="MIT"

ENV GAME_DIR="$HOMEDIR/game" \
    GAME_ID="3796810" \
    DEBIAN_FRONTEND="noninteractive"

EXPOSE 7777/udp

RUN apt-get update \
    && apt-get full-upgrade --yes \
    && apt-get install --yes --no-install-recommends --no-install-suggests tini gosu \
    && apt-get autoremove --yes --purge \
    && apt-get clean \
    && apt-get autoclean \
    && mkdir -p "$GAME_DIR" "$HOMEDIR/.config" \
    && chown -R "$USER":"$USER" "$GAME_DIR" "$HOMEDIR/.config"

ADD scripts/docker-entrypoint.sh /

VOLUME [ "$GAME_DIR", "$HOMEDIR/steamcmd", "$HOMEDIR/.config" ]

# See: https://github.com/docker-library/official-images#init
ENTRYPOINT [ "tini", "-ve", "143", "--", "bash", "/docker-entrypoint.sh" ]
