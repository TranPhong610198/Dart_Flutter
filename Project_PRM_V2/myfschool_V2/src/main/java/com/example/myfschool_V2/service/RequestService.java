package com.example.myfschool_V2.service;

import com.example.myfschool_V2.dto.CreateRequestDTO;
import com.example.myfschool_V2.dto.RequestDTO;
import com.example.myfschool_V2.entity.Request;
import com.example.myfschool_V2.entity.User;
import com.example.myfschool_V2.repository.RequestRepository;
import com.example.myfschool_V2.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RequestService {

    private final RequestRepository requestRepository;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<RequestDTO> getRequestsByParent(Long parentId) {
        return requestRepository.findByParentIdOrderByIdDesc(parentId)
                .stream().map(this::toDTO).collect(Collectors.toList());
    }

    @Transactional
    public RequestDTO createRequest(CreateRequestDTO dto) {
        User parent = userRepository.findById(dto.getParentId())
                .orElseThrow(() -> new RuntimeException("Parent not found with id: " + dto.getParentId()));
        User student = userRepository.findById(dto.getStudentId())
                .orElseThrow(() -> new RuntimeException("Student not found with id: " + dto.getStudentId()));

        Request request = new Request();
        request.setParent(parent);
        request.setStudent(student);
        request.setTypeOfRequest(dto.getTypeOfRequest());
        request.setContent(dto.getContent());
        request.setStatus("PENDING");

        return toDTO(requestRepository.save(request));
    }

    private RequestDTO toDTO(Request r) {
        return new RequestDTO(
                r.getId(),
                r.getTypeOfRequest(),
                r.getStatus(),
                r.getContent(),
                r.getParent() != null ? r.getParent().getFullName() : "",
                r.getStudent() != null ? r.getStudent().getFullName() : ""
        );
    }
}
