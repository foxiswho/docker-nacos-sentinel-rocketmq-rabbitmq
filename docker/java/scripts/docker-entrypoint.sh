#!/bin/bash


export JAVA_OPTS="-Dserver.port=${PORT} -Dcsp.sentinel.dashboard.server=${IP}:${PORT} -Dcsp.sentinel.log.dir=${SENTINEL_LOGS} -Dproject.name=sentinel-dashboard -Djava.security.egd=file:/dev/./urandom ${JAVA_OPTS}"

echo "=============JAVA_OPTS============"
echo $JAVA_OPTS


exec "$@"