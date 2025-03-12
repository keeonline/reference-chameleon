package com.keeonline.chameleon.api.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class GreetingsDtoTest {

    @Test
    void getGreetingsShouldReturnExpectedValue() {
        GreetingsDto dto = new GreetingsDto("carlos-fandango");
        assertEquals("This is the carlos-fandango service!", dto.getGreeting());
    }

}
