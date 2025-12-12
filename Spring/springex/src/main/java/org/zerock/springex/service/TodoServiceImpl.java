package org.zerock.springex.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.zerock.springex.dto.PageRequestDTO;
import org.zerock.springex.dto.PageResponseDTO;
import org.zerock.springex.dto.TodoDTO;
import org.zerock.springex.mappers.TodoMapper;
import org.zerock.springex.vo.TodoVO;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService {
//  의존성 주입 : private final과 @RequiredArgsConstructor를 사용하는 방식
    private final TodoMapper todoMapper;
    @Override
    public void register(TodoDTO dto) {
        // DTO를 VO로 변환
        // DTO : 화면 출력, 비즈니스 로직에 사용하는 데이터 저장 용도
        // VO : DB의 컬럼과 1대1 매칭이 되도록 하여 테이블관련 처리에 사용하는 용도
        TodoVO vo = dto.convertVO();
        // INSERT SQL문 실행
        todoMapper.insert(vo);
    }

    @Override
    public List<TodoDTO> getAll() {
        // mapper에서 받은 Vo리스트를 화면에서 사용할 DTO리스트로 변경하여 반환
        return todoMapper.selectAll().stream()
                .map(vo -> new TodoDTO(vo))
                .collect(Collectors.toList()); // 안의 내용이 변경 가능한 리스트
            // .toList(); 내용을 변경할 수 없는 리스트로 변경
    }

    @Override
    public TodoDTO getById(Long tno) {
        // DB에서 할일 데이터 1개를 조회 후 VO에 저장
        TodoVO vo = todoMapper.selectById(tno);
        // VO를 DTO로 변환
        TodoDTO dto = new TodoDTO(vo);
        // Controller에 반환
        return dto;
        // return new TodoDTO(todoMapper.selectById(tno));
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
        // DB에서 할일 목록 조회
        List<TodoVO> voList = todoMapper.selectSearch(pageRequestDTO);
        // VO를 DTO로 변환
        List<TodoDTO> dtoList = voList.stream()
                .map(vo -> new TodoDTO(vo))
                .collect(Collectors.toList());
        // 페이징에 필요한 dto를 생성하여 반환
        return PageResponseDTO.<TodoDTO>withAll()
                        .pageRequestDTO(pageRequestDTO)
                        .dtoList(dtoList)
                        .total(todoMapper.getCount(pageRequestDTO))
                        .build();

    }
}
