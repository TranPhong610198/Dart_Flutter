package com.example.myfschool_V2.controller;

import com.example.myfschool_V2.dto.TimetableDTO;
import com.example.myfschool_V2.service.TimetableService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/timetables")
@RequiredArgsConstructor
public class TimetableController {

    private final TimetableService timetableService;

    // GET /api/timetables/student/{studentId}
    @GetMapping("/student/{studentId}")
    public ResponseEntity<List<TimetableDTO>> getTimetableByStudent(@PathVariable Long studentId) {
        return ResponseEntity.ok(timetableService.getTimetableByStudent(studentId));
    }
}
