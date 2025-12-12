package org.zerock.springex.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.Arrays;


@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
    
    @Builder.Default //builder사용시 기본값을 1로 설정
    @Min(value=1) // 최소값 1
    @Positive // 양수만 저장 가능하도록 설정
    private int page = 1; // 페이지를 저장하는 변수
    @Builder.Default
    @Min(value=10)
    @Max(value=100)
    private int size = 10; // 한 페이지에 출력하는 데이터의 개수

    private String link; // 페이지 이동시의 링크 데이터 변수
    private String[] types; // 검색조건 : 제목, 작성자 선택 데이터 변수
    private String keyword; // 검색어
    private boolean finished; // 완료여부
    private LocalDate from; // 검색 시작날짜
    private LocalDate to; // 검색 종료날짜

    // SQL에서 limit 사용시 시작번호 설정
    private int getSkip() {
        // 1페이지 : (1-1)*10 = 0
        // 2페이지 : (2-1)*10 = 10
        // 3페이지 : (3-1)*10 = 20
        return (page - 1) * size;
    }
    public boolean checkType(String type){
        // types안에 제목, 작성자가 없을 경우 false반환
        if(types==null || types.length==0){
            return false;
        }
        return Arrays.stream(types).anyMatch(type::equals);
    }
    public String getLink(){
        StringBuilder builder = new StringBuilder();
        builder.append("page="+this.page); // 페이지 데이터 설정
        builder.append("&size="+this.size); // 사이즈 설정
        if(finished){
            // 완료 여부가 체크되어있을 경우 on으로 설정
            builder.append("&finished=on");
        }
        if(types!=null && types.length>0){
//          type데이터 (제목, 작성자) 가 설정되어 있을 경우 링크에 추가하는 설정
            for(int i=0;i<types.length;i++){
                builder.append("&types="+types[i]);
            }
        }
        if(keyword!=null){
            try{
                // keyword에 한글이 있는 경우 깨지지 않도록 UTF-8로 설정하여 저장
                builder.append("&keyword="+ URLEncoder.encode(keyword, "UTF-8"));
            }catch (UnsupportedEncodingException e){
                e.printStackTrace();
            }
        }
        if(from!=null){
//          시작 날짜 설정
            builder.append("&from="+from);
        }
        if(to!=null){
//          종료 날짜 설정
            builder.append("&to="+to);
        }
//      완성된 링크 데이터를 반환
        return builder.toString();
    }
}
