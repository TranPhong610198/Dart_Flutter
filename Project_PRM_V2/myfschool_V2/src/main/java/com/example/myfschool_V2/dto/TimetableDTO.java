package com.example.myfschool_V2.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TimetableDTO {
    private Long id;
    private String subject;
    private LocalDateTime classTime;
    private String room;
    private String studentName;
}
