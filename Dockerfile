FROM cm2network/steamcmd:root

LABEL org.opencontainers.image.source="https://github.com/Ekman/Nightingale"
LABEL org.opencontainers.image.authors="Niklas Ekman <nikl.ekman@gmail.com>"

ENV GAME_DIR="$HOMEDIR/game" \
    CONFIG_DIR="$HOMEDIR/config" \
    GAME_ID="3796810" \
    DEBIAN_FRONTEND="noninteractive"

EXPOSE 7777/udp

RUN apt-get update \
    && apt-get install --yes --no-install-recommends --no-install-suggests tini gosu \
    && apt-get autoremove --yes --purge \
    && apt-get clean \
    && apt-get autoclean \
    && mkdir -p "$GAME_DIR" "$CONFIG_DIR" "$HOMEDIR/.config" \
    && chown -R "$USER":"$USER" "$GAME_DIR" "$CONFIG_DIR" "$HOMEDIR/.config"

ADD --chown="$USER":"$USER" scripts/docker-entrypoint.sh /


VOLUME [ "$GAME_DIR", "$CONFIG_DIR", "$HOMEDIR/steamcmd", "$HOMEDIR/Steam" ]

# See: https://github.com/docker-library/official-images#init
ENTRYPOINT [ "tini", "-ve", "143", "--", "bash", "/docker-entrypoint.sh" ]
