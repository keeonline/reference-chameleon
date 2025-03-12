package com.keeonline.quebec.api.model;

public class GreetingsDto {

    private String requestId;
    private String serviceName;
    
    public GreetingsDto() {}

    public GreetingsDto (String serviceName,String requestId){
        this.serviceName = serviceName;
        this.requestId = requestId;
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
