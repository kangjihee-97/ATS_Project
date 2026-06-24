package com.ats.project.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Component
public class FileUtil {

    @Value("${file.upload.path}")
    private String uploadPath;

    // 허용 확장자
    private static final List<String> ALLOWED =
        Arrays.asList("pdf","doc","docx","hwp");

    // 최대 파일 크기 (10MB)
    private static final long MAX_SIZE = 10 * 1024 * 1024;

    /* 파일 저장 */
    public String save(MultipartFile file) throws IOException {

        if (file == null || file.isEmpty())
            throw new IllegalArgumentException("파일이 없습니다.");

        if (file.getSize() > MAX_SIZE)
            throw new IllegalArgumentException("파일 크기는 10MB 이하만 가능합니다.");

        String original  = file.getOriginalFilename();
        String extension = getExtension(original);

        if (!ALLOWED.contains(extension.toLowerCase()))
            throw new IllegalArgumentException(
                "PDF, DOC, DOCX, HWP 파일만 업로드 가능합니다.");

        // UUID로 저장 파일명 생성 (중복 방지)
        String saved = UUID.randomUUID().toString() + "." + extension;

        // 폴더 없으면 생성
        File dir = new File(uploadPath);
        if (!dir.exists()) dir.mkdirs();

        file.transferTo(new File(uploadPath + saved));
        return saved;
    }

    /* 파일 삭제 */
    public void delete(String savedName) {
        if (savedName == null || savedName.isBlank()) return;
        File file = new File(uploadPath + savedName);
        if (file.exists()) file.delete();
    }

    /* 파일 객체 반환 (다운로드용) */
    public File getFile(String savedName) {
        return new File(uploadPath + savedName);
    }

    /* 확장자 추출 */
    private String getExtension(String filename) {
        if (filename == null || !filename.contains("."))
            throw new IllegalArgumentException("올바른 파일명이 아닙니다.");
        return filename.substring(filename.lastIndexOf(".") + 1);
    }
}