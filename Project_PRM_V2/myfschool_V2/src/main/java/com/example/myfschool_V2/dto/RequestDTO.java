package com.example.myfschool_V2.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RequestDTO {
    private Long id;
    private String typeOfRequest;
    private String status;
    private String content;
    private String parentName;
    private String studentName;
}
