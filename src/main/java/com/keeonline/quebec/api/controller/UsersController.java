package com.keeonline.quebec.api.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.keeonline.quebec.api.model.UsersDto;

@RestController
@RequestMapping("/public/quebec/users")
public class UsersController {

    @GetMapping(path = "")
    public ResponseEntity<UsersDto> get() {
            return ResponseEntity.ok().body(new UsersDto());
    }
    
}
