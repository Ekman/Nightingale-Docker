#!/bin/bash

set -e

chown "$USER": -R "$GAME_DIR" "$CONFIG_DIR"

gosu "$USER" "$STEAMCMDDIR/steamcmd.sh" \
    +force_install_dir "$GAME_DIR" \
    +login anonymous \
    +app_update "$GAME_ID" \
    validate \
    +quit

gosu "$USER" bash "$GAME_DIR/NWXServer.sh" $@
