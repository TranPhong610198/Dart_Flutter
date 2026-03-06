package com.example.myfschool.infrastructure.repositories;

import com.example.myfschool.infrastructure.entities.UserEntity;
import com.example.myfschool.infrastructure.repositories.base.BaseRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends BaseRepository<UserEntity> {
    Optional<UserEntity> findByPhone(String phone);
}
