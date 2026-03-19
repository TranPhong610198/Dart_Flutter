package com.example.myfschool_V2.service;

import com.example.myfschool_V2.dto.GradeDTO;
import com.example.myfschool_V2.entity.Grade;
import com.example.myfschool_V2.repository.GradeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class GradeService {

    private final GradeRepository gradeRepository;

    @Transactional(readOnly = true)
    public List<GradeDTO> getGradesByStudent(Long studentId) {
        return gradeRepository
                .findByStudentIdOrderBySchoolYearDescSemesterAscSubjectAsc(studentId)
                .stream().map(this::toDTO).collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<GradeDTO> getGradesByStudentFiltered(Long studentId, String semester, String schoolYear) {
        return gradeRepository
                .findByStudentIdAndSemesterAndSchoolYearOrderBySubjectAsc(studentId, semester, schoolYear)
                .stream().map(this::toDTO).collect(Collectors.toList());
    }

    private GradeDTO toDTO(Grade g) {
        return new GradeDTO(
                g.getId(),
                g.getSubject(),
                g.getSemester(),
                g.getSchoolYear(),
                g.getScore(),
                g.getStudent() != null ? g.getStudent().getFullName() : ""
        );
    }
}
