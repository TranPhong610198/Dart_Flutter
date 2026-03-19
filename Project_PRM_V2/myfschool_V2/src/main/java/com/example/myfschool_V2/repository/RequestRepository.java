package com.example.myfschool_V2.repository;

import com.example.myfschool_V2.entity.Request;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RequestRepository extends JpaRepository<Request, Long> {
    // All requests submitted by a specific parent, newest first
    List<Request> findByParentIdOrderByIdDesc(Long parentId);
}
