package com.example.messagingapp.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
public class MessageController {

    private final SimpMessagingTemplate messagingTemplate;

    public MessageController(SimpMessagingTemplate messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    @MessageMapping("/send_message")  // URL for the frontend to send a message
    public void sendMessage(String message) {
        messagingTemplate.convertAndSend("/topic/messages", message);  // Sends to a topic
    }
}
