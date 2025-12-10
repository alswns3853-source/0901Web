package org.zerock.springex.mappers;

import org.zerock.springex.vo.TodoVO;

public interface TodoMapper {
    String getTime();
    void insert(TodoVO vo);
}
