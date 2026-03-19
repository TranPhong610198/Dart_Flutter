package com.example.myfschool_V2.service;

import com.example.myfschool_V2.dto.AttendanceDTO;
import com.example.myfschool_V2.entity.Attendance;
import com.example.myfschool_V2.repository.AttendanceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AttendanceService {

    private final AttendanceRepository attendanceRepository;

    @Transactional(readOnly = true)
    public List<AttendanceDTO> getAttendanceByStudent(Long studentId) {
        return attendanceRepository.findByStudentIdOrderByDateDesc(studentId)
                .stream().map(this::toDTO).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<AttendanceDTO> getAttendanceByStudentAndMonth(Long studentId, int year, int month) {
        LocalDate startDate = LocalDate.of(year, month, 1);
        LocalDate endDate = startDate.withDayOfMonth(startDate.lengthOfMonth());
        return attendanceRepository
                .findByStudentIdAndDateBetweenOrderByDateDesc(studentId, startDate, endDate)
                .stream().map(this::toDTO).collect(Collectors.toList());
    }

    private AttendanceDTO toDTO(Attendance a) {
        return new AttendanceDTO(
                a.getId(),
                a.getDate(),
                a.getStatus() != null ? a.getStatus().name() : "",
                a.getStudent() != null ? a.getStudent().getFullName() : ""
        );
    }
}
