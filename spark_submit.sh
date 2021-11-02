# replace spark://ip-10-0-1-65.eu-west-1.compute.internal:7077 by the private master domaine

spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://10.0.1.140:7077 \
  --deploy-mode client \
/opt/spark-3.2.0-bin-hadoop3.2-scala2.13/examples/jars/spark-examples_2.13-3.2.0.jar