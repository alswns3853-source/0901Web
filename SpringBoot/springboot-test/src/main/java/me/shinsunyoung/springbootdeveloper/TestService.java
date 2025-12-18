package me.shinsunyoung.springbootdeveloper;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestService {
    private final MemberRepository memberRepository;

    public List<Member> getAllMembers(){
        return memberRepository.findAll();
    }
    public Member getMemberById(Long id){
        // findById 는 JPA에서 기본으로 지원하는 메서드
        Member member = memberRepository.findById(id).get();
        return member;
    }
    public Member getMemberByName(String name) {
        // name으로 조회하는 쿼리 메서드
        Member member = memberRepository.findByName(name).get();
        return member;
    }
    public Member getMember(String name){
        // name으로 조회하는 쿼리 메서드
        Member member = memberRepository.getMemberByName(name).get();
        return member;
    }
    @Transactional
    public void updateMember(){
        Member member = memberRepository.findById(1L).get();
        member.changeName("홍길동");
    }
}
