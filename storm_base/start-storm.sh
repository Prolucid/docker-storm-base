#!/bin/bash

# Configure mandatory storm.yaml settings
ZK_LINES=
for i in $ZK_SERVERS ; do
    ZK_LINES="$ZK_LINES - \"$i\"\\n"
done

sed -i -e "s/%ZOOKEEPER_SERVERS%/$ZK_LINES/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/nimbus.seeds:.*/nimbus.seeds: [\"$NIMBUS_HOST\"]/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/storm.zookeeper.port:.*/storm.zookeeper.port: $ZK_PORT/g" $STORM_HOME/conf/storm.yaml

exec storm %STORMAPP%
