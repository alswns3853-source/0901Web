package me.shinsunyoung.springbootdeveloper.config.jwt;

import io.jsonwebtoken.Jwts;
import me.shinsunyoung.springbootdeveloper.domain.User;
import me.shinsunyoung.springbootdeveloper.repository.UserRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.Duration;
import java.util.Date;
import java.util.Map;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@SpringBootTest
class TokenProviderTest {
    @Autowired
    private TokenProvider tokenProvider;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private JwtProperties jwtProperties;

    @DisplayName("generateToken(): 유저 정보와 만료 기간을 전달해 토큰을 만들 수 있다.")
    @Test
    void generateToken() {
        // 유저 데이터 DB에 저장
        User testUser = userRepository.save(User.builder()
                        .email("user@gmail.com")
                        .password("test")
                        .build());
        // 토큰 생성
        String token = tokenProvider.generateToken(testUser, Duration.ofDays(14));
        // 토큰 안에 있는 claims 에서 id만 변수에 저장
        Long userId = Jwts.parser()
                .setSigningKey(jwtProperties.getSecretKey())
                .parseClaimsJws(token)
                .getBody()
                .get("id", Long.class);
        // DB에 있는 id와 토큰에 있는 id가 일치하면 테스트 통과
        assertThat(userId).isEqualTo(testUser.getId());
    }
    @DisplayName("validToken(): 만료된 토큰인 때에 유효성 검증에 실패한다.")
    @Test
    void  validToken_invalid() {
        // 현재 날짜보다 7일 빠른 만료일을 가진 토큰 생성
        String token = JwtFactory.builder()
                .expiration(new Date(new Date().getTime() - Duration.ofDays(7).toMillis()))
                .build()
                .createToken(jwtProperties);
        System.out.println(token);
        // 만료된 토큰을 유효성 검증하면 false를 결과로 반환함
        boolean result = tokenProvider.validToken(token);
        // result가 false이면 테스트 통과
        assertThat(result).isFalse();
    }
    @DisplayName("validToken(): 유효한 토큰인 때에 유효성 검증에 성공한다.")
    @Test
    void  validToken_valid() {
        // 만료일 14일 후인 토큰 생성
        String token = JwtFactory.withDefaultValues()
                .createToken(jwtProperties);
        System.out.println(token);
        // 유효성 검증시 true 반환
        boolean result = tokenProvider.validToken(token);
        // result가 true이면 테스트 통과
        assertThat(result).isTrue();
    }
    @DisplayName("getAuthentication(): 토큰 기반으로 인증 정보를 가져올 수 있다.")
    @Test
    void getAuthentication() {
        // 이메일 주소
        String userEmail = "user@email.com";
        // 토큰 생성
        String token = JwtFactory.builder()
                .subject(userEmail)
                .build()
                .createToken(jwtProperties);
        // 토큰을 이용하여 SpringSecurity 인증 정보 생성
        Authentication authentication = tokenProvider.getAuthentication(token);
        // SpringSecurity인증 정보에서 username을 출력했을때 이메일이 일치하면 테스트 통과
        assertThat((((UserDetails) authentication.getPrincipal()).getUsername())).isEqualTo(userEmail);
    }

    @DisplayName("getUserId(): 토큰으로 유저 ID를 가져올 수 있다.")
    @Test
    void getUserId() {

        Long userId = 1L;
        // 토큰에 저장한 claims중에 id를 1로 저장한 토큰 생성
        String token = JwtFactory.builder()
                .claims(Map.of("id",userId))
                .build()
                .createToken(jwtProperties);
        // 토큰에서 claims중에 id를 반환
        Long userIdByToken = tokenProvider.getUserId(token);
        // 저장 전 userId와 토큰에 있는 id가 일치하면 테스트통과
        assertThat(userIdByToken).isEqualTo(userId);
    }
}