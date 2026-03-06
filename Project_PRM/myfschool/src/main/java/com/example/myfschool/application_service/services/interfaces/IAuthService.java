package com.example.myfschool.application_service.services.interfaces;

import com.example.myfschool.application_service.dtos.requests.LoginRequest;
import com.example.myfschool.application_service.dtos.responses.LoginResponse;

public interface IAuthService {
    LoginResponse login(LoginRequest request);
}