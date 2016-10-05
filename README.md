# Docker Spark
===


## Overview
This docker image is for simple dev environment. An easy way to try Spark.


##Building the image
	docker build --rm -t dejunmeng/spark:1.6.0 .


##Running the image
* if using boot2docker make sure your VM has more than 2GB memory

* in your /etc/hosts file add $(boot2docker ip) as host 'sandbox' to make it easier to access your sandbox UI

* open yarn UI ports when running container

	`
docker run -it -p 8088:8088 -p 8042:8042 -p 7077:7077 -p 8080:8080 -p 9000:9000 -h sandbox dejunmeng/spark:1.6.0 bash`

	or

	`docker run -P -d -h sandbox dejunmeng/spark:1.6.0 -d`

## Versions
	Hadoop 2.6.0 and Apache Spark v1.6.0 on Centos


### Email
<martin.mengdj@gmail.com>