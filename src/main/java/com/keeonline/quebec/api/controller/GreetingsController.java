package com.keeonline.quebec.api.controller;

import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.keeonline.quebec.api.model.GreetingsDto;

import io.opentelemetry.api.trace.Span;
import io.opentelemetry.instrumentation.annotations.WithSpan;

@RestController
@RequestMapping("/public/quebec/greetings")
public class GreetingsController {

    @GetMapping(path = "")
    @WithSpan(value = "/greetings")
    public ResponseEntity<GreetingsDto> get() {

        Span span = Span.current();
        span.setAttribute("application.request_id",UUID.randomUUID().toString());

        return ResponseEntity.ok().body(new GreetingsDto());
    }
    
}
