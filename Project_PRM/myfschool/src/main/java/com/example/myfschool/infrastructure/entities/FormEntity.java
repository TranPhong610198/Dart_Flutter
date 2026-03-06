package com.example.myfschool.infrastructure.entities;

import com.example.myfschool.contract.enums.FormStatusEnum;
import com.example.myfschool.infrastructure.entities.base.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;
import java.time.LocalDateTime;

@Entity
@Table(name = "forms")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class FormEntity extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", nullable = false)
    StudentEntity student;

    @Column(name = "form_type", nullable = false)
    String formType;

    @Column(columnDefinition = "TEXT", nullable = false)
    String reason;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    @Builder.Default
    FormStatusEnum status = FormStatusEnum.PENDING;

    @Column(name = "submitted_at")
    @Builder.Default
    LocalDateTime submittedAt = LocalDateTime.now();
}