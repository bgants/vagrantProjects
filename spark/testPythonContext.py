from __future__ import division
from pyspark import SparkConf, SparkContext
import sys

conf = SparkConf().setMaster("local").setAppName("My App")
sc = SparkContext(conf = conf)

autoData = sc.textFile("/vagrant/autos.csv")

autoCount = autoData.count()

diesels = autoData.filter(lambda line: "diesel" in line)
dieselCount = diesels.count()

print("Total autos {} ".format(autoCount) )
print("Total diesels {} ".format(dieselCount) )

dieselPercentage = ((dieselCount/autoCount) * 100) 

print("Percentage of diesels to autos is {} ".format(dieselPercentage) ) 

sys.exit()
