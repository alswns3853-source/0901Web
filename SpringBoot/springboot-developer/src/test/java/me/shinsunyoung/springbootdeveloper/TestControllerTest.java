package me.shinsunyoung.springbootdeveloper;

import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class TestControllerTest {
    @Autowired
    protected MockMvc mockMvc;
    @Autowired
    private WebApplicationContext context;
    @Autowired
    private MemberRepository memberRepository;
    @BeforeEach
    public void mockMvcSetup() {
        this.mockMvc = MockMvcBuilders.
                webAppContextSetup(this.context).
                build();
    }
    @AfterEach
    public void cleanUp(){
        memberRepository.deleteAll();
    }
    @DisplayName("getAllMembers: 아티클 조회에 성공한다.")
    @Test
    public void getAllMembers() throws Exception {
        // controller에서 실행할 url 설정
        final String url = "/test2";
        // member테이블에 update를 실행
        Member savedMember = memberRepository.save(new Member(1L, "홍길동"));
        // url이 test2인 controller를 실행 후 결과를 result에 저장
        final ResultActions result = mockMvc.perform(
                        //방식(실행url).accept(controller실행 결과의 타입)
                            get(url).accept(MediaType.APPLICATION_JSON));
        System.out.println(result);
        // 통신이 성공했는지 확인
        result
                .andExpect(status().isOk())
                // member테이블의 첫번째 데이터의 id와 저장한 데이터의 id가 일치하는지 확인
                .andExpect(jsonPath("$[0].id").value(savedMember.getId()))
                // member테이블의 첫번째 데이터 name과 저장한 데이터의 name이 일치하는지 확인
                .andExpect(jsonPath("$[0].name").value(savedMember.getName()))
                .andDo(print());
    }
}