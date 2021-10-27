#!/bin/bash

sudo apt-get update
sudo apt-get install python3-pip
sudo apt-get install openjdk-8-jdk

sudo -H pip3 install jupyter
sudo -H pip3 install pyspark

mkdir /home/ubuntu/.jupyter
touch /home/ubuntu/.jupyter/jupyter_notebook_config.py
chown ubuntu:ubuntu /home/ubuntu/.jupyter
chown ubuntu:ubuntu /home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "c = get_config()" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 8888" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py

export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON=python3