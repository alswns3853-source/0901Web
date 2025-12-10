package org.zerock.springex.mappers;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.springex.vo.TodoVO;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
class TodoMapperTest {

    @Autowired(required=false)
    private TodoMapper todoMapper;

    @Test
    void insert() {
        // builder().설정할 데이터.build() : 객체 생성 방식
        // 한번 생성한 객체의 데이터를 변경할 수 없음
        TodoVO vo = TodoVO.builder()
                .title("스프링 테스트2")
                .dueDate(LocalDate.of(2025,12,11))
                .writer("user01")
                .build();
        todoMapper.insert(vo);
    }
}










