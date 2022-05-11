package com.example.demo.controller;

import com.example.demo.bean.AnswerBookBean;
import com.example.demo.entity.AnswerBook;
import com.example.demo.service.AnswerBookService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Random;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/answerBook")
public class AnswerBookController {
    private final AnswerBookService answerBookService;

    @ResponseBody
    @GetMapping("search")
    public String searchAnswerBook(AnswerBookBean answerBookBean) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.put("result", true);
        result.put("errorCode", "");
        result.put("message", "查詢成功");
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnswerBook> answerBooksList = answerBookService.find();
            int index = (int) (Math.random()*answerBooksList.size());
                ObjectNode answerBookNode = dataNode.addObject();
                answerBookNode.put("id", answerBooksList.get(index).getId());
                answerBookNode.put("content", answerBooksList.get(index).getContent());
                System.out.print(answerBookBean.getId());
                System.out.println(answerBookBean.getContent());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapper.writeValueAsString(result);
    }

}
