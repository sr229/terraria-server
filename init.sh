#!/bin/sh

groupadd -r -g $PGID appuser
useradd -m -u $PUID -g $PGID appuser

chown -R appuser:appuser /opt/Terraria

exec su appuser -c "$MONORUNTIME $MONOARGS $EXE $EXEARGS"
