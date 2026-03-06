package com.example.myfschool.infrastructure.entities;

import com.example.myfschool.infrastructure.entities.base.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Table(name = "schools")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class SchoolEntity extends BaseEntity {

    @Column(nullable = false)
    String name;

    String address;
}