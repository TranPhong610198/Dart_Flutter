CREATE TABLE roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role_id BIGINT NOT NULL,
    token VARCHAR(255),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

CREATE TABLE parent_student (
    parent_id BIGINT NOT NULL,
    student_id BIGINT NOT NULL,
    PRIMARY KEY (parent_id, student_id),
    FOREIGN KEY (parent_id) REFERENCES users(id),
    FOREIGN KEY (student_id) REFERENCES users(id)
);

CREATE TABLE timetables (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    subject VARCHAR(100) NOT NULL,
    class_time DATETIME NOT NULL,
    room VARCHAR(50) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES users(id)
);

CREATE TABLE grades (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    subject VARCHAR(100) NOT NULL,
    semester VARCHAR(20) NOT NULL,
    school_year VARCHAR(20) NOT NULL,
    score DOUBLE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES users(id)
);

CREATE TABLE attendance (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id BIGINT NOT NULL,
    date DATE NOT NULL,
    status ENUM('PRESENT', 'ABSENT_WITH_PERMISSION', 'ABSENT_WITHOUT_PERMISSION') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES users(id)
);

CREATE TABLE requests (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    parent_id BIGINT NOT NULL,
    student_id BIGINT NOT NULL,
    type_of_request VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING',
    content TEXT,
    FOREIGN KEY (parent_id) REFERENCES users(id),
    FOREIGN KEY (student_id) REFERENCES users(id)
);

CREATE TABLE notifications (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert roles
INSERT INTO roles (name) VALUES ('ROLE_CHILDREN'), ('ROLE_TEACHER'), ('ROLE_PARENTS');

-- Mock data for testing
INSERT INTO users (phone, password, full_name, role_id) VALUES 
('0987654321', '123456', 'Phu Huynh A', 3),
('0123456789', '123456', 'Hoc Sinh 1', 1),
('0123456788', '123456', 'Hoc Sinh 2', 1),
('0999888777', '123456', 'Giao Vien 1', 2);

INSERT INTO parent_student (parent_id, student_id) VALUES 
(1, 2),
(1, 3);

-- Mock notifications
INSERT INTO notifications (title, content, created_at) VALUES 
('Thông báo tựu trường', 'Nhà trường trân trọng thông báo lịch tựu trường năm học mới sẽ bắt đầu vào ngày 05/09. Học sinh vui lòng có mặt lúc 7:00 sáng.', CURRENT_TIMESTAMP),
('Đóng học phí tháng 9', 'Kính gửi quý phụ huynh, vui lòng hoàn tất đóng học phí tháng 9 trước ngày 15/09.', CURRENT_TIMESTAMP);
