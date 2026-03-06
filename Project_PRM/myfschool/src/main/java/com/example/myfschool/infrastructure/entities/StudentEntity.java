package com.example.myfschool.infrastructure.entities;

import com.example.myfschool.infrastructure.entities.auth.UserEntity;
import com.example.myfschool.infrastructure.entities.base.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "students") // Đã sửa từ teachers
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class StudentEntity extends BaseEntity {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    UserEntity user;

    @Column(name = "student_code", unique = true, nullable = false)
    String studentCode;

    @Column(name = "full_name", nullable = false)
    String fullName;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "class_id")
    ClassEntity classOfStudent; // Đã sửa viết thường chữ c
}