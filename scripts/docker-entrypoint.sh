#!/bin/bash -e

gosu "$USER" "$STEAMCMDDIR/steamcmd.sh" \
    +force_install_dir "$GAME_DIR" \
    +login anonymous \
    +app_update "$GAME_ID" \
    validate \
    +quit

gosu "$USER" bash /start-server.sh
