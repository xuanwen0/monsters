package com.example.demo.controller;

import com.example.demo.bean.MindGameBean;
import com.example.demo.service.impl.MindGameServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@AllArgsConstructor
@Controller
@RequestMapping(value = "/mindGame")
public class MindGameController {
    private final MindGameServiceImpl mindGameService;

    @ResponseBody
    @GetMapping(path = "search", params = "id", produces = "application/json; charset=UTF-8")
    public ResponseEntity searchMindGameById(@RequestParam(name = "id") Integer id) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");

        try {
            List<MindGameBean> mindGameList = mindGameService.searchMindGameById(id);

            for (MindGameBean mindGameBean : mindGameList){
                ObjectNode mindGameNode = dataNode.addObject();
                mindGameNode.put("id", mindGameBean.getId());
                mindGameNode.put("name", mindGameBean.getName());
                mindGameNode.put("web", mindGameBean.getWeb());
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
