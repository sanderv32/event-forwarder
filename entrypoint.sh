#!/bin/sh

set -e
export RSYSLOG_TARGET=${RSYSLOG_TARGET:-127.0.0.1}
export RSYSLOG_PORT=${RSYSLOG_PORT:-514}
export RSYSLOG_PROTOCOL=${RSYSLOG_PROTOCOL:-udp}

echo "Target: $RSYSLOG_PROTOCOL://$RSYSLOG_TARGET:$RSYSLOG_PORT"

envsubst < /etc/rsyslog.conf.tmpl > /etc/rsyslog.conf
exec "$@"
