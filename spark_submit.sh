# replace spark://ip-10-0-1-65.eu-west-1.compute.internal:7077 by the private master domaine

spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master spark://ip-10-0-1-210.eu-west-1.compute.internal:7077 \
  --deploy-mode client \
  $SPARK_HOME/examples/jars/spark-examples_2.13-3.2.0.jar