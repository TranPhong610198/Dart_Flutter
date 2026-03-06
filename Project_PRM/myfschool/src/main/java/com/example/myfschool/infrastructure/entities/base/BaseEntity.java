package com.example.myfschool.infrastructure.entities.base;



import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.Instant;


@MappedSuperclass
@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
@EntityListeners(AuditingEntityListener.class)
public class BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    // Id của User tạo ra entity
    @CreatedBy
    @Column(nullable = false, updatable = false, name = "created_by")
    Long createdBy;

    @CreatedDate
    @Column(nullable = false, updatable = false, name = "created_time")
    Instant createdTime;

    // Id của User sửa entity
    @LastModifiedBy
    @Column(insertable = false, name = "modified_by")
    Long modifiedBy;

    @LastModifiedDate
    @Column(insertable = false, name = "modified_time")
    Instant modifiedTime;
}
