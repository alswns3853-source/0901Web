package org.zerock.company.service;



import org.zerock.company.dto.PageRequestDTO;

import org.zerock.company.dto.PageResponseDTO;
import org.zerock.company.dto.TodoDTO;

import java.util.List;

public interface TodoService {
    void register(TodoDTO dto);
    List<TodoDTO> getAll();
    TodoDTO getById(Long tno);
    void remove(Long tno);
    void edit(TodoDTO dto);
    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);
    void editVisitCount(Long num);
}
