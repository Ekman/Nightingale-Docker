#!/bin/bash

set -e

gosu "$USER" "$STEAMCMDDIR/steamcmd.sh" \
    +force_install_dir "$GAME_DIR" \
    +login anonymous \
    +app_update "$GAME_ID" \
    validate \
    +quit

chown "$USER": -R "$CONFIG_DIR"

gosu "$USER" bash "$GAME_DIR/NWXServer.sh" $@
