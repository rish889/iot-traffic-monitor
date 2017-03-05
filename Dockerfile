FROM openjdk:alpine

Install Bash
###########
RUN apk add --no-cache bash su-exec

Install Zookeeper
#################
RUN wget -q "http://www.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz"
RUN tar -zxf zookeeper-3.4.9.tar.gz
RUN cp zookeeper-3.4.9/conf/zoo_sample.cfg zookeeper-3.4.9/conf/zoo.cfg

Install Kafka
#############
RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
RUN tar -xvzf kafka_2.11-0.8.2.1.tgz

Run Zookeeper And Kafka
#######################
CMD /zookeeper-3.4.9/bin/zkServer.sh start-foreground & /kafka_2.11-0.8.2.1/bin/kafka-server-start.sh /kafka_2.11-0.8.2.1/config/server.properties

#CMD ["/bin/bash"]