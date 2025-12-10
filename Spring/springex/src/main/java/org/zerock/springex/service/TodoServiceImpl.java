package org.zerock.springex.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.zerock.springex.dto.TodoDTO;
import org.zerock.springex.mappers.TodoMapper;
import org.zerock.springex.vo.TodoVO;

@Service
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {
    private final TodoMapper todoMapper;
    @Override
    public void register(TodoDTO dto) {
        // DTO를 VO로 변환
        TodoVO vo = dto.convertVO();
        // INSERT SQL문 실행
        todoMapper.insert(vo);
    }
}
