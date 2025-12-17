package org.zerock.company.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.zerock.company.dto.PageRequestDTO;
import org.zerock.company.dto.PageResponseDTO;
import org.zerock.company.dto.TodoDTO;
import org.zerock.company.mappers.TodoMapper;
import org.zerock.company.vo.TodoVO;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {

    private final TodoMapper todoMapper;

    @Override
    public void register(TodoDTO dto) {
        TodoVO vo = dto.convertVO();
        todoMapper.insert(vo);
    }

    @Override
    public List<TodoDTO> getAll() {
        return todoMapper.selectAll().stream()
                .map(vo -> new TodoDTO(vo))
                .collect(Collectors.toList());
    }

    @Override
    public TodoDTO getById(Long tno) {
        TodoVO vo = todoMapper.selectById(tno);
        TodoDTO dto = new TodoDTO(vo);
        return dto;
    }

    @Override
    public void remove(Long tno) {
        todoMapper.deleteById(tno);
    }

    @Override
    public void edit(TodoDTO dto) {
        TodoVO vo = dto.convertVO();
        todoMapper.updateById(vo);
    }

    @Override
    public PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO) {
        // selectSearch 호출 시 XML에서 #{skip}, #{size}, #{keyword} 사용 가능
        List<TodoVO> voList = todoMapper.selectSearch(pageRequestDTO);
        List<TodoDTO> dtoList = voList.stream()
                .map(vo -> new TodoDTO(vo))
                .collect(Collectors.toList());



        return PageResponseDTO.<TodoDTO>withAll()
                .pageRequestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total(todoMapper.getCount(pageRequestDTO))
                .build();
    }

    @Override
    public void editVisitCount(Long num) {
        todoMapper.updateVisitCount(num);
    }
}
