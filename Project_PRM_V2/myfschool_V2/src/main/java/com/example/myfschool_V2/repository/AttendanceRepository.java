package com.example.myfschool_V2.repository;

import com.example.myfschool_V2.entity.Attendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Long> {
    // All attendance records for a student, newest first
    List<Attendance> findByStudentIdOrderByDateDesc(Long studentId);

    // Filter by month/year
    List<Attendance> findByStudentIdAndDateBetweenOrderByDateDesc(
            Long studentId, LocalDate startDate, LocalDate endDate);
}
