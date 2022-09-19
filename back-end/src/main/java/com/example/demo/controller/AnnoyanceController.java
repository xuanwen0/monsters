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
    @ResponseBody
    @PostMapping("/create")
    public ResponseEntity createAnnoyance(@RequestBody AnnoyanceBean annoyanceBean) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            annoyanceService.createAndReturnBean(annoyanceBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @GetMapping(path = "search", params = "account", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchAnnoyanceByAccount(@RequestParam(name = "account") String account) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnnoyanceBean> annoyanceList = annoyanceService.searchAnnoyanceByAccount(account);
            Collections.sort(annoyanceList, new Comparator<AnnoyanceBean>() {
                @Override
                public int compare(AnnoyanceBean o1, AnnoyanceBean o2) {
                    return o2.getTime().compareTo(o1.getTime());
                }
            });
            for (AnnoyanceBean annoyanceBean : annoyanceList){
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
