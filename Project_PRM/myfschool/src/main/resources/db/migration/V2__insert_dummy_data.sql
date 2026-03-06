-- 1. Insert Users (1 Admin, 2 Teacher, 2 Student)

INSERT INTO users (phone, password, role, created_by) VALUES
                                                          ('0901234567', 'admin123', 'ADMIN', 1),
                                                          ('0912345678', 'teacher123', 'TEACHER', 1),
                                                          ('0923456789', 'teacher321', 'TEACHER', 1),
                                                          ('0934567890', 'student123', 'STUDENT', 1),
                                                          ('0945678901', 'student321', 'STUDENT', 1);

-- 2. Insert Subjects
INSERT INTO subjects (name, created_by) VALUES
                                            ('Toán học', 1),
                                            ('Ngữ văn', 1),
                                            ('Tiếng Anh', 1);

-- 3. Insert Teachers
-- Teacher 1 (User ID 2)
INSERT INTO teachers (user_id, full_name, email, created_by) VALUES
                                                                 (2, 'Nguyễn Thị Thu', 'thunt@fschool.edu.vn', 1),
                                                                 (3, 'Trần Minh Tuấn', 'tuantm@fschool.edu.vn', 1);

-- 4. Insert Classes
-- Lớp 9A5, Cô Thu làm chủ nhiệm
INSERT INTO classes (name, homeroom_teacher_id, created_by) VALUES
                                                                ('9A5', 1, 1),
                                                                ('9A6', 2, 1);

-- 5. Insert Students
-- Học sinh Trần Thập Nhất (User ID 4) lớp 9A5
INSERT INTO students (user_id, student_code, full_name, class_id, created_by) VALUES
                                                                                  (4, 'HE186001', 'Trần Thập Nhất', 1, 1),
                                                                                  (5, 'HE186002', 'Trần Hảo Nhân', 1, 1);

-- 6. Insert Timetables (Thời khóa biểu lớp 9A5)
-- Sáng thứ 2, Tiết 1, Toán học (Thầy Tuấn)
INSERT INTO timetables (class_id, subject_id, teacher_id, day_of_week, slot, created_by) VALUES
                                                                                             (1, 1, 2, 'MONDAY', 1, 1),
-- Sáng thứ 2, Tiết 2, Ngữ văn (Cô Thu)
                                                                                             (1, 2, 1, 'MONDAY', 2, 1);

-- 7. Insert Assignments (BTVN)
-- Thầy Tuấn giao bài Toán cho 9A5
INSERT INTO assignments (class_id, subject_id, teacher_id, title, description, due_date, created_by) VALUES
    (1, 1, 2, 'Bài tập Đại số chương 1', 'Các em làm bài tập trang 25 SGK', '2026-03-15 23:59:00', 2);

-- 8. Insert Grades (Bảng điểm của Trần Thập Nhất)
INSERT INTO grades (student_id, subject_id, semester, score_type, score_value, created_by) VALUES
                                                                                               (1, 1, 'SEMESTER_1', 'MIENG', 8.5, 2),  -- Toán: 8.5
                                                                                               (1, 1, 'SEMESTER_1', '15P', 9.0, 2),    -- Toán: 9.0
                                                                                               (1, 2, 'SEMESTER_1', 'MIENG', 7.5, 1);  -- Văn: 7.5

-- 9. Insert Forms (Đơn từ)
-- Trần Thập Nhất xin nghỉ phép
INSERT INTO forms (student_id, form_type, reason, status, submitted_at, created_by) VALUES
    (1, 'Đơn xin phép nghỉ học', 'Em bị sốt xuất huyết, gia đình xin phép cho em nghỉ 3 ngày', 'PENDING', CURRENT_TIMESTAMP, 4);