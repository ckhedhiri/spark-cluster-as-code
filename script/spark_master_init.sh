#!/bin/bash

/opt/spark-*-bin-hadoop*-scala*/sbin/start-master.sh -h $(curl http://169.254.169.254/latest/meta-data/hostname)