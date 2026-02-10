package me.shinsunyoung.springbootdeveloper.config;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.config.jwt.TokenProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@RequiredArgsConstructor
public class TokenAuthenticationFilter extends OncePerRequestFilter {
    private final TokenProvider tokenProvider;
    // 토큰을 받을때 HTTP통신에 헤더부분에 Authorization로 전달하는 문자열은 토큰임을 의미
    private final static String HEADER_AUTHORIZATION = "Authorization";
    // 토큰 전달시 앞에 붙이는 문자열 : JWT의 경우 Bearer를 붙임
    // "Bearer 토큰문자열" 형식으로 전달
    private final static String TOKEN_PREFIX = "Bearer ";

    @Override
    protected void doFilterInternal(
                    HttpServletRequest request,
                    HttpServletResponse response,
                    FilterChain filterChain) throws ServletException, IOException{
//      헤더에  key가 Authorization인 데이터를 찾아서 저장
        String authorization = request.getHeader(HEADER_AUTHORIZATION);
        // 토큰을 저장
        String token = getAccessToken(authorization);
        // 토큰이 정상인지 확인하는 if문
        if(tokenProvider.validToken(token)){
            // 토큰이 정상인 경우 인증정보를 생성
            Authentication authentication = tokenProvider.getAuthentication(token);
            // SpringContextHolder에 인증정보를 저장
            SecurityContextHolder.getContext().setAuthentication(authentication);
        }
        // 다음 로직을 실행하도록 설정
        filterChain.doFilter(request, response);
    }

    private String getAccessToken(String authorizationHeader) {
//        토큰이 null이 아니고 토큰의 앞부분이 Bearer이면 true
        if(authorizationHeader == null || !authorizationHeader.startsWith(TOKEN_PREFIX)){
            // JWT에 붙이는 "Bearer "를 제외하고 토큰만 반환
            return authorizationHeader.substring(TOKEN_PREFIX.length());
        }
        return null;
    }

}
