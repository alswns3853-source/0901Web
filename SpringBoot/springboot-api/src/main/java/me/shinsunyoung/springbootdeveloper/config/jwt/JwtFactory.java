package me.shinsunyoung.springbootdeveloper.config.jwt;

import io.jsonwebtoken.Header;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.Builder;
import lombok.Getter;

import java.time.Duration;
import java.util.Date;
import java.util.Map;

import static java.util.Collections.emptyMap;

@Getter
public class JwtFactory {
    private String subject = "test@email.com"; // email
    private Date issuedAt = new Date(); // 현재시간
    // 만료일 : 현재시간에 14일 후
    private Date expiration = new Date(new Date().getTime() + Duration.ofDays(14).toMillis());
    // 그외의 데이터는 빈 맵
    private Map<String, Object> claims = emptyMap();

    @Builder
    public JwtFactory(String subject, Date issuedAt, Date expiration, Map<String, Object> claims) {
//        builder사용시 데이터를 설정하면 설정한 데이터로 생성하고 없으면 기본값으로 설정
        this.subject = subject != null ? subject : this.subject;
        this.issuedAt = issuedAt != null ? issuedAt : this.issuedAt;
        this.expiration = expiration != null ? expiration : this.expiration;
        this.claims = claims != null ? claims : this.claims;
    }
    //JwtFatory 생성시 기본값만으로 생성하는 메서드
    public static JwtFactory withDefaultValues(){
        return JwtFactory.builder().build();
    }
    // 멤버 변수에 있는 데이터로 토큰을 생성하는 메서드
    public String createToken(JwtProperties jwtProperties){
        return Jwts.builder()
                .setSubject(subject)
                .setHeaderParam(Header.TYPE, Header.JWT_TYPE)
                .setIssuer(jwtProperties.getIssuer())
                .setIssuedAt(issuedAt)
                .setExpiration(expiration)
                .addClaims(claims)
                .signWith(SignatureAlgorithm.HS256, jwtProperties.getSecretKey())
                .compact();
    }
}
