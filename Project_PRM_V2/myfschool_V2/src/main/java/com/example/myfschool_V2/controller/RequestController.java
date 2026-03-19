package com.example.myfschool_V2.controller;

import com.example.myfschool_V2.dto.CreateRequestDTO;
import com.example.myfschool_V2.dto.RequestDTO;
import com.example.myfschool_V2.service.RequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/requests")
@RequiredArgsConstructor
public class RequestController {

    private final RequestService requestService;

    // GET /api/requests/parent/{parentId}  — list all requests by this parent
    @GetMapping("/parent/{parentId}")
    public ResponseEntity<List<RequestDTO>> getRequestsByParent(@PathVariable Long parentId) {
        return ResponseEntity.ok(requestService.getRequestsByParent(parentId));
    }

    // POST /api/requests  — create a new request (Parents only, enforced in Flutter UI)
    @PostMapping
    public ResponseEntity<RequestDTO> createRequest(@RequestBody CreateRequestDTO dto) {
        return ResponseEntity.ok(requestService.createRequest(dto));
    }
}
