package com.example.demo.controller;

import com.example.demo.bean.AnswerBookBean;
import com.example.demo.bean.DailyTestBean;
import com.example.demo.bean.MindGameBean;
import com.example.demo.service.impl.AnswerBookServiceImpl;
import com.example.demo.service.impl.DailyTestServiceImpl;
import com.example.demo.service.impl.MindGameServiceImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/interaction")
public class InteractionController {
    private final AnswerBookServiceImpl answerBookService;
    private final DailyTestServiceImpl dailyTestService;
    private final MindGameServiceImpl mindGameService;


    @ResponseBody
    @GetMapping(path = "/answerBook", produces = "application/json; charset=UTF-8")
    public String searchAnswerBook() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnswerBookBean> answerBooksList = answerBookService.searchAll();
            int index = (int) (Math.random() * answerBooksList.size());
            ObjectNode answerBookNode = dataNode.addObject();
            answerBookNode.put("id", answerBooksList.get(index).getId());
            answerBookNode.put("content", answerBooksList.get(index).getContent());
            result.put("result", true);
            result.put("errorCode", "200");
            result.put("message", "查詢成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapper.writeValueAsString(result);
    }

    @ResponseBody
    @GetMapping(path = "/dailyTest", produces = "application/json; charset=UTF-8")
    public String searchDailyTest() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<DailyTestBean> dailyTestsList = dailyTestService.searchAll();
            int index = (int) (Math.random() * dailyTestsList.size());
            ObjectNode dailyTestNode = dataNode.addObject();
            dailyTestNode.put("id", dailyTestsList.get(index).getId());
            dailyTestNode.put("question", dailyTestsList.get(index).getQuestion());
            dailyTestNode.put("optionOne", dailyTestsList.get(index).getOptionOne());
            dailyTestNode.put("optionTwo", dailyTestsList.get(index).getOptionTwo());
            dailyTestNode.put("optionThree", dailyTestsList.get(index).getOptionThree());
            dailyTestNode.put("optionFour", dailyTestsList.get(index).getOptionFour());
            dailyTestNode.put("answer", dailyTestsList.get(index).getAnswer());
            dailyTestNode.put("learn", dailyTestsList.get(index).getLearn());

            result.put("result", true);
            result.put("errorCode", "200");
            result.put("message", "查詢成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mapper.writeValueAsString(result);
    }

    @ResponseBody
    @GetMapping(path = "/mindGame", produces = "application/json; charset=UTF-8")
    public ResponseEntity searchMindGame() {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<MindGameBean> mindGameList = mindGameService.searchMindGame();
            for (MindGameBean mindGameBean : mindGameList) {
                ObjectNode mindGameNode = dataNode.addObject();
                mindGameNode.put("id", mindGameBean.getId());
                mindGameNode.put("name", mindGameBean.getName());
                mindGameNode.put("web", mindGameBean.getWeb());
            }
            result.put("result", true);
            result.put("errorCode", "200");
            result.put("message", "查詢成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
}
