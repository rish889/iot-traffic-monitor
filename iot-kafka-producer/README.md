#iot-kafka-producer

docker build -t rish889/iot-kafka-producer .

docker rm iot-kafka-producer

docker run --name iot-traffic-monitor -it rish889/iot-kafka-producer

docker exec -it iot-kafka-producer bash

echo "Hello, World" | /kafka_2.11-0.8.2.1/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic TutorialTopic > /dev/null

/kafka_2.11-0.8.2.1/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic TutorialTopic --from-beginning
