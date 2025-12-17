package me.shinsunyoung.springbootdeveloper;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import tools.jackson.databind.ObjectMapper;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
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
        final String url = "/quiz";
        final ResultActions result = mockMvc.perform(
                get(url).param("code","1"));
        result
                .andExpect(status().isCreated())
                .andExpect(content().string("Created!"));
    }
    @DisplayName("quiz(): GET /quiz?code=2 이면 응답 코드는 400, 응답 본문은 Bad Request!를 리턴한다.")
    @Test
    public void getQuiz2() throws Exception {
        final String url = "/quiz";
    }
}