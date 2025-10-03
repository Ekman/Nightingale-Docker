#!/bin/bash -e

set -e

gosu "$USER" "$STEAMCMDDIR/steamcmd.sh" \
    +force_install_dir "$GAME_DIR" \
    +login anonymous \
    +app_update "$GAME_ID" \
    +quit

gosu "$USER" bash "$GAME_DIR/NWXServer.sh"
