package com.keeonline.chameleon.api.v2.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.keeonline.chameleon.api.v2.model.GreetingsDto;

import io.opentelemetry.api.trace.Span;
import io.opentelemetry.instrumentation.annotations.WithSpan;

@RestController("GreetingsV2")
@RequestMapping("/v2/greetings")
public class GreetingsController {

    @Value("${spring.application.name}")
    private String serviceName;

    @GetMapping(path = "")
    // @WithSpan(value = "/v2/greetings")
    public ResponseEntity<GreetingsDto> get() {

        GreetingsDto dto = new GreetingsDto(serviceName);

        // Span span = Span.current();
        // span.setAttribute("application.request_id", dto.getRequestId());

        return ResponseEntity.ok().body(dto);
    }

}
