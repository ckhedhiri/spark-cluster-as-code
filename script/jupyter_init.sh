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
echo "c.NotebookApp.token = ''" >> 	/home/ubuntu/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = u'sha1:e823096be857:b5cf91d20045bac1e03df70f396e1b47ac6fb4e1'" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py

echo "export PYSPARK_DRIVER_PYTHON='jupyter'" >> ~/.bashrc
echo "export PYSPARK_DRIVER_PYTHON_OPTS='notebook'" >> ~/.bashrc
echo "export PYTHONPATH=$SPARK_HOME/python/:$SPARK_HOME/python/lib/py4j-0.10.9.2-src.zip" >> ~/.bashrc
echo "export PYSPARK_PYTHON=python3" >> ~/.bashrc

source ~/.bashrc

jupyter notebook &
