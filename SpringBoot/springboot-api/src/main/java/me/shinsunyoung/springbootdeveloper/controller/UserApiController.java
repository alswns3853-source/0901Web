package me.shinsunyoung.springbootdeveloper.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.config.jwt.TokenProvider;
import me.shinsunyoung.springbootdeveloper.domain.User;
import me.shinsunyoung.springbootdeveloper.dto.AddUserRequest;
import me.shinsunyoung.springbootdeveloper.dto.LoginUserRequest;
import me.shinsunyoung.springbootdeveloper.service.UserService;
import me.shinsunyoung.springbootdeveloper.util.CookieUtil;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.Duration;
import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
@RestController
public class UserApiController {
    private final UserService userService;
    private final AuthenticationManagerBuilder authenticationManagerBuilder;
    private final TokenProvider tokenProvider;

    @PostMapping("/api/user")
    public ResponseEntity<String> signup(@RequestBody AddUserRequest request){
        userService.save(request);
        return ResponseEntity.ok().build();
    }
    @PostMapping("/api/login")
    public ResponseEntity<Map<String, String>> login(@RequestBody LoginUserRequest data, HttpServletRequest request, HttpServletResponse response){
        // 인증 정보 생성
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken
                (data.getUsername(), data.getPassword());
        // 실제 DB에 계정이 있는지 검증
        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(token);
        // DB에서 유저 데이터 불러오기
        User user = userService.findByEmail(data.getUsername());
        // 토큰 생성
        String accessToken = tokenProvider.generateToken(user, Duration.ofDays(1));
        String refreshToken = tokenProvider.generateToken(user, Duration.ofDays(14));
        // 리프레시 토큰 설정
        CookieUtil.deleteCookie(request, response, "refresh_token");
        CookieUtil.addCookie(response, "refresh_token", refreshToken, (int)Duration.ofDays(14).toSeconds());
        Map<String, String> map = new HashMap<>();
        map.put("accessToken", accessToken);

        // 엑세스 토큰 설정 후 반환
        return ResponseEntity.ok().body(map);
    }

}
