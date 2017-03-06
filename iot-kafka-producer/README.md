#iot-kafka-producer

docker build -t rish889/iot-kafka-producer .

docker rm iot-kafka-producer

docker run --name iot-kafka-producer -it rish889/iot-kafka-producer

docker exec -it iot-kafka-producer bash