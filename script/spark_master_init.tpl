#!/bin/bash

$SPARK_HOME/sbin/start-master.sh -h $(curl http://169.254.169.254/latest/meta-data/hostname)