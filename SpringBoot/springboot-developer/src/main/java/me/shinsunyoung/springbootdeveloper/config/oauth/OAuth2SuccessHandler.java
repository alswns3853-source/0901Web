package me.shinsunyoung.springbootdeveloper.config.oauth;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.config.jwt.TokenProvider;
import me.shinsunyoung.springbootdeveloper.domain.RefreshToken;
import me.shinsunyoung.springbootdeveloper.domain.User;
import me.shinsunyoung.springbootdeveloper.repository.RefreshTokenRepository;
import me.shinsunyoung.springbootdeveloper.service.UserService;
import me.shinsunyoung.springbootdeveloper.util.CookieUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.time.Duration;

@RequiredArgsConstructor
@Component
public class OAuth2SuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    public static final String REFRESH_TOKEN_COOKIE_NAME = "refresh_token";
    public static final Duration REFRESH_TOKEN_DURATION= Duration.ofDays(14);
    public static final Duration ACCESS_TOKEN_DURATION= Duration.ofDays(1);
    public static final String REDIRECT_PATH = "/articles";

    private final TokenProvider tokenProvider;
    private final RefreshTokenRepository  refreshTokenRepository;
    private final OAuth2AuthorizationRequestBasedOnCookieRepository
            authorizationRequestRepository;
    private final UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response, Authentication authentication) throws IOException{
        // 로그인시 저장된 유저데이터를 변수에 저장
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        // DB에서 유저 데이터가 있으면 변수에 저장
        User user = userService.findByEmail((String)oAuth2User.getAttributes().get("email"));
        // 리프레시토큰 생성
        String refreshToken = tokenProvider.generateToken(user, REFRESH_TOKEN_DURATION);
        // 리프레시토큰 저장
        saveRefreshToken(user.getId(), refreshToken);
        // 리프레시토큰을 쿠키에 저장
        addRefreshTokenTOCookie(request, response, refreshToken);
        // 엑세스 토큰 생성
        String accessToken = tokenProvider.generateToken(user, ACCESS_TOKEN_DURATION);
        // 다음페이지 설정
        String targetUrl = getTargetUrl(accessToken);
       // 인증정보와 쿠키제거
        clearAuthenticationAttributes(request, response);
        // articles 페이지로 리다이렉트
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
    // 리프레시토큰을 DB에 저장하는 메서드
    private void saveRefreshToken(Long userId, String newRefreshToken) {
//        DB에 토큰이 있으면 갱신 없으면 새롭게 생성
        RefreshToken refreshToken = refreshTokenRepository.findByUserId(userId)
                .map(entity -> entity.update(newRefreshToken))
                .orElse(new RefreshToken(userId, newRefreshToken));
//      DB에 리프레시토큰 저장
        refreshTokenRepository.save(refreshToken);
    }

    private void addRefreshTokenTOCookie(HttpServletRequest request, HttpServletResponse response, String refreshToken) {
        int cookieMaxAge = (int) REFRESH_TOKEN_DURATION.toSeconds();
        CookieUtil.deleteCookie(request, response, REFRESH_TOKEN_COOKIE_NAME);
        CookieUtil.addCookie(response, REFRESH_TOKEN_COOKIE_NAME, refreshToken, cookieMaxAge);
    }
    // 인증 정보 제거 메서드
    private void clearAuthenticationAttributes(HttpServletRequest request, HttpServletResponse response) {
        // 인증 정보 제거
        super.clearAuthenticationAttributes(request);
        // 쿠키 제거
        authorizationRequestRepository.removeAuthorizationRequestCookies(request, response);
    }
    private String getTargetUrl(String token) {
//      uri 문자열 생성 :  /articles?token=accessToken 
        return UriComponentsBuilder.fromUriString(REDIRECT_PATH)
                .queryParam("token", token)
                .build()
                .toUriString();
    }


}
