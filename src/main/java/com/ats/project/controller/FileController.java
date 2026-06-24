package com.ats.project.controller;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.ats.project.util.FileUtil;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class FileController {

    @Autowired
    private FileUtil fileUtil;

    /* 파일 업로드 (Ajax) */
    @PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<Map<String, String>> upload(
            @RequestParam("file") MultipartFile file) {
        try {
            String saved = fileUtil.save(file);
            return ResponseEntity.ok(Map.of(
                "result",   "success",
                "saved",    saved,
                "original", file.getOriginalFilename()
            ));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of(
                "result",  "fail",
                "message", e.getMessage()
            ));
        }
    }

    /* 파일 다운로드 */
    @GetMapping("/download/{saved}")
    public void download(@PathVariable String saved,
                         @RequestParam(defaultValue = "file") String original,
                         HttpServletResponse response) throws IOException {

        File file = fileUtil.getFile(saved);

        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
            return;
        }

        String encoded = URLEncoder.encode(original, StandardCharsets.UTF_8)
                                   .replace("+", "%20");

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition",
            "attachment; filename*=UTF-8''" + encoded);
        response.setContentLengthLong(file.length());

        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os  = response.getOutputStream()) {
            byte[] buf = new byte[4096];
            int    len;
            while ((len = fis.read(buf)) != -1) os.write(buf, 0, len);
        }
    }
}