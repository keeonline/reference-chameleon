package com.keeonline.chameleon.api.model;

import java.util.UUID;

public class GreetingsDto {

    private String serviceName;
    private String requestId;

    public GreetingsDto (String serviceName) {
        this.serviceName = serviceName;
        this.requestId = UUID.randomUUID().toString();
    }
    
    public String getServiceName() {
        return serviceName;
    }

    public String getRequestId() {
        return requestId;
    }

    public String getGreeting() {
        return String.format("This is the %s service!",serviceName);
    }

}
