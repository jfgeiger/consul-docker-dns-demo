package com.example.greeter.receiver.controller;


import java.text.MessageFormat;
import java.util.logging.Logger;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetReceiverController {

  private static final Logger LOGGER = Logger.getLogger(GreetReceiverController.class.getName());

  @PostMapping
  public void greet(@RequestBody final String message) {
    LOGGER.info(MessageFormat.format("POST /: {0}", message));
  }
}

