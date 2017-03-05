#!/usr/bin/env bash

/zookeeper-3.4.9/bin/zkServer.sh start-foreground &
sleep 2
/kafka_2.11-0.8.2.1/bin/kafka-server-start.sh /kafka_2.11-0.8.2.1/config/server.properties &
sleep 2
/bin/bash