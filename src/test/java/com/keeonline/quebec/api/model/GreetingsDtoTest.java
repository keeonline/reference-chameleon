package com.keeonline.quebec.api.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class GreetingsDtoTest {

    @Test
    void getGreetingsShouldReturnExpectedValue() {
        String expectedId = "AAAAAAAA-BBBBBBBB";
        String expectedGreeting = "This is the carlos-fandango service!";
        GreetingsDto dto = new GreetingsDto("carlos-fandango",expectedId);
        assertEquals(expectedId, dto.getRequestId());
        assertEquals(expectedGreeting, dto.getGreeting());
    }

}
