package me.shinsunyoung.springbootdeveloper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.swing.*;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;


@SpringBootTest
class MemberRepositoryTest {
    @Autowired
    MemberRepository memberRepository;
    @Test
    void saveMember(){
        Member member = new Member(4L,"A");
        Member savedMember = memberRepository.save(member);
        System.out.println(savedMember);
        assertThat(memberRepository.findById(4L).get().getName()).isEqualTo("A");
    }
    @Test
    void deleteMember(){
        System.out.println(memberRepository.findAll().size());
        // 전체데이터 삭제
        memberRepository.deleteAll();
        // 전체 데이터 개수가 0이면 테스트 통과
        assertThat(memberRepository.findAll().size()).isZero();
    }
    @Test
    void deleteById(){
        System.out.println(memberRepository.findAll());
        memberRepository.deleteById(1L);
        System.out.println(memberRepository.findAll());
    }


}