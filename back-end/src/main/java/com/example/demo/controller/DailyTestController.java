package com.example.demo.controller;

import com.example.demo.bean.DailyTestBean;
import com.example.demo.entity.DailyTest;
import com.example.demo.service.impl.DailyTestServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/dailyTest")
public class DailyTestController {
    private final DailyTestServiceImpl dailyTestService;

    @ResponseBody
    @GetMapping(path = "search", produces = "application/json; charset=UTF-8")
    public String searchDailyTest(DailyTestBean dailyTestBean) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.put("result", true);
        result.put("errorCode", "");
        result.put("message", "查詢成功");
        try {
            List<DailyTest> dailyTestsList = dailyTestService.find();
            int index = (int) (Math.random() * dailyTestsList.size());
            result.put("id", dailyTestsList.get(index).getId());
            result.put("question", dailyTestsList.get(index).getQuestion());
            result.put("optionOne", dailyTestsList.get(index).getOptionOne());
            result.put("optionTwo", dailyTestsList.get(index).getOptionTwo());
            result.put("optionThree", dailyTestsList.get(index).getOptionThree());
            result.put("optionFour", dailyTestsList.get(index).getOptionFour());
            result.put("answer", dailyTestsList.get(index).getAnswer());
            result.put("learn", dailyTestsList.get(index).getLearn());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapper.writeValueAsString(result);
    }

}
