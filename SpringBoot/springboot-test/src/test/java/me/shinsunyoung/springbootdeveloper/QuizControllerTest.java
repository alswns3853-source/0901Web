package me.shinsunyoung.springbootdeveloper;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import tools.jackson.databind.ObjectMapper;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
class QuizControllerTest {

    @Autowired
    protected MockMvc mockMvc;
    @Autowired
    private WebApplicationContext context;
    @Autowired
    private ObjectMapper objectMapper;
    @BeforeEach
    public void mockMvcSetup() {
        this.mockMvc = MockMvcBuilders.
                webAppContextSetup(this.context).
                build();
    }
    @DisplayName("quiz(): GET /quiz?code=1 이면 응답 코드는 201, 응답 본문은 Created!를 리턴한다. ")
    @Test
    public void getQuiz1() throws Exception {
        // URL 설정
        final String url = "/quiz";
        // Controller실행
        final ResultActions result = mockMvc.perform(
                get(url).param("code","1"));
        // 응답 코드가 201인지, 응답 본문이 Created! 인지 확인
        result
                .andExpect(status().isCreated())
                .andExpect(content().string("Created!"));
    }
    @DisplayName("quiz(): GET /quiz?code=2 이면 응답 코드는 400, 응답 본문은 Bad Request!를 리턴한다.")
    @Test
    public void getQuiz2() throws Exception {

        final String url = "/quiz";

        final ResultActions result = mockMvc.perform(

                get(url).param("code","2"));
        result
                .andExpect(status().isBadRequest())
                .andExpect(content().string("Bad Request!"));

    }
    @DisplayName("quiz(): POST / quiz에 요청 본문이 {\"value\":1} 이면 응답 코드는 403, 응답 본문은 Forbidden!를 리턴한다.")
    @Test
    public void postQuiz1() throws Exception{
        String url = "/quiz";
        ResultActions result = mockMvc.perform(post(url)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(new Code(1)))
                );
        result.andExpect(status().isForbidden())
                .andExpect(content().string("Forbidden!"));
    }
    @DisplayName("quiz(): POST / quiz에 요청 본문이 {\"value\":13} 이면 응답 코드는 200, 응답 본문은 OK!를 리턴한다.")
    @Test
    public void postQuiz13() throws Exception{
        String url = "/quiz";
        ResultActions result = mockMvc.perform(post(url)
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(new Code(13)))
        );
        result.andExpect(status().isOk())
                .andExpect(content().string("OK!"));
    }
}