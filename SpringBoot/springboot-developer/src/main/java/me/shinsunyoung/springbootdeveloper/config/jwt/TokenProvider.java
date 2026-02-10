package me.shinsunyoung.springbootdeveloper.config.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Header;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.domain.User;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.Collections;
import java.util.Date;
import java.util.Set;

@RequiredArgsConstructor
@Service
public class TokenProvider {

    private final JwtProperties jwtProperties;
    // 토큰 생성 매서드(로그인 혹은 토큰 재생성시)
    public String generateToken(User user, Duration expiredAt){
        Date now = new Date(); // 현재 날짜
        // makeToken(토큰의 유지시간 설정, 로그인한 유저의 데이터)
        return makeToken(new Date(now.getTime() + expiredAt.toMillis()), user);
    }
    private String makeToken(Date expiry, User user){
        Date now = new Date();

        return Jwts.builder()
//               헤더에 typ:jwt 설정
                .setHeaderParam(Header.TYPE, Header.JWT_TYPE)
                // iss : 토큰 발급자
                .setIssuer(jwtProperties.getIssuer())
                // iat : 토큰 생성일
                .setIssuedAt(now)
                // exp : 토큰 만료일
                .setExpiration(expiry)
                // sub : 토큰 제목
                .setSubject(user.getEmail())
                // claim(key, value) : 개발자가 직접 저장하는 데이터
                .claim("id", user.getId())
                // signWith(암호화 알고리즘, 비밀번호) : 서명부분 작성
                .signWith(SignatureAlgorithm.HS256, jwtProperties.getSecretKey())
                .compact();
    }
    // 토큰의 유호성 검증 메서드(로그인이 필요한 페이지 사용시)
    public boolean validToken(String token){
        try{
            Jwts.parser()
                    // 비밀번호 설정
                    .setSigningKey(jwtProperties.getSecretKey())
                    // 토큰 문자열 설정
                    .parseClaimsJws(token);

            return true;
        } catch (Exception e){
            return false;
        }
    }
    // 토큰의 권한을 반환하는 메서드(특정 권한이 필요한 페이지의 경우)
    public Authentication getAuthentication(String token){
        Claims claims = getClaims(token); // 토큰의 데이터를 변수에 저장
        // ROLE_USER권한 객체 생성
        Set<SimpleGrantedAuthority> authorities = Collections.singleton(new SimpleGrantedAuthority("ROLE_USER"));
        // SpringSecurity에서 사용하는 유저 객체를 반환
        return new UsernamePasswordAuthenticationToken(new org.springframework.security.core.userdetails
                .User(claims.getSubject(), "", authorities), token, authorities);
    }
    // 토큰에 있는 id 클레임을 반환하는 메서드
    public Long getUserId(String token){
        Claims claims = getClaims(token);
        return claims.get("id", Long.class);
    }
    // 토큰에서 클레임만 따로 반환하는 메서드
    private Claims getClaims(String token){
        return Jwts.parser()
                .setSigningKey(jwtProperties.getSecretKey())
                .parseClaimsJws(token)
                .getBody();
    }
}
