package com.example.myfschool_V2.service;

import com.example.myfschool_V2.dto.UserDTO;
import com.example.myfschool_V2.entity.User;
import com.example.myfschool_V2.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<UserDTO> getChildrenByParentId(Long parentId) {
        User parent = userRepository.findById(parentId)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy phụ huynh"));

        if (!"ROLE_PARENTS".equals(parent.getRole().getName())) {
            throw new RuntimeException("Người dùng không phải là phụ huynh");
        }

        return parent.getChildren().stream()
                .map(child -> new UserDTO(child.getId(), child.getPhone(), child.getFullName(), child.getRole().getName()))
                .collect(Collectors.toList());
    }
}
