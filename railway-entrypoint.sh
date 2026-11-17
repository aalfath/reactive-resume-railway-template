#!/bin/sh
set -eu

data="${LOCAL_STORAGE_PATH:-/app/data}"

if [ "$(id -u)" = "0" ]; then
	mkdir -p "$data"
	# Railway volumes come up root-owned (with a lost+found folder). The app runs as `node` and must write here.
	# -h changes a symlink itself, never its target.
	find "$data" ! -user node -exec chown -h node:node {} +
fi

# The image's entrypoint drops to the `node` user and runs the command.
exec docker-entrypoint.sh "$@"
