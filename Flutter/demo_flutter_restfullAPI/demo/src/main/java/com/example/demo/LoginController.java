package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*") // Cho phép mọi FE gọi vào API này mà không bị lỗi CORS
public class LoginController {

    // Tiêm (Inject) kho dữ liệu vào đây
    @Autowired
    private UserRepository userRepository;

    // Đây là Endpoint để Flutter gọi vào
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {

        // 1. Tìm user trong Database dựa vào username người dùng nhập
        Optional<User> userOptional = userRepository.findByUsername(request.getUsername());

        // 2. Kiểm tra xem user có tồn tại không và password có khớp không
        if (userOptional.isPresent()) {
            User userFromDb = userOptional.get();

            // KINH NGHIỆM: Trong thực tế ta phải dùng BCrypt để so sánh mật khẩu đã mã hóa.
            // Ở đây test luồng nên ta so sánh chuỗi thô (plain text).
            if (userFromDb.getPassword().equals(request.getPassword())) {
                return ResponseEntity.ok(new LoginResponse(true, "Đăng nhập thành công!", "TOKEN_THAT_123"));
            }
        }

        // Nếu sai user hoặc sai pass
        return ResponseEntity.status(401).body(new LoginResponse(false, "Sai tài khoản hoặc mật khẩu", null));
    }

    // --- Các class DTO (Data Transfer Object) dùng để map JSON ---

    // Class hứng dữ liệu FE gửi lên
    public static class LoginRequest {
        private String username;
        private String password;

        public String getUsername() { return username; }
        public void setUsername(String username) { this.username = username; }
        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
    }

    // Class đóng gói dữ liệu BE trả về cho FE
    public static class LoginResponse {
        private boolean success;
        private String message;
        private String token; // Token để FE giữ lại cho các lần gọi API sau

        public LoginResponse(boolean success, String message, String token) {
            this.success = success;
            this.message = message;
            this.token = token;
        }

        public boolean isSuccess() { return success; }
        public String getMessage() { return message; }
        public String getToken() { return token; }
    }
}