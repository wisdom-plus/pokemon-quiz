#!/bin/ash
# shellcheck shell=dash

set -e

rm -f /app/tmp/pids/server.pid

exec "$@"
