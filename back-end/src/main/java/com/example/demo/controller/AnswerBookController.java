package com.example.demo.controller;

import com.example.demo.bean.AnswerBookBean;
import com.example.demo.service.impl.AnswerBookServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/answerBook")
public class AnswerBookController {
    private final AnswerBookServiceImpl answerBookService;

    @ResponseBody
    @GetMapping(path = "search", produces = "application/json; charset=UTF-8")
    public String searchAnswerBook(AnswerBookBean answerBookBean) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.put("result", true);
        result.put("errorCode", "");
        result.put("message", "查詢成功");
        try {
            List<AnswerBookBean> answerBooksList = answerBookService.searchAll();
            int index = (int) (Math.random() * answerBooksList.size());
            result.put("id", answerBooksList.get(index).getId());
            result.put("content", answerBooksList.get(index).getContent());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapper.writeValueAsString(result);
    }

}
