FROM sequenceiq/hadoop-docker:2.6.0
MAINTAINER Caocao <martin.mengdj@gmail.com>

#support for Hadoop 2.6.0
RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.6.1-bin-hadoop2.6.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s spark-1.6.1-bin-hadoop2.6 spark
ENV SPARK_HOME /usr/local/spark
RUN mkdir $SPARK_HOME/yarn-remote-client
ADD yarn-remote-client $SPARK_HOME/yarn-remote-client

RUN $BOOTSTRAP && $HADOOP_PREFIX/bin/hadoop dfsadmin -safemode leave && $HADOOP_PREFIX/bin/hdfs dfs -put $SPARK_HOME-1.6.1-bin-hadoop2.6/lib /spark

ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin
# update boot script
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

#install R
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install R

#Update jdk from 1.5 to 1.7
RUN rm /usr/bin/java
RUN ln -s /usr/java/default/bin/java /usr/bin/java

#Needed for passwd
RUN yum -y reinstall cracklib-dicts

EXPOSE 2122
EXPOSE 7077
EXPOSE 8042
EXPOSE 8080
EXPOSE 8088
EXPOSE 9000

ENTRYPOINT ["/etc/bootstrap.sh"]
