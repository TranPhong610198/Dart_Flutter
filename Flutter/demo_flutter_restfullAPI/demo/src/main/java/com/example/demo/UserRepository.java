package com.example.demo;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

// Chỉ cần khai báo interface, Spring Boot sẽ tự viết code thực thi ngầm!
public interface UserRepository extends JpaRepository<User, Long> {

    // Phép thuật của JPA: Bạn đặt tên hàm đúng quy tắc "findBy + TênCột",
    // nó tự dịch thành lệnh: SELECT * FROM users WHERE username = ?
    Optional<User> findByUsername(String username);
}