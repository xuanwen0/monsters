package com.example.demo.controller;

import com.example.demo.bean.DiaryBean;
import com.example.demo.service.impl.DiaryServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/diary")
public class DiaryController {

    private final DiaryServiceImpl diaryServiceimpl;

    private final String CONTENT_FILE = "D:/monsters/back-end/file/history/";

    @ResponseBody
    @PostMapping("/create")
    public ResponseEntity createAnnoyance(DiaryBean diarybean, RedirectAttributes redirectAttributes) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            if (diarybean.getContentFile().isEmpty() && diarybean.getContent() == null) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                try {
                    if (diarybean.getContent() == null) {
                        byte[] contentBytes = diarybean.getContentFile().getBytes();
                        Path contentPath = Paths.get(CONTENT_FILE + LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd")) + diarybean.getContentFile().getOriginalFilename());
                        Files.write(contentPath, contentBytes);
                        diarybean.setContent(contentPath.toString());

                    }
                    diaryServiceimpl.createAndReturnBean(diarybean);
                    result.put("result", true);
                    result.put("errorCode", "");
                    result.put("message", "新增成功");
                } catch (IOException e) {
                    result.put("result", false);
                    result.put("errorCode", "");
                    result.put("message", "新增失敗");
                }
            }
        } catch (Exception e) {
            result.put("result", false);
            result.put("errorCode", "");
            result.put("message", "新增失敗");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
}