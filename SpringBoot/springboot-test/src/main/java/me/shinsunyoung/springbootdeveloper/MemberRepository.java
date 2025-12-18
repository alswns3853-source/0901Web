package me.shinsunyoung.springbootdeveloper;

import org.springframework.data.domain.Limit;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.function.Supplier;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    // 쿼리 메서드 구현 코드
    // 메서드 이름이 쿼리문을 생성됨
    // find: SELECT의미
    // ByName : WHERE name = name 을 의미
    // SELECT * FROM member WHERE name = 'name'
    Optional<Member> findByName(String name);

    Optional<Member> getMemberByName(String name);
}
