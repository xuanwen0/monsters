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
            for (AnnoyanceBean annoyanceBean : annoyanceList){
                ObjectNode annoyanceNode = dataNode.addObject();
                annoyanceNode.put("id", annoyanceBean.getId());
                annoyanceNode.put("account", annoyanceBean.getAccount());
                annoyanceNode.put("content", annoyanceBean.getContent());
                annoyanceNode.put("type", annoyanceBean.getType().getId());
                annoyanceNode.put("monsterId", annoyanceBean.getMonsterId());
                annoyanceNode.put("mood", annoyanceBean.getIndex());
                annoyanceNode.put("index", annoyanceBean.getIndex());
                annoyanceNode.put("time", annoyanceBean.getTime().format(DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm:ss")));
                annoyanceNode.put("solve", annoyanceBean.getSolve());
                annoyanceNode.put("share", annoyanceBean.getShare());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

}
