package com.keeonline.quebec.api.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.keeonline.quebec.api.model.GreetingsDto;

@RestController
@RequestMapping("/public/quebec/greetings")
public class GreetingsController {

    @GetMapping(path = "")
    public ResponseEntity<GreetingsDto> get() {
            return ResponseEntity.ok().body(new GreetingsDto());
    }
    
}
