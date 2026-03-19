-- ============================================================
-- V6: Mock request data
-- Uses user IDs from V1 + V2:
--   Parents: 1=PhuHuynhA, 5=NguyenVanBa, 6=NguyenThiMe, 8=TranThiPhuHuynhB
--   Students: 2=HocSinh1, 3=HocSinh2, 7=NguyenVanCon, 9=TranVanHocSinhB
-- Statuses: PENDING, APPROVED, REJECTED
-- ============================================================

INSERT INTO requests (parent_id, student_id, type_of_request, status, content) VALUES

-- Phu Huynh A (id=1) → HocSinh1 (id=2)
(1, 2, 'Xin nghỉ học có phép',
 'APPROVED',
 'Kính gửi nhà trường, con tôi bị sốt cao từ tối hôm qua. Tôi xin phép cho cháu nghỉ học ngày hôm nay để đi khám bệnh. Trân trọng.'),

(1, 2, 'Đề nghị gặp giáo viên',
 'PENDING',
 'Tôi muốn xin gặp cô giáo chủ nhiệm để trao đổi về kết quả học tập của con trong học kỳ vừa qua. Vui lòng sắp xếp lịch hẹn cho tôi. Xin cảm ơn.'),

(1, 3, 'Phản ánh về học tập',
 'REJECTED',
 'Con tôi phản ánh rằng bài kiểm tra Toán bị chấm nhầm điểm. Kính mong nhà trường kiểm tra và phản hồi lại cho gia đình. Trân trọng cảm ơn.'),

-- Father (id=5) → Nguyen Van Con (id=7)
(5, 7, 'Xin nghỉ học có phép',
 'APPROVED',
 'Gia đình có việc cần đi xa trong 2 ngày (15/03 và 16/03). Tôi xin phép cho con nghỉ học trong thời gian này và sẽ cho cháu bù bài sau khi đi học lại.'),

(5, 7, 'Khác',
 'PENDING',
 'Tôi muốn đề nghị nhà trường xem xét thay đổi chỗ ngồi cho con tôi. Hiện tại con đang ngồi cuối lớp và gặp khó khăn trong việc nhìn bảng do cận thị.'),

-- Mother (id=6) → Nguyen Van Con (id=7) — same child, different parent
(6, 7, 'Xin phép đến muộn',
 'APPROVED',
 'Con tôi có lịch khám mắt vào sáng ngày mai lúc 7h30. Tôi xin phép cho cháu đến trường muộn khoảng 30-45 phút. Cháu sẽ có mặt trước tiết 2. Xin cảm ơn.'),

(6, 7, 'Đề nghị gặp giáo viên',
 'PENDING',
 'Tôi xin phép được gặp thầy/cô phụ trách môn Toán và Tiếng Anh để được tư vấn về phương pháp học tập cho con trong học kỳ II. Kính mong sắp xếp thời gian phù hợp.'),

-- Parent B (id=8) → HocSinhB (id=9)
(8, 9, 'Xin nghỉ học có phép',
 'PENDING',
 'Con tôi bị viêm họng cấp tính, đã có đơn thuốc của bác sĩ. Tôi xin phép cho cháu nghỉ 3 ngày (18/03 - 20/03) để điều trị và nghỉ ngơi tại nhà.'),

(8, 9, 'Phản ánh về học tập',
 'APPROVED',
 'Con tôi đang gặp khó khăn với môn Hóa. Tôi muốn hỏi nhà trường có tổ chức lớp học thêm hoặc phụ đạo không? Nếu có xin cho biết lịch và chi phí để gia đình sắp xếp.');
