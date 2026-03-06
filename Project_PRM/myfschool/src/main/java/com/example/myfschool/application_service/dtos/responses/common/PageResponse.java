package com.naho.application_service.dtos.responses.common;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class PageResponse<T> {
    Integer currentPage;
    Integer pageSize;
    Integer totalPages;
    Long totalElements;
    T content;
}
