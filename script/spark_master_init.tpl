#!/bin/bash

sleep 45
/opt/${spark_bin}/sbin/start-master.sh -h $(curl http://169.254.169.254/latest/meta-data/hostname)