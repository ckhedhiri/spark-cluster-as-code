#!/bin/bash

echo "$SPARK_HOME/sbin/start-master.sh -h $(curl http://169.254.169.254/latest/meta-data/hostname)" >> /etc/init.d/spark_master.sh