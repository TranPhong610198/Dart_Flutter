package com.example.myfschool.infrastructure.repositories.auth;

import com.example.myfschool.infrastructure.entities.TeacherEntity;
import com.example.myfschool.infrastructure.repositories.base.BaseRepository;

import java.util.Optional;

public interface TeacherRepository extends BaseRepository<TeacherEntity> {
    Optional<TeacherEntity> findByUserId(Long userId);
}
