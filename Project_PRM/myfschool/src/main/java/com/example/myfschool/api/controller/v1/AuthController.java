package com.example.myfschool.api.controller.v1;

import com.example.myfschool.application_service.dtos.requests.LoginRequest;
import com.example.myfschool.application_service.dtos.responses.LoginResponse;
import com.example.myfschool.application_service.services.interfaces.IAuthService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthController {

    private final IAuthService authService;


    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {
        LoginResponse response = authService.login(request);
        return ResponseEntity.ok(response);
    }
}