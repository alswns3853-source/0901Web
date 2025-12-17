package org.zerock.springex.mappers;

import org.zerock.springex.dto.PageRequestDTO;
import org.zerock.springex.vo.TodoVO;

import java.util.List;

public interface TodoMapper {
    String getTime();
    void insert(TodoVO vo);
    List<TodoVO> selectAll();
    TodoVO selectById(Long tno);
    void deleteById(Long tno);
    void updateById(TodoVO vo);
    List<TodoVO> selectSearch(PageRequestDTO pageRequestDTO);
    int getCount(PageRequestDTO pageRequestDTO);
}
