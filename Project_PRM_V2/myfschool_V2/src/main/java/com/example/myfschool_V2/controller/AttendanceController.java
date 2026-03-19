package com.example.myfschool_V2.controller;

import com.example.myfschool_V2.dto.AttendanceDTO;
import com.example.myfschool_V2.service.AttendanceService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/attendance")
@RequiredArgsConstructor
public class AttendanceController {

    private final AttendanceService attendanceService;

    // GET /api/attendance/student/{studentId}
    // Optional filter: ?year=2026&month=3
    @GetMapping("/student/{studentId}")
    public ResponseEntity<List<AttendanceDTO>> getAttendance(
            @PathVariable Long studentId,
            @RequestParam(required = false) Integer year,
            @RequestParam(required = false) Integer month) {

        if (year != null && month != null) {
            return ResponseEntity.ok(attendanceService.getAttendanceByStudentAndMonth(studentId, year, month));
        }
        return ResponseEntity.ok(attendanceService.getAttendanceByStudent(studentId));
    }
}
