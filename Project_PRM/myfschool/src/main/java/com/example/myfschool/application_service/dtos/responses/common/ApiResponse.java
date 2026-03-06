package com.example.myfschool.application_service.dtos.responses.common;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ApiResponse<T> {
    @Builder.Default
    Integer statusCode = 200;
    String devMessage;
    String clientMessage;
    T data;
}
