-- ==========================================
-- 1. BẢNG KHÔNG CÓ KHÓA NGOẠI
-- ==========================================
CREATE TABLE schools (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(255) NOT NULL,
                         address VARCHAR(255),

                         created_by BIGINT,
                         created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                         modified_by BIGINT,
                         modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE users (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       phone VARCHAR(20) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       role VARCHAR(50) NOT NULL, -- Enum: ADMIN, TEACHER, STUDENT

                       created_by BIGINT,
                       created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                       modified_by BIGINT,
                       modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE subjects (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,

                          created_by BIGINT,
                          created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                          modified_by BIGINT,
                          modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP
);

-- ==========================================
-- 2. BẢNG CÓ QUAN HỆ CẤP 1
-- ==========================================
CREATE TABLE teachers (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          user_id BIGINT NOT NULL UNIQUE,
                          full_name VARCHAR(100) NOT NULL,
                          email VARCHAR(100),

                          created_by BIGINT,
                          created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                          modified_by BIGINT,
                          modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

                          FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ==========================================
-- 3. BẢNG CÓ QUAN HỆ CẤP 2
-- ==========================================
CREATE TABLE classes (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         school_id BIGINT NOT NULL,
                         name VARCHAR(50) NOT NULL,
                         homeroom_teacher_id BIGINT,

                         created_by BIGINT,
                         created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                         modified_by BIGINT,
                         modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

                         FOREIGN KEY (school_id) REFERENCES schools(id),
                         FOREIGN KEY (homeroom_teacher_id) REFERENCES teachers(id)
);

-- ==========================================
-- 4. BẢNG CÓ QUAN HỆ CẤP 3
-- ==========================================
CREATE TABLE students (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          user_id BIGINT NOT NULL UNIQUE,
                          student_code VARCHAR(50) NOT NULL UNIQUE,
                          full_name VARCHAR(100) NOT NULL,
                          class_id BIGINT,

                          created_by BIGINT,
                          created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                          modified_by BIGINT,
                          modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

                          FOREIGN KEY (user_id) REFERENCES users(id),
                          FOREIGN KEY (class_id) REFERENCES classes(id)
);

-- ==========================================
-- 5. CÁC BẢNG NGHIỆP VỤ (Nhiều khóa ngoại)
-- ==========================================
CREATE TABLE timetables (
                            id BIGINT AUTO_INCREMENT PRIMARY KEY,
                            class_id BIGINT NOT NULL,
                            subject_id BIGINT NOT NULL,
                            teacher_id BIGINT NOT NULL,
                            day_of_week VARCHAR(20) NOT NULL, -- Enum: MONDAY, TUESDAY...
                            slot INT NOT NULL,

                            created_by BIGINT,
                            created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                            modified_by BIGINT,
                            modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

                            FOREIGN KEY (class_id) REFERENCES classes(id),
                            FOREIGN KEY (subject_id) REFERENCES subjects(id),
                            FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

CREATE TABLE forms (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       student_id BIGINT NOT NULL,
                       form_type VARCHAR(100) NOT NULL,
                       reason TEXT NOT NULL,
                       status VARCHAR(50) NOT NULL DEFAULT 'PENDING', -- Enum: PENDING, APPROVED, REJECTED
                       submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,

                       created_by BIGINT,
                       created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                       modified_by BIGINT,
                       modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

                       FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE grades (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        student_id BIGINT NOT NULL,
                        subject_id BIGINT NOT NULL,
                        semester VARCHAR(50) NOT NULL, -- Enum: SEMESTER_1, SEMESTER_2
                        score_type VARCHAR(50) NOT NULL,
                        score_value DOUBLE NOT NULL,

                        created_by BIGINT,
                        created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                        modified_by BIGINT,
                        modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

                        FOREIGN KEY (student_id) REFERENCES students(id),
                        FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

-- BẢNG MỚI: ĐIỂM DANH (Attendance)
CREATE TABLE attendances (
                             id BIGINT AUTO_INCREMENT PRIMARY KEY,
                             student_id BIGINT NOT NULL,
                             date DATE NOT NULL,
                             status VARCHAR(50) NOT NULL, -- Enum: PRESENT (Có mặt), ABSENT_EXCUSED (Nghỉ có phép), ABSENT_UNEXCUSED (Nghỉ không phép), LATE (Đi muộn)
                             note TEXT, -- Ghi chú thêm nếu đi muộn hoặc lý do nghỉ

                             created_by BIGINT,
                             created_time DATETIME DEFAULT CURRENT_TIMESTAMP,
                             modified_by BIGINT,
                             modified_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

                             FOREIGN KEY (student_id) REFERENCES students(id),
                             UNIQUE (student_id, date) -- Đảm bảo mỗi học sinh chỉ có 1 record điểm danh mỗi ngày (hoặc mỗi buổi tùy cấu hình)
);