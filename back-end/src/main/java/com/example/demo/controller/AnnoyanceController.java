package com.example.demo.controller;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.service.AnnoyanceService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/annoyance")
public class AnnoyanceController {
    private final AnnoyanceService annoyanceService;

    @ResponseBody
    @PostMapping("create")
    public ResponseEntity createAnnoyance(@RequestBody AnnoyanceBean annoyanceBean) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            System.out.println(annoyanceBean.getAccount());
            System.out.println(annoyanceBean.getContext());
            System.out.println(annoyanceBean.getType());
            System.out.println(annoyanceBean.getMood());
            System.out.println(annoyanceBean.getIndex());
            annoyanceBean = annoyanceService.create(annoyanceBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("result", true);
        result.put("errorCode", "");
        result.put("message", "新增成功");
        return ResponseEntity.status(HttpStatus.CREATED).body(annoyanceBean);
    }

}