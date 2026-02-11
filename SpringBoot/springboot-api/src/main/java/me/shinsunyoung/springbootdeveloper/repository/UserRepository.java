package me.shinsunyoung.springbootdeveloper.repository;

import me.shinsunyoung.springbootdeveloper.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Long> {
    // SpringSecurity가 비밀번호 확인을 대신함
    Optional<User> findByEmailAndSocial(String email, boolean social);
    Optional<User> findByEmail(String email);
}









