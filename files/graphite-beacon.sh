#!/bin/bash
# chkconfig: 2345 90 90
# description: graphite_beacon
### BEGIN INIT INFO
# Provides: graphite_beacon
# Required-Start: network
# Required-Stop: network
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Description: Start the program
### END INIT INFO

PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="Graphite Beacon"
NAME=graphite_beacon
PIDFILE=/var/run/$NAME.pid
PGREP_ARGS="graphite_beacon.app"
DAEMON_USER="root"
DAEMON="python2.7 -m graphite_beacon.app"
DAEMON_ARGS=" --pidfile=${PIDFILE} --config=/etc/${NAME}/config.json --log_file_prefix=/var/log/graphite_beacon.log "


. /etc/rc.d/init.d/functions

start() {
        echo -n $"Starting $NAME: "
        daemon --user="$DAEMON_USER" --pidfile="$PIDFILE" $DAEMON $DAEMON_ARGS ">> /var/log/graphite_beacon.log 2>&1 &"

        RETVAL=$?
        pid=$(pgrep -f $PGREP_ARGS)
        if [ -n "$pid" ]; then
                echo $pid > "$PIDFILE"
        fi
        echo
        return $RETVAL
}
stop() {
        echo -n $"Stopping $NAME: "
        killproc -p "$PIDFILE" -d 10 "$DAEMON"
        RETVAL="$?"
        echo
        [ $RETVAL = 0 ] && rm -f "$PIDFILE"
        return "$RETVAL"
}

case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        stop
        start
        ;;
  *)
        echo "Usage: $NAME {start|stop|restart}" >&2
        exit 1
        ;;
esac

exit $RETVAL