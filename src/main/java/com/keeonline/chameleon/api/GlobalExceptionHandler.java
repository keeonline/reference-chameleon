package com.keeonline.chameleon.api;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler({NoHandlerFoundException.class})
    public void onRequestHandlerNotFound(NoHandlerFoundException e) {
        throw new ResponseStatusException(HttpStatus.NOT_FOUND,"Actor Not Found",e);
    }

    @ExceptionHandler({RuntimeException.class})
    public void onRuntimeException(RuntimeException e) {
        throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR,"System Error",e);
    }
    
}