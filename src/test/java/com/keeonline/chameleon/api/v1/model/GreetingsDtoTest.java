package com.keeonline.chameleon.api.v1.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class GreetingsDtoTest {

    @Test
    void shouldReturnCustomisedGreeting() {
        GreetingsDto dto = new GreetingsDto("carlos-v0.0.61");
        assertEquals("This is the carlos-v0.0.61 service!", dto.getMessage());
    }

}
