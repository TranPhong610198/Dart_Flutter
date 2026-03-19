package com.example.myfschool_V2.repository;

import com.example.myfschool_V2.entity.Timetable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TimetableRepository extends JpaRepository<Timetable, Long> {
    List<Timetable> findByStudentIdOrderByClassTimeAsc(Long studentId);
}
