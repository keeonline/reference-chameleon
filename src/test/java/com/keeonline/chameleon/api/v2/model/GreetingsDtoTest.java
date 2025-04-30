package com.keeonline.chameleon.api.v2.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class GreetingsDtoTest {

    @Test
    void shouldReturnCustomisedGreeting() {
        GreetingsDto dto = new GreetingsDto("carlos-fandango");
        assertEquals("This is the carlos-fandango service!", dto.getGreeting());
    }

}
