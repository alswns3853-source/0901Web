package org.zerock.springex.controller.formatter;

import org.springframework.format.Formatter;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

// 화면에서 보내는 String 날짜 데이터를 날짜 자료형인 LocalDate로 변경하는 클래스
public class LocalDateFormatter  implements Formatter<LocalDate> {
    @Override
    public LocalDate parse(String text, Locale locale) throws ParseException {
//      String 데이터를 LocalDate 형식으로 변환하여 반환
        return LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    }

    @Override
    public String print(LocalDate object, Locale locale) {
//      LocalDate 데이터를 String 형식으로 변환하여 반환
        return DateTimeFormatter.ofPattern("yyyy-MM-dd").format(object);
    }
}
