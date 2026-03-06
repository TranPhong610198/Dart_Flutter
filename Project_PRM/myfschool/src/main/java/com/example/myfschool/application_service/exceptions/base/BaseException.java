package com.example.myfschool.application_service.exceptions.base;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.experimental.FieldDefaults;

@Getter
@FieldDefaults(makeFinal = true, level = AccessLevel.PRIVATE)
public class BaseException extends RuntimeException {
    String devMessage;
    String clientMessage;

    public BaseException(String devMessage, String clientMessage) {
        super(devMessage);
        this.devMessage = devMessage;
        this.clientMessage = clientMessage;
    }
}
