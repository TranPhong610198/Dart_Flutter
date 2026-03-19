package com.example.myfschool_V2.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GradeDTO {
    private Long id;
    private String subject;
    private String semester;
    private String schoolYear;
    private Double score;
    private String studentName;
}
