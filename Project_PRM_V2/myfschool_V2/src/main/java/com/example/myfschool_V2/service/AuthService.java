package com.example.myfschool_V2.service;

import com.example.myfschool_V2.dto.AuthRequest;
import com.example.myfschool_V2.dto.AuthResponse;
import com.example.myfschool_V2.entity.User;
import com.example.myfschool_V2.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class AuthService {

    private final UserRepository userRepository;

    public AuthService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public AuthResponse login(AuthRequest request) {
        User user = userRepository.findByPhone(request.getPhone())
                .orElseThrow(() -> new RuntimeException("Tài khoản không tồn tại"));

        if (!user.getPassword().equals(request.getPassword())) {
            throw new RuntimeException("Mật khẩu không chính xác");
        }

        String token = UUID.randomUUID().toString();
        user.setToken(token);
        userRepository.save(user);

        return new AuthResponse(token, user.getId(), user.getPhone(), user.getFullName(), user.getRole().getName());
    }
}
