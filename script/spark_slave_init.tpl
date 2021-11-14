#!/bin/bash

echo "$SPARK_HOME/sbin/start-worker.sh spark://${spark_master_private_dns}:7077" >> /etc/profile.d/spark_slave.sh
