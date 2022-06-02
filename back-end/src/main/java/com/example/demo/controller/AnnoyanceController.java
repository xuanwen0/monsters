package com.example.demo.controller;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.service.impl.AnnoyanceServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/annoyance")
public class AnnoyanceController {
    private final AnnoyanceServiceImpl annoyanceService;

    @ResponseBody
    @PostMapping("create")
    public ResponseEntity createAnnoyance(@RequestBody AnnoyanceBean annoyanceBean) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            annoyanceService.createAndReturnBean(annoyanceBean);
            System.out.println(annoyanceBean.getAccount());
            System.out.println(annoyanceBean.getContext());
            System.out.println(annoyanceBean.getType());
            System.out.println(annoyanceBean.getMood());
            System.out.println(annoyanceBean.getIndex());
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("result", true);
        result.put("errorCode", "");
        result.put("message", "新增成功");
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
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("result", true);
        result.put("errorCode", "");
        result.put("message", "查詢成功");
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

}