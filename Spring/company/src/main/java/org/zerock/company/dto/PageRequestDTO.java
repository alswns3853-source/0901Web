package org.zerock.company.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Positive;
import lombok.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class PageRequestDTO {

    @Builder.Default
    @Min(1)
    @Positive
    private int page = 1;

    @Builder.Default
    @Min(10)
    @Max(100)
    private int size = 10;

    private String keyword;

    public int getSkip() {
        return (page - 1) * size;
    }

    public String getLink() {
        StringBuilder builder = new StringBuilder();

        builder.append("page=").append(this.page);
        builder.append("&size=").append(this.size);

        if (keyword != null && !keyword.isBlank()) {
            try {
                builder.append("&keyword=")
                        .append(URLEncoder.encode(keyword, "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

        return builder.toString();
    }
}
