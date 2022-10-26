package com.example.demo.controller;

import com.example.demo.bean.AnnoyanceBean;
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

    private final String UPLOADED_FOLDER = "./file/";

    @ResponseBody
    @PostMapping("/create")
    public ResponseEntity createAnnoyance(AnnoyanceBean annoyanceBean, RedirectAttributes redirectAttributes) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            if (annoyanceBean.getContentFile().isEmpty() && annoyanceBean.getContent() == null) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                try {
                    if (annoyanceBean.getContent() == null) {
                        byte[] bytes = annoyanceBean.getContentFile().getBytes();
                        Path path = Paths.get(UPLOADED_FOLDER + annoyanceBean.getContentFile().getOriginalFilename());
                        Files.write(path, bytes);
                        System.out.println(path.toString());
                        annoyanceBean.setContent(path.toString());
                        System.out.println(annoyanceBean.getContent());
                        annoyanceService.createAndReturnBean(annoyanceBean);
                        result.put("result", true);
                        result.put("errorCode", "");
                        result.put("message", "新增成功");
                    }
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
            result.put("result", false);
            result.put("errorCode", "");
            result.put("message", "新增失敗");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @GetMapping(path = "/search", params = "account", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchAnnoyanceByAccount(@RequestParam(name = "account") String account) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnnoyanceBean> annoyanceList = annoyanceService.searchAnnoyanceByAccount(account);
            if (annoyanceList.size() != 0) {
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
            } else {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "查詢失敗");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
