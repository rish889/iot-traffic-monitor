#!/usr/bin/env bash

/zookeeper-3.4.9/bin/zkServer.sh start-foreground &
sleep 2
/kafka_2.11-0.8.2.1/bin/kafka-server-start.sh /kafka_2.11-0.8.2.1/config/server.properties &
sleep 5

#echo "Hello, World" | /kafka_2.11-0.8.2.1/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic
#/kafka_2.11-0.8.2.1/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic iot-data-event --from-beginning

/kafka_2.11-0.8.2.1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic iot-data-event
sleep 2

java -jar  /target/iot-kafka-producer-1.0-SNAPSHOT.jar

# /bin/bash