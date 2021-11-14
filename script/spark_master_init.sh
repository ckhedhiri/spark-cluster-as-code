#!/bin/bash

/etc/profile.d/spark_home.sh
$SPARK_HOME/sbin/start-master.sh -h $(curl http://169.254.169.254/latest/meta-data/hostname)