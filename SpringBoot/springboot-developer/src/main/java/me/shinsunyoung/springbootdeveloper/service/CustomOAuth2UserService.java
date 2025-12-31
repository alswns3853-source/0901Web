package me.shinsunyoung.springbootdeveloper.service;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.User;
import me.shinsunyoung.springbootdeveloper.dto.UserSecurityDTO;
import me.shinsunyoung.springbootdeveloper.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    private final UserRepository userRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        OAuth2User oAuth2User = super.loadUser(userRequest);
        // 소셜 로그인에 사용한 회사 이름
        String company = userRequest.getClientRegistration().getRegistrationId();
        UserSecurityDTO userSecurityDTO = null;
        if(company.equals("kakao")){
            // 카카오 소셜 로그인
            Map<String, Object> props = oAuth2User.getAttributes();
            LinkedHashMap<String, Object> profile =
                    (LinkedHashMap<String, Object>) props.get("properties");
            String nickName = profile.get("nickname").toString();
            User user = userRepository.findByEmailAndSocial(nickName,true).orElse(null);
            if(user == null){
                // 소셜 로그인 처음 사용자인 경우
                user = userRepository.save(User.builder()
                            .email(nickName)
                            .password(passwordEncoder.encode("1234"))
                            .auth("user")
                            .social(true)
                            .build());
            }
            userSecurityDTO = new UserSecurityDTO(user, props);
        }else if(company.equals("google")){
            // 구글 소셜 로그인 처리
        }
        return userSecurityDTO;
    }
}
