FROM openjdk:alpine

#RUN wget http://apache.osuosl.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
#RUN tar -zxvf apache-maven-3.3.9-bin.tar.gz
#RUN rm apache-maven-3.3.9-bin.tar.gz
#RUN mv apache-maven-3.3.9 /usr/lib/mvn
#ENV PATH $PATH:$M2_HOME:"/usr/lib/mvn/bin"

#Install Bash
###########
RUN apk add --no-cache bash su-exec

#Install Zookeeper
#################
RUN wget -q "http://www.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz"
RUN tar -zxf zookeeper-3.4.9.tar.gz
RUN cp zookeeper-3.4.9/conf/zoo_sample.cfg zookeeper-3.4.9/conf/zoo.cfg

#Install Kafka
#############
RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"
RUN tar -xvzf kafka_2.11-0.8.2.1.tgz

#WORKDIR ./
#ADD pom.xml ./pom.xml
ADD iot-kafka-producer ./iot-kafka-producer

#RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]
#RUN ["mvn", "package"]

#Run Zookeeper And Kafka
#######################
CMD sh iot-kafka-producer/src/main/resources/entryPoint.sh

#CMD ["/bin/bash"]