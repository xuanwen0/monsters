package com.example.demo.controller;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.dto.file.FileUploadServiceImpl;
import com.example.demo.service.impl.AnnoyanceServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author linwe
 */
@AllArgsConstructor
@Controller
@RequestMapping(value = "/annoyance")
public class AnnoyanceController {
    private final AnnoyanceServiceImpl annoyanceService;
    private final FileUploadServiceImpl fileUploadService;

    private final String CONTENT_FILE = "D:/monsters/back-end/file/annoyance/content/";
    private final String MOOD_FILE = "D:/monsters/back-end/file/annoyance/mood/";

    @ResponseBody
    @PostMapping("/create")
    public ResponseEntity createAnnoyance(@RequestBody AnnoyanceBean annoyanceBean, RedirectAttributes redirectAttributes) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            if (annoyanceBean.getContent() == null && annoyanceBean.getContent().isEmpty() && annoyanceBean.getContentFile() == null && annoyanceBean.getContentFile().isEmpty()) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                try {
                    if (annoyanceBean.getContent() == null || annoyanceBean.getContent().isEmpty()) {
                        System.out.println(annoyanceBean.getContentFile().getName());
                        byte[] contentBytes = annoyanceBean.getContentFile().getBytes();
                        Path contentPath = Paths.get(CONTENT_FILE + LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd")) + annoyanceBean.getContentFile().getOriginalFilename());
                        Files.write(contentPath, contentBytes);
                        annoyanceBean.setContent(contentPath.toString());
                    }
                    if (annoyanceBean.getMood().equals("是")) {
                        byte[] moodBytes = annoyanceBean.getMoodFile().getBytes();
                        Path moodPath = Paths.get(MOOD_FILE + LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd")) + annoyanceBean.getMoodFile().getOriginalFilename());
                        Files.write(moodPath, moodBytes);
                        annoyanceBean.setMood(moodPath.toString());
                    }
                    System.out.println(annoyanceBean.toString());
                    annoyanceService.createAndReturnBean(annoyanceBean);
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
            System.out.println(annoyanceBean.toString());
            System.out.println(e);
            result.put("result", false);
            result.put("errorCode", "");
            result.put("message", "新增失敗");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
    @ResponseBody
    @GetMapping(path = "/search/social", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchAnnoyanceByShare() {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnnoyanceBean> annoyanceList = annoyanceService.searchAnnoyanceByShare();
            Collections.sort(annoyanceList, new Comparator<AnnoyanceBean>() {
                @Override
                public int compare(AnnoyanceBean o1, AnnoyanceBean o2) {
                    return o2.getTime().compareTo(o1.getTime());
                }
            });
            for (AnnoyanceBean annoyanceBean : annoyanceList) {
                ObjectNode annoyanceNode = dataNode.addObject();
                annoyanceNode.put("id", annoyanceBean.getId());
                annoyanceNode.put("account", annoyanceBean.getAccount());
                annoyanceNode.put("content", annoyanceBean.getContent());
                annoyanceNode.put("type", annoyanceBean.getType().getId());
                annoyanceNode.put("monsterId", annoyanceBean.getMonsterId());
                annoyanceNode.put("mood", annoyanceBean.getMood());
                annoyanceNode.put("index", annoyanceBean.getIndex());
                annoyanceNode.put("time", annoyanceBean.getTime().format(DateTimeFormatter.ofPattern("MM/dd")));
                annoyanceNode.put("solve", annoyanceBean.getSolve());
                annoyanceNode.put("share", annoyanceBean.getShare());
            }
            result.put("result", true);
            result.put("errorCode", "");
            result.put("message", "查詢成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
}
