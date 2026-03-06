package com.example.myfschool.api.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

@Configuration
@RequiredArgsConstructor
public class AuditorAwareConfig implements AuditorAware<Long> {
    @Override
    public Optional<Long> getCurrentAuditor() {
        // Sau này sẽ lấy ID của người dùng đang đăng nhập
        Long systemId = 1L;
        return Optional.ofNullable(systemId);
    }
}

