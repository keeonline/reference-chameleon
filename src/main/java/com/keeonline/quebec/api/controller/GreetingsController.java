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
@RequestMapping("/greetings")
public class GreetingsController {

    private String serviceName;

    public GreetingsController() {
        this.serviceName = System.getenv("SERVICE_NAME") == null ? "noname" : System.getenv("SERVICE_NAME") ;
    }

    @GetMapping(path = "")
    @WithSpan(value = "/greetings")
    public ResponseEntity<GreetingsDto> get() {

        GreetingsDto dto = new GreetingsDto(serviceName,UUID.randomUUID().toString());

        Span span = Span.current();
        span.setAttribute("application.request_id",dto.getRequestId());

        return ResponseEntity.ok().body(dto);
    }
    
}
