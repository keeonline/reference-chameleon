package com.keeonline.quebec.api.model;

public class GreetingsDto {

    private String id;
    private String greeting;
    
    public GreetingsDto() {}

    public GreetingsDto (String id,String greeting){
        this.id = id;
        this.greeting = greeting;
    }
    
    public String getId() {
        return id;
    }

    public String getGreeting() {
        return greeting;
    }

}
