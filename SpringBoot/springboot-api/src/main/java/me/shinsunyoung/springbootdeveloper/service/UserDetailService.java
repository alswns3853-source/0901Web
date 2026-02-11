package me.shinsunyoung.springbootdeveloper.service;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.User;
import me.shinsunyoung.springbootdeveloper.dto.UserSecurityDTO;
import me.shinsunyoung.springbootdeveloper.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class UserDetailService implements UserDetailsService {
    private final UserRepository userRepository;

    @Override
//  User데이터를 찾아서 return하면 비밀번호 확인을 자동으로 실행함
    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {
        // DB에서 email을 기준으로 소셜 계정이 아닌 데이터 조회하여 반환
        User user = userRepository.findByEmailAndSocial(email, false)
                .orElseThrow(()->new IllegalArgumentException(email));
        return new UserSecurityDTO(user);
    }
}










