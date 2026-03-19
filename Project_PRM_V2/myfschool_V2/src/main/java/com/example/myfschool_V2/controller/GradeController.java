package com.example.myfschool_V2.controller;

import com.example.myfschool_V2.dto.GradeDTO;
import com.example.myfschool_V2.service.GradeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/grades")
@RequiredArgsConstructor
public class GradeController {

    private final GradeService gradeService;

    // GET /api/grades/student/{studentId}
    // Optional query params: ?semester=HK1&year=2024-2025
    @GetMapping("/student/{studentId}")
    public ResponseEntity<List<GradeDTO>> getGrades(
            @PathVariable Long studentId,
            @RequestParam(required = false) String semester,
            @RequestParam(required = false) String year) {

        if (semester != null && year != null) {
            return ResponseEntity.ok(gradeService.getGradesByStudentFiltered(studentId, semester, year));
        }
        return ResponseEntity.ok(gradeService.getGradesByStudent(studentId));
    }
}
