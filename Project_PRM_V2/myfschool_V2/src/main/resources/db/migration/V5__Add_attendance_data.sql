-- ============================================================
-- V5: Attendance mock data
-- Status values: PRESENT, ABSENT_WITH_PERMISSION, ABSENT_WITHOUT_PERMISSION
-- Covers: Feb 2026 and March 2026 for all students
-- ============================================================

-- Hoc Sinh 1 (id=2) — mostly present, a few absences
INSERT INTO attendance (student_id, date, status) VALUES
(2, '2026-03-02', 'PRESENT'),
(2, '2026-03-03', 'PRESENT'),
(2, '2026-03-04', 'PRESENT'),
(2, '2026-03-05', 'ABSENT_WITH_PERMISSION'),
(2, '2026-03-06', 'PRESENT'),
(2, '2026-03-09', 'PRESENT'),
(2, '2026-03-10', 'PRESENT'),
(2, '2026-03-11', 'ABSENT_WITHOUT_PERMISSION'),
(2, '2026-03-12', 'PRESENT'),
(2, '2026-03-13', 'PRESENT'),
(2, '2026-02-24', 'PRESENT'),
(2, '2026-02-25', 'PRESENT'),
(2, '2026-02-26', 'ABSENT_WITH_PERMISSION'),
(2, '2026-02-27', 'PRESENT');

-- Hoc Sinh 2 (id=3)
INSERT INTO attendance (student_id, date, status) VALUES
(3, '2026-03-02', 'PRESENT'),
(3, '2026-03-03', 'PRESENT'),
(3, '2026-03-04', 'ABSENT_WITHOUT_PERMISSION'),
(3, '2026-03-05', 'PRESENT'),
(3, '2026-03-06', 'PRESENT'),
(3, '2026-03-09', 'PRESENT'),
(3, '2026-03-10', 'ABSENT_WITH_PERMISSION'),
(3, '2026-03-11', 'PRESENT'),
(3, '2026-03-12', 'PRESENT'),
(3, '2026-03-13', 'PRESENT'),
(3, '2026-02-24', 'PRESENT'),
(3, '2026-02-25', 'ABSENT_WITHOUT_PERMISSION'),
(3, '2026-02-26', 'PRESENT'),
(3, '2026-02-27', 'PRESENT');

-- Nguyen Van Con (id=7)
INSERT INTO attendance (student_id, date, status) VALUES
(7, '2026-03-02', 'PRESENT'),
(7, '2026-03-03', 'ABSENT_WITHOUT_PERMISSION'),
(7, '2026-03-04', 'PRESENT'),
(7, '2026-03-05', 'PRESENT'),
(7, '2026-03-06', 'ABSENT_WITHOUT_PERMISSION'),
(7, '2026-03-09', 'PRESENT'),
(7, '2026-03-10', 'PRESENT'),
(7, '2026-03-11', 'PRESENT'),
(7, '2026-03-12', 'ABSENT_WITH_PERMISSION'),
(7, '2026-03-13', 'PRESENT');

-- Tran Van Hoc Sinh B (id=9)
INSERT INTO attendance (student_id, date, status) VALUES
(9, '2026-03-02', 'PRESENT'),
(9, '2026-03-03', 'PRESENT'),
(9, '2026-03-04', 'PRESENT'),
(9, '2026-03-05', 'ABSENT_WITH_PERMISSION'),
(9, '2026-03-06', 'PRESENT'),
(9, '2026-03-09', 'ABSENT_WITHOUT_PERMISSION'),
(9, '2026-03-10', 'PRESENT'),
(9, '2026-03-11', 'PRESENT');
