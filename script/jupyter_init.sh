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
echo "c.NotebookApp.password = u''" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py

echo "export PYSPARK_DRIVER_PYTHON='jupyter'" >> /etc/profile.d/jupyter_env.sh
echo "export PYSPARK_DRIVER_PYTHON_OPTS='notebook'" >> /etc/profile.d/jupyter_env.sh
echo "export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH" >> /etc/profile.d/jupyter_env.sh
echo "export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.10.9.2-src.zip:$PYTHONPATH" >> /etc/profile.d/jupyter_env.sh

jupyter notebook &