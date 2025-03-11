package com.keeonline.quebec.api.model;

import java.util.UUID;

public class GreetingsDto {
    
    public String getUuid() {
        return UUID.randomUUID().toString();
    }

    public String getGreeting() {
        return "Greetings from the quebec service!";
    }

}
