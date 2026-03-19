-- ============================================================
-- V2: Comprehensive Test Data for Many-to-Many Verification
-- ============================================================
-- Scenario: 2 parents (Ba Nguyen & Me Nguyen) share 1 child (Hoc Sinh Chung)
-- Plus additional isolated parent-child pairs for regression testing
-- ============================================================

-- Additional users
-- NOTE: Existing V1 inserts: id 1=PhuHuynhA(parent), 2=HocSinh1, 3=HocSinh2, 4=GiaoVien1
INSERT INTO users (phone, password, full_name, role_id) VALUES
-- Many-to-Many test: shared child
('0911000001', '123456', 'Nguyen Van Ba',   3),  -- id=5, Father  (ROLE_PARENTS)
('0911000002', '123456', 'Nguyen Thi Me',   3),  -- id=6, Mother  (ROLE_PARENTS)
('0911000003', '123456', 'Nguyen Van Con',  1),  -- id=7, Child shared by both parents (ROLE_CHILDREN)
-- Extra isolated pair
('0922000001', '123456', 'Tran Thi Phu Huynh B', 3),  -- id=8, parent (ROLE_PARENTS)
('0922000002', '123456', 'Tran Van Hoc Sinh B',  1),  -- id=9, child  (ROLE_CHILDREN)
-- Extra teacher
('0933000001', '123456', 'Le Thi Giao Vien 2',   2);  -- id=10, teacher (ROLE_TEACHER)

-- Many-to-Many parent_student links
-- Father  -> shared child
INSERT INTO parent_student (parent_id, student_id) VALUES (5, 7);
-- Mother  -> shared child (same child id=7 — this is the key M2M test)
INSERT INTO parent_student (parent_id, student_id) VALUES (6, 7);
-- Isolated pair B
INSERT INTO parent_student (parent_id, student_id) VALUES (8, 9);

-- Also give PhuHuynhA (id=1 from V1) extra child links for more robust testing
-- (Already has 2 and 3 from V1; re-using them — no new insert needed)

-- Additional notifications
INSERT INTO notifications (title, content, created_at) VALUES
('Lịch nghỉ Tết Nguyên Đán 2025',
 'Trường sẽ nghỉ Tết từ ngày 25/01 đến 05/02/2025. Học sinh quay lại trường vào ngày 06/02/2025.',
 CURRENT_TIMESTAMP),
('Thông báo họp phụ huynh cuối kỳ',
 'Nhà trường kính mời quý phụ huynh tham dự buổi họp phụ huynh cuối học kỳ I vào lúc 8:00 sáng ngày 20/12/2024 tại hội trường lớn.',
 CURRENT_TIMESTAMP),
('Kết quả thi học kỳ I',
 'Kết quả bài thi học kỳ I đã được cập nhật trên hệ thống. Phụ huynh vui lòng kiểm tra trong mục Bảng điểm.',
 CURRENT_TIMESTAMP),
('Thông báo bổ sung đồng phục',
 'Nhà trường thông báo chương trình bổ sung đồng phục cho học sinh năm học 2024-2025. Phụ huynh đăng ký tại văn phòng nhà trường trước ngày 01/10.',
 CURRENT_TIMESTAMP);
