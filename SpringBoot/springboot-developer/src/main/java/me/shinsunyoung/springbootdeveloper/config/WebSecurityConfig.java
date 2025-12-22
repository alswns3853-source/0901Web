package me.shinsunyoung.springbootdeveloper.config;

import lombok.RequiredArgsConstructor;
import me.shinsunyoung.springbootdeveloper.service.UserDetailService;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.ProviderManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration // 설정파일 어노테이션
@EnableWebSecurity // 보안 설정 어노테이션
@RequiredArgsConstructor
public class WebSecurityConfig {
    private final UserDetailService userService;

    @Bean
    public WebSecurityCustomizer configure(){
        return (web)-> web.ignoring()
                // h2관련 페이지는 스프링시큐리티가 작동하지 않도록 설정
                .requestMatchers(PathRequest.toH2Console())
                // 정적 파일(html, css, js, 이미지파일 등) 스프링 시큐리티 해제
                .requestMatchers(PathRequest.toStaticResources().atCommonLocations())
                // 특정 폴더 접근의 스프링 시큐리티 해제
                .requestMatchers("/static/**");

    }
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
        return http
                // 인가가 필요한 페이지 설정
                .authorizeHttpRequests(auth -> auth
                        // permitAll로 되어있는 url은 로그인하지 않아도 통과
                        .requestMatchers("/login","/signup","/user", "/articles", "/articles/{id}").permitAll()
                        // 위의 url이외에 모든 url은 로그인이 필요하도록 설정
                        .anyRequest().authenticated())
                // form태그를 사용한 로그인 관련 설정
                .formLogin(formLogin -> formLogin
                        .loginPage("/login") // 로그인 페이지 주소
                        .defaultSuccessUrl("/articles") // 로그인 성공시 출력할 주소
                        .failureUrl("/login?error=true")
                        //.failureForwardUrl("/login?error=true")  // 로그인 실패시 주소
                )
                // 로그아웃 설정
                .logout(logout -> logout
                        .logoutSuccessUrl("/login") // 로그아웃 성공시 주소
                        .invalidateHttpSession(true)) // 로그아웃 시 모든 세션데이터 삭제
                .csrf(AbstractHttpConfigurer::disable) // CSRF 사용안함 설정
                // .csrf(csrf -> csrf.disable()) // 람다식
                .build();
    }
    @Bean
    // 로그인 방식 설정
    public AuthenticationManager authenticationManager(HttpSecurity http, BCryptPasswordEncoder bCryptPasswordEncoder, UserDetailService userDetailService) throws Exception{
//        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider(userService);
        // 비밀번호 암호화 방식 설정
        authProvider.setPasswordEncoder(bCryptPasswordEncoder);
        return new ProviderManager(authProvider);
    }
    @Bean
    // 암호화 방식을 Bean으로 설정, 여러군데에서 쓰이기 때문에 Bean설정
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}











