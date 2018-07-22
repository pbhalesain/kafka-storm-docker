sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbus%/$NIMBUS_PORT_6627_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml

echo "supervisor.scheduler.meta:" >> $STORM_HOME/conf/storm.yaml
echo "    tags: DC1" >> $STORM_HOME/conf/storm.yaml
echo "preferred.topology.dc.config:" >> $STORM_HOME/conf/storm.yaml
echo "    tp1: dc1" >> $STORM_HOME/conf/storm.yaml
echo "    tp2: dc2" >> $STORM_HOME/conf/storm.yaml
echo "worker.childopts: "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5%ID%" >> $STORM_HOME/conf/storm.yaml"

/usr/sbin/sshd && systemctl start supervisord && systemctl status supervisord && systemctl enable supervisord && 