package me.shinsunyoung.springbootdeveloper.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.net.URLEncoder;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageRequestDTO {
    @Builder.Default
    private int page = 1; // 페이지 번호
    @Builder.Default
    private int size = 10; // 출력 개수
    private String types; // 검색 조건
    private String keyword; // 검색어
    private String link; // 페이지, 사이즈, 검색조건등을 url맞게 반환하는 변수

    // Pageable 생성 메서드
    public Pageable getPageable(){
        return PageRequest.of(Math.max(page-1, 0),size,Sort.by("id").descending());
    }
    public String[] splitTypes(){
        if(types==null || types.length()==0){
            return null;
        }
        return types.split("");
    }

    public String getLink(){
        StringBuilder builder = new StringBuilder();
        builder.append("page="+this.page);
        builder.append("&size="+this.size);
        if(types!=null && splitTypes().length>0){
            builder.append("&types="+types);
        }
        if(keyword!=null){
            try{
                builder.append("&keyword="+ URLEncoder.encode(keyword,"UTF-8"));
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return builder.toString();
    }
}
