package org.zerock.springex.mappers;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.springex.dto.PageRequestDTO;
import org.zerock.springex.vo.TodoVO;

import java.time.LocalDate;
import java.util.List;

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
    @Test
    void selectAll() {
        List<TodoVO> voList = todoMapper.selectAll();
        for(TodoVO vo : voList){
            log.info(vo);
        }
    }
    @Test
    void selectById() {
        TodoVO vo = todoMapper.selectById(1L);
        log.info(vo);
    }

    @Test
    void selectSearch() {
        PageRequestDTO pageRequestDTO = new PageRequestDTO();
        pageRequestDTO.setPage(1);
        pageRequestDTO.setSize(10);
        pageRequestDTO.setFinished(true);
        pageRequestDTO.setFrom(LocalDate.of(2025,12,13));
        pageRequestDTO.setTo(LocalDate.of(2025,12,14));
        String [] types = {"t","w"};
        pageRequestDTO.setTypes(types);
        pageRequestDTO.setKeyword("2");
        todoMapper.selectSearch(pageRequestDTO);
    }
}










