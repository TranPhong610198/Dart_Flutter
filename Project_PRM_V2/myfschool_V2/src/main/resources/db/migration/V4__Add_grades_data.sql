-- ============================================================
-- V4: Grades mock data for testing
-- Grade scale: 0-10 (Vietnamese school system)
-- School Years: 2023-2024, 2024-2025
-- Semesters: HK1 (Semester 1), HK2 (Semester 2)
-- ============================================================

-- Hoc Sinh 1 (id=2)
INSERT INTO grades (student_id, subject, semester, school_year, score) VALUES
(2, 'Toán',              'HK1', '2024-2025', 8.5),
(2, 'Văn',               'HK1', '2024-2025', 7.0),
(2, 'Tiếng Anh',         'HK1', '2024-2025', 9.0),
(2, 'Vật Lý',            'HK1', '2024-2025', 7.5),
(2, 'Hóa Học',           'HK1', '2024-2025', 6.5),
(2, 'Sinh Học',          'HK1', '2024-2025', 8.0),
(2, 'Lịch Sử',           'HK1', '2024-2025', 6.0),
(2, 'Địa Lý',            'HK1', '2024-2025', 7.5),
(2, 'Giáo Dục Công Dân', 'HK1', '2024-2025', 9.0),
(2, 'Thể Dục',           'HK1', '2024-2025', 8.0),
-- HK2 2024-2025
(2, 'Toán',              'HK2', '2024-2025', 9.0),
(2, 'Văn',               'HK2', '2024-2025', 7.5),
(2, 'Tiếng Anh',         'HK2', '2024-2025', 9.5),
(2, 'Vật Lý',            'HK2', '2024-2025', 8.0),
(2, 'Hóa Học',           'HK2', '2024-2025', 7.0),
-- Previous year HK1
(2, 'Toán',              'HK1', '2023-2024', 7.5),
(2, 'Văn',               'HK1', '2023-2024', 6.5),
(2, 'Tiếng Anh',         'HK1', '2023-2024', 8.5);

-- Hoc Sinh 2 (id=3)
INSERT INTO grades (student_id, subject, semester, school_year, score) VALUES
(3, 'Toán',      'HK1', '2024-2025', 9.5),
(3, 'Văn',       'HK1', '2024-2025', 8.0),
(3, 'Tiếng Anh', 'HK1', '2024-2025', 8.5),
(3, 'Vật Lý',    'HK1', '2024-2025', 9.0),
(3, 'Hóa Học',   'HK1', '2024-2025', 8.5),
(3, 'Toán',      'HK2', '2024-2025', 9.0),
(3, 'Văn',       'HK2', '2024-2025', 8.5),
(3, 'Tiếng Anh', 'HK2', '2024-2025', 9.0);

-- Nguyen Van Con (id=7)
INSERT INTO grades (student_id, subject, semester, school_year, score) VALUES
(7, 'Toán',      'HK1', '2024-2025', 6.0),
(7, 'Văn',       'HK1', '2024-2025', 7.0),
(7, 'Tiếng Anh', 'HK1', '2024-2025', 7.5),
(7, 'Vật Lý',    'HK1', '2024-2025', 5.5),
(7, 'Lịch Sử',   'HK1', '2024-2025', 6.5),
(7, 'Toán',      'HK2', '2024-2025', 7.0),
(7, 'Văn',       'HK2', '2024-2025', 7.5);

-- Tran Van Hoc Sinh B (id=9)
INSERT INTO grades (student_id, subject, semester, school_year, score) VALUES
(9, 'Toán',      'HK1', '2024-2025', 8.0),
(9, 'Tiếng Anh', 'HK1', '2024-2025', 9.0),
(9, 'Hóa Học',   'HK1', '2024-2025', 7.5),
(9, 'Văn',       'HK1', '2024-2025', 6.5);
