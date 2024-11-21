from pyspark import SparkContext

sc = SparkContext("local", "Word Count")
text_file = sc.textFile("gs://my-bucket/my-file.txt")
counts = text_file.flatMap(lambda line: line.split(" ")) \
    .map(lambda word: (word, 1)) \
    .reduceByKey(lambda a, b: a + b)
counts.saveAsTextFile("gs://my-bucket/word-count-output/")
