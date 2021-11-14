#!/bin/bash

/etc/profile.d/spark_home.sh
$SPARK_HOME/sbin/start-worker.sh spark://$1:7077)