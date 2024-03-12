package com.websocket.socket;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class KafkaContorller {
    private final KafkaProducerService producer;

    @PostMapping("/send")
    public void send(@RequestParam("message") String message){
        producer.sendMessage("dev",message);
    }
}