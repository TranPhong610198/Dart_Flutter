package com.example.myfschool_V2.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class AuthResponse {
    private String token;
    private Long id;
    private String phone;
    private String fullName;
    private String role;
}
