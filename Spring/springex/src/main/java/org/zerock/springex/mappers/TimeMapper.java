package org.zerock.springex.mappers;

import org.apache.ibatis.annotations.Select;

// 매개변수가 없는 고정된 SQL문을 실행하는 경우 사용하는 방식
public interface TimeMapper {
//  @Select(SQL문) : SELECT를 실행하는 메서드 구현
    @Select("SELECT now()")
//  SELECT의 결과를 반환할 반환타입 메서드이름(매개변수);
    String getTime();
}
