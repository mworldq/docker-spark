FROM sequenceiq/spark:1.6.0
MAINTAINER Caocao <martin.mengdj@gmail.com>


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
