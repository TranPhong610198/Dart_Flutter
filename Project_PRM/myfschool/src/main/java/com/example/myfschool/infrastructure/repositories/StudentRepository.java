package com.example.myfschool.infrastructure.repositories;

import com.example.myfschool.infrastructure.entities.StudentEntity;
import com.example.myfschool.infrastructure.repositories.base.BaseRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface StudentRepository extends BaseRepository<StudentEntity> {
    // JOIN FETCH giúp lấy luôn dữ liệu Class và School trong 1 lần query xuống DB
    @Query("SELECT s FROM StudentEntity s " +
            "LEFT JOIN FETCH s.classOfStudent c " +
            "LEFT JOIN FETCH c.school " +
            "WHERE s.user.id = :userId")
    Optional<StudentEntity> findByUserIdWithDetails(@Param("userId") Long userId);
}
