package com.example.myfschool.infrastructure.entities;

import com.example.myfschool.contract.enums.SemesterEnum;
import com.example.myfschool.infrastructure.entities.base.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "grades")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class GradeEntity extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "student_id", nullable = false)
    StudentEntity student;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "subject_id", nullable = false)
    SubjectEntity subject;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    SemesterEnum semester;

    @Column(name = "score_type", nullable = false)
    String scoreType;

    @Column(name = "score_value", nullable = false)
    Double scoreValue;
}