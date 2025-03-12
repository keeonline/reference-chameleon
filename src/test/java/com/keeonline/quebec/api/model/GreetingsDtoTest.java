package com.keeonline.quebec.api.model;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class GreetingsDtoTest {

    @Test
    void getGreetingsShouldReturnExpectedValue() {
        String expectedId = "AAAAAAAA-BBBBBBBB";
        String expectedGreeting = "Expected greeting!";
        GreetingsDto dto = new GreetingsDto(expectedId,expectedGreeting);
        assertEquals(expectedId, dto.getId());
        assertEquals(expectedGreeting, dto.getGreeting());
    }

}
