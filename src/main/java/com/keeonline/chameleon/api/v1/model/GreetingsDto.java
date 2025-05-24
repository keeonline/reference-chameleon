package com.keeonline.chameleon.api.v1.model;

import java.util.UUID;

public class GreetingsDto {

    private final int version = 1;
    private String serviceName;
    private String requestId;

    public GreetingsDto (String serviceName) {
        this.serviceName = serviceName;
        this.requestId = UUID.randomUUID().toString();
    }
    
    public int getVersion() {
        return version;
    }

    public String getServiceName() {
        return serviceName;
    }

    public String getRequestId() {
        return requestId;
    }

    public String getMessage() {
        return String.format("This is the %s service!",serviceName);
    }

}
