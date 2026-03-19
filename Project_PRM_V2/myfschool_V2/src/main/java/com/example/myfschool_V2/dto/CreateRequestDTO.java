package com.example.myfschool_V2.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreateRequestDTO {
    private Long parentId;
    private Long studentId;
    private String typeOfRequest;
    private String content;
}
