package org.zerock.company.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.zerock.company.vo.TodoVO;
import org.zerock.company.dto.PageRequestDTO;

import java.util.List;

@Mapper
public interface TodoMapper {

    String getTime();

    void insert(TodoVO todo);

    List<TodoVO> selectAll();

    TodoVO selectById(Long num);

    void deleteById(Long num);

    void updateById(TodoVO todo);
    void updateVisitCount(Long num);

    List<TodoVO> selectSearch(PageRequestDTO pageRequestDTO);


    int getCount(PageRequestDTO pageRequestDTO);
}
