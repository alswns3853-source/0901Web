package me.shinsunyoung.springbootdeveloper;

import org.junit.jupiter.api.*;

public class JUnitCycleTest {
    @BeforeAll // 전체 테스트 시작전 1번 실행
    static void beforeAll() {
        // sout + 자동완성 => 이클립스의 syso와 같음
        System.out.println("@BeforeAll");
    }
    @BeforeEach // 각 테스트 시작 전 실행
    void beforeEach() {
        System.out.println("@BeforeEach");
    }
    @Test
    public void Test1() {
        System.out.println("Test1");
    }
    @Test
    public void Test2() {
        System.out.println("Test2");
    }
    @Test
    public void Test3() {
        System.out.println("Test3");
    }
    @AfterAll // 전체 테스트가 끝난 후 실행
    static void afterAll() {
        System.out.println("@AfterAll");
    }
    @AfterEach // 각 테스트가 끝난 후 실행
    void afterEach() {
        System.out.println("@AfterEach");
    }
}
