package com.keeonline.quebec.api.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class GreetingsDtoTest {

    @Test
    void getGreetingsShouldReturnExpectedValue() {
        GreetingsDto dto = new GreetingsDto();
        assertEquals("Greetings from the quebec service!", dto.getGreeting());
    }

}
