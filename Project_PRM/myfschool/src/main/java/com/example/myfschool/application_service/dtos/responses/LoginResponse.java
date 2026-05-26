package com.example.myfschool.application_service.dtos.responses;

import com.example.myfschool.application_service.dtos.responses.base.BaseResponse;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class LoginResponse extends BaseResponse {
    String accessToken;
    String role;
    String fullName;
    String code;
    String className;
    String schoolName;
}
