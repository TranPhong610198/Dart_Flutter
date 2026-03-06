-- ==========================================
-- 1. Insert Schools (Cơ sở trường học)
-- ==========================================
INSERT INTO schools (name, address, created_by) VALUES
                                                    ('FSchool Hòa Lạc - THCS', 'Khu Công nghệ cao Hòa Lạc, Thạch Thất, Hà Nội', 1),
                                                    ('FSchool Cầu Giấy - THCS', 'Số 15 Đông Quan, Cầu Giấy, Hà Nội', 1);

-- ==========================================
-- 2. Insert Users (1 Admin, 2 Teacher, 2 Student)
-- Pass "123456" hash = $2a$10$Dow.y1uSj.sKz5.3Z3i1n.S/uI0r1.zM1D6N1I3i1D4g.p2Z5Z9qO
-- ==========================================
INSERT INTO users (phone, password, role, created_by) VALUES
                                                          ('0901234567', 'admin123', 'ADMIN', 1),
                                                          ('0912345678', 'teacher123', 'TEACHER', 1),
                                                          ('0923456789', 'teacher321', 'TEACHER', 1),
                                                          ('0934567890', 'student123', 'STUDENT', 1),
                                                          ('0945678901', 'student321', 'STUDENT', 1);

-- ==========================================
-- 3. Insert Subjects (Môn học)
-- ==========================================
INSERT INTO subjects (name, created_by) VALUES
                                            ('Toán học', 1),
                                            ('Ngữ văn', 1),
                                            ('Tiếng Anh', 1);

-- ==========================================
-- 4. Insert Teachers (Giáo viên)
-- ==========================================
INSERT INTO teachers (user_id, full_name, email, created_by) VALUES
                                                                 (2, 'Nguyễn Thị Thu', 'thunt@fschool.edu.vn', 1),
                                                                 (3, 'Trần Minh Tuấn', 'tuantm@fschool.edu.vn', 1);

-- ==========================================
-- 5. Insert Classes (Lớp học - có school_id)
-- ==========================================
INSERT INTO classes (school_id, name, homeroom_teacher_id, created_by) VALUES
                                                                           (1, '9A5', 1, 1), -- Thuộc FSchool Hòa Lạc, GV Thu chủ nhiệm
                                                                           (1, '9A6', 2, 1);

-- ==========================================
-- 6. Insert Students (Học sinh)
-- ==========================================
INSERT INTO students (user_id, student_code, full_name, class_id, created_by) VALUES
                                                                                  (4, 'HE186001', 'Trần Thập Nhất', 1, 1),
                                                                                  (5, 'HE186002', 'Lê Hải Đăng', 1, 1);

-- ==========================================
-- 7. Insert Timetables (Thời khóa biểu)
-- ==========================================
INSERT INTO timetables (class_id, subject_id, teacher_id, day_of_week, slot, created_by) VALUES
                                                                                             (1, 1, 2, 'MONDAY', 1, 1),
                                                                                             (1, 2, 1, 'MONDAY', 2, 1);

-- ==========================================
-- 8. Insert Grades (Bảng điểm)
-- ==========================================
INSERT INTO grades (student_id, subject_id, semester, score_type, score_value, created_by) VALUES
                                                                                               (1, 1, 'SEMESTER_1', 'MIENG', 8.5, 2),
                                                                                               (1, 1, 'SEMESTER_1', '15P', 9.0, 2),
                                                                                               (1, 2, 'SEMESTER_1', 'MIENG', 7.5, 1);

-- ==========================================
-- 9. Insert Forms (Đơn từ)
-- ==========================================
INSERT INTO forms (student_id, form_type, reason, status, submitted_at, created_by) VALUES
    (1, 'Đơn xin phép nghỉ học', 'Em bị ốm', 'PENDING', CURRENT_TIMESTAMP, 4);

-- ==========================================
-- 10. Insert Attendances (Điểm danh ngày hôm nay)
-- ==========================================
INSERT INTO attendances (student_id, date, status, note, created_by) VALUES
                                                                         (1, CURRENT_DATE, 'PRESENT', NULL, 2),                  -- Trần Thập Nhất: Có mặt
                                                                         (2, CURRENT_DATE, 'ABSENT_EXCUSED', 'Sốt virus', 2);      -- Lê Hải Đăng: Nghỉ có phép