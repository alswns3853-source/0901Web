package org.zerock.springex.service;

import org.zerock.springex.dto.TodoDTO;

import java.util.List;

public interface TodoService {
    void register(TodoDTO dto);
    List<TodoDTO> getAll();
    TodoDTO getById(Long tno);
    void remove(Long tno);
    void edit(TodoDTO dto);
}
