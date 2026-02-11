package me.shinsunyoung.springbootdeveloper.service;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.User;
import me.shinsunyoung.springbootdeveloper.dto.AddUserRequest;
import me.shinsunyoung.springbootdeveloper.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public Long save(AddUserRequest dto){
        // 저장할 계정 데이터 설정
        User user = User.builder()
                .email(dto.getEmail()) // email 설정
                // 비밀번호를 BCrypt방식으로 암호화 하여 설정
                .password(bCryptPasswordEncoder.encode(dto.getPassword()))
                .auth("user")
                .build();
        // DB에 계정 저장 후 id값을 반환
        return userRepository.save(user).getId();
    }
    public User findById(Long userId){
        return userRepository.findById(userId).orElseThrow(()->new IllegalArgumentException("Unexpected user"));
    }
    public User findByEmail(String email){
        return userRepository.findByEmailAndSocial(email, true)
                .orElseThrow(()->new IllegalArgumentException("Unexpected user"));
    }
}
