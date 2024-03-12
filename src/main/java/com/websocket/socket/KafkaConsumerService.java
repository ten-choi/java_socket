package com.websocket.socket;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumerService {
    @KafkaListener(topics = "dev", groupId = "test-consumer-group")
    public void consume(String message){
        System.out.println("Received Message in group 'test-consumer-group': " + message);
    }
}