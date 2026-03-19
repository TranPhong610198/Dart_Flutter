package com.example.myfschool_V2.repository;

import com.example.myfschool_V2.entity.Grade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GradeRepository extends JpaRepository<Grade, Long> {
    // Fetch all grades for a student
    List<Grade> findByStudentIdOrderBySchoolYearDescSemesterAscSubjectAsc(Long studentId);

    // Fetch grades filtered by semester AND school year
    List<Grade> findByStudentIdAndSemesterAndSchoolYearOrderBySubjectAsc(
            Long studentId, String semester, String schoolYear);
}
