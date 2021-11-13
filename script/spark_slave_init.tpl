#!/bin/bash

$SPARK_HOME/sbin/start-worker.sh spark://${spark_master_private_dns}:7077
