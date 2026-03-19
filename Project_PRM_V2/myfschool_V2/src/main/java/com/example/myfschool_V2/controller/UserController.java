package com.example.myfschool_V2.controller;

import com.example.myfschool_V2.dto.UserDTO;
import com.example.myfschool_V2.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/parents/{parentId}/children")
    public ResponseEntity<?> getChildrenByParent(@PathVariable Long parentId) {
        try {
            List<UserDTO> children = userService.getChildrenByParentId(parentId);
            return ResponseEntity.ok(children);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
