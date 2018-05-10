#!/bin/bash

echoerr(){ echo -e "\033[0;31m$@\033[0m" 1>&2; }

err=false
[[ -z $ETCD_HOST ]] && echoerr "Need to set ETCD_HOST variable." && err=true
[[ -z $ETCD_PORT ]] && echoerr "Need to set ETCD_PORT variable." && err=true
$err && exit 1

exec /go/bin/discodns --etcd=http://$ETCD_HOST:$ETCD_PORT
