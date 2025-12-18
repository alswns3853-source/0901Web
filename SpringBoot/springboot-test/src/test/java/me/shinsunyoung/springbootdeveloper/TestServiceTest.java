package me.shinsunyoung.springbootdeveloper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class TestServiceTest {
    @Autowired
    TestService testService;

    @Test
    void getMemberById() {
        Member member = testService.getMemberById(1L);
        System.out.println(member);
    }

    @Test
    void getMemberByName() {
        Member member = testService.getMemberByName("name 2");
        System.out.println(member);
    }
    @Test
    void getMember() {
        Member member = testService.getMember("name 3");
        System.out.println(member);
    }
    @Test
    void updateMember(){
        System.out.println(testService.getAllMembers());
        testService.updateMember();
        System.out.println(testService.getAllMembers());
    }
}