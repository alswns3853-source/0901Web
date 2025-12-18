package me.shinsunyoung.springbootdeveloper;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MemberRepository extends JpaRepository<Member,Long> {
    // 쿼리 메서드 구현 코드
    // 메서드 이름이 쿼리문을 생성됨
    // find: SELECT의미
    // ByName : WHERE name = name 을 의미
    // SELECT * FROM member WHERE name = 'name'
    Optional<Member> findByName(String name);
    
    // @Query 어노테이션 방식 : JPA에서 사용하는 SQL문으로 메서드를 작성 
    //             별칭    엔티티이름      별칭.열이름  매개변수1번
    @Query("SELECT m FROM Member m WHERE m.name = ?1")
    Optional<Member> getMemberByName(String name);
}
