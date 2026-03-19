package com.example.myfschool_V2.service;

import com.example.myfschool_V2.dto.TimetableDTO;
import com.example.myfschool_V2.entity.Timetable;
import com.example.myfschool_V2.repository.TimetableRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TimetableService {

    private final TimetableRepository timetableRepository;

    @Transactional(readOnly = true)
    public List<TimetableDTO> getTimetableByStudent(Long studentId) {
        return timetableRepository.findByStudentIdOrderByClassTimeAsc(studentId)
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    private TimetableDTO toDTO(Timetable t) {
        return new TimetableDTO(
                t.getId(),
                t.getSubject(),
                t.getClassTime(),
                t.getRoom(),
                t.getStudent() != null ? t.getStudent().getFullName() : ""
        );
    }
}
