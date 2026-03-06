package com.example.myfschool.application_service.services.actions;

import com.example.myfschool.application_service.dtos.requests.LoginRequest;
import com.example.myfschool.application_service.dtos.responses.LoginResponse;
import com.example.myfschool.application_service.services.interfaces.IAuthService;
import com.example.myfschool.contract.enums.RoleEnum;
import com.example.myfschool.infrastructure.entities.StudentEntity;
import com.example.myfschool.infrastructure.entities.TeacherEntity;
import com.example.myfschool.infrastructure.entities.UserEntity;
import com.example.myfschool.infrastructure.repositories.StudentRepository;
import com.example.myfschool.infrastructure.repositories.TeacherRepository;
import com.example.myfschool.infrastructure.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthServiceAction implements IAuthService {

    private final UserRepository userRepository;
    private final StudentRepository studentRepository;
    private final TeacherRepository teacherRepository;

    @Override
    public LoginResponse login(LoginRequest request) {
        // 1. Tìm user
        UserEntity user = userRepository.findByPhone(request.getPhone())
                .orElseThrow(() -> new RuntimeException("Tài khoản hoặc mật khẩu không chính xác"));

        // 2. Validate Password (Sau này sẽ bật BCrypt lên)
        // if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
        //     throw new RuntimeException("Tài khoản hoặc mật khẩu không chính xác");
        // }

        // 3. Khởi tạo các biến Profile
        String fullName = null;
        String code = null;
        String className = null;
        String schoolName = null;

        // 4. Lấy Profile tùy theo Role
        if (user.getRole() == RoleEnum.STUDENT) {
            StudentEntity student = studentRepository.findByUserIdWithDetails(user.getId())
                    .orElseThrow(() -> new RuntimeException("Không tìm thấy hồ sơ học sinh"));

            fullName = student.getFullName();
            code = student.getStudentCode();

            if (student.getClassOfStudent() != null) {
                className = student.getClassOfStudent().getName();
                if (student.getClassOfStudent().getSchool() != null) {
                    schoolName = student.getClassOfStudent().getSchool().getName();
                }
            }
        } else if (user.getRole() == RoleEnum.TEACHER) {
            TeacherEntity teacher = teacherRepository.findByUserId(user.getId())
                    .orElseThrow(() -> new RuntimeException("Không tìm thấy hồ sơ giáo viên"));

            fullName = teacher.getFullName();
            code = teacher.getEmail(); // Tạm dùng email làm code hiển thị cho GV
            // GV có thể không có lớp cố định hiển thị ở home, hoặc bạn có thể query lớp chủ nhiệm nếu muốn
        }

        // 5. Build và trả về Response
        return LoginResponse.builder()
                .id(user.getId()) // Gán ID của user
                .createdBy(user.getCreatedBy())
                .createdTime(user.getCreatedTime())
                .modifiedBy(user.getModifiedBy())
                .modifiedTime(user.getModifiedTime())
                .accessToken("jwt_token_tam_thoi_chua_config")
                .role(user.getRole().name())
                .fullName(fullName)
                .code(code)
                .className(className)
                .schoolName(schoolName)
                .build();
    }
}