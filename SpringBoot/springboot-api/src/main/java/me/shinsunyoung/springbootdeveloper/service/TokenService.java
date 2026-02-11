package me.shinsunyoung.springbootdeveloper.service;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.config.jwt.TokenProvider;
import me.shinsunyoung.springbootdeveloper.domain.User;
import org.springframework.stereotype.Service;

import java.time.Duration;

@RequiredArgsConstructor
@Service
public class TokenService {

    private final TokenProvider tokenProvider;
    private final RefreshTokenService refreshTokenService;
    private final  UserService userService;

    public String createNewAccessToken(String refreshToken) {
        // 토큰 검증 : 유효기간, 비밀번호, 문자열암호화 맞는지 토큰의 데이터를 확인
        if(!tokenProvider.validToken(refreshToken)) {
            throw new IllegalArgumentException("Unexpected token");
        }
//      DB에 저장된 토큰과 브라우저에서 보내준 토큰이 일치하는지 확인하고 userId를 저장
        Long userId = refreshTokenService.findByRefreshToken(refreshToken).getUserId();
//      DB에 저장된 토큰에 있는 id가 실제로 있는 id인지 user테이블에서 확인
        User user = userService.findById(userId);
//      2시간짜리 토큰을 생성하여 반환
        return tokenProvider.generateToken(user, Duration.ofHours(2));
    }
}
