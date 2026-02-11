package me.shinsunyoung.springbootdeveloper.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class UploadFileDTO {
    // 화면에서 받아온 파일을 저장하는 변수
    private List<MultipartFile> files;
}
