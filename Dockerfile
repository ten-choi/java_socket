kafka-console-producer.sh --broker-list my-kafka-controller-0.my-kafka-controller-headless.default.svc.cluster.local:9092,my-kafka-controller-1.my-kafka-controller-headless.default.svc.cluster.local:9092,my-kafka-controller-2.my-kafka-controller-headless.default.svc.cluster.local:9092 --topic dev-topic

    CONSUMER:
kafka-console-consumer.sh --consumer.config /tmp/client.properties --bootstrap-server my-kafka.default.svc.cluster.local:9092 --topic test --from-beginning




kubectl cp --namespace default \te\kafka_2.13-3.7.0\config/client.properties my-kafka-client:/tmp/client.properties




security.protocol=SASL_PLAINTEXT
sasl.mechanism=SCRAM-SHA-256
sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required \
    username="user1" \
    password="$(kubectl get secret my-kafka-user-passwords --namespace default -o jsonpath='{.data.client-passwords}' | base64 -d | cut -d , -f 1)";

 vi client.properties

# ==================================================================== #
# 아래 내용 입력 후 저장

security.protocol=SASL_PLAINTEXT
sasl.mechanism=SCRAM-SHA-256
sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required \
    username="user1" \
    password="$(kubectl get secret kafka-user-passwords --namespace default -o jsonpath='{.data.client-passwords}' | base64 -d | cut -d , -f 1)";


my-kafka-controller-0.my-kafka-controller-headless.default.svc.cluster.local:9092
my-kafka.default.svc.cluster.local:9092

kafka-console-consumer.sh --consumer.config /tmp/client.properties --bootstrap-server 10.103.67.205:9092 --topic test --from-beginning
