#!/bin/sh

sudo /sbin/service VRDeviceDaemon stop
sudo /sbin/service VRDeviceDaemon start
sleep 20

/usr/local/packages/NCK-1.3/bin/NanotechConstructionKit \
-rootSection dante

sudo /sbin/service VRDeviceDaemon stop

