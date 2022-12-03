package com.example.demo.controller;

import com.example.demo.bean.AllMonsterBean;
import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.bean.PersonalMonsterBean;
import com.example.demo.service.impl.AllMonsterServiceImpl;
import com.example.demo.service.impl.AnnoyanceServiceImpl;
import com.example.demo.service.impl.PersonalMonsterServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
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
    private final AllMonsterServiceImpl allMonsterService;
    private final PersonalMonsterServiceImpl personalMonsterService;

    private final String CONTENT_FILE = "D:/monsters/back-end/file/annoyance/content/";
    private final String MOOD_FILE = "D:/monsters/back-end/file/annoyance/mood/";

    @ResponseBody
    @PostMapping("/create")
    public ResponseEntity createAnnoyance(@RequestBody AnnoyanceBean annoyanceBean) {
        int index = 0;
        boolean isAddMonster = true;
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            if (annoyanceBean.getContent() == null && annoyanceBean.getContent().isEmpty() && annoyanceBean.getContentFile() == null && annoyanceBean.getContentFile().isEmpty()) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                try {
                    if (annoyanceBean.getContent() == null || annoyanceBean.getContent().isEmpty()) {
                        System.out.println(annoyanceBean.getContentFile().getName());
                        byte[] contentBytes = annoyanceBean.getContentFile().getBytes();
                        Path contentPath = Paths.get(CONTENT_FILE + LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd")) + annoyanceBean.getContentFile().getOriginalFilename());
                        Files.write(contentPath, contentBytes);
                        annoyanceBean.setContent(contentPath.toString());
                    }
                    if (annoyanceBean.getMood().equals("是")) {
                        byte[] moodBytes = annoyanceBean.getMoodFile().getBytes();
                        Path moodPath = Paths.get(MOOD_FILE + LocalDateTime.now().format(DateTimeFormatter.ofPattern("MMdd")) + annoyanceBean.getMoodFile().getOriginalFilename());
                        Files.write(moodPath, moodBytes);
                        annoyanceBean.setMood(moodPath.toString());
                    }
                    List<AllMonsterBean> allMonster = allMonsterService.searchAll();
                    index = (int) (Math.random() * allMonster.size());
                    while (allMonster.get(index).getMain() != 1) {
                        index = (int) (Math.random() * allMonster.size());
                    }
                    annoyanceBean.setMonsterId(allMonster.get(index).getId());
                    annoyanceService.createAndReturnBean(annoyanceBean);
                    PersonalMonsterBean personalMonsterBean = new PersonalMonsterBean();
                    List<PersonalMonsterBean> personalMonsterList = personalMonsterService.findByAccount(annoyanceBean.getAccount());
                    for (PersonalMonsterBean personalMonster : personalMonsterList) {
                        System.out.println(personalMonster.getMonsterId() + "/" + allMonster.get(index).getId());
                        if (personalMonster.getMonsterId().equals(allMonster.get(index).getId())) {
                            isAddMonster = false;
                            break;
                        }
                    }
                    System.out.println(isAddMonster);
                    if(isAddMonster){
                        personalMonsterBean.setAccount(annoyanceBean.getAccount());
                        personalMonsterBean.setMonsterId(allMonster.get(index).getId());
                        personalMonsterBean.setMonsterGroup(allMonster.get(index).getGroup());
                        personalMonsterService.createAndReturnBean(personalMonsterBean);
                    }
                    result.put("result", true);
                    result.put("errorCode", "200");
                    result.put("message", "新增成功");
                } catch (IOException e) {
                    System.out.println(annoyanceBean.toString());
                    System.out.println(e);
                    result.put("result", false);
                    result.put("errorCode", "");
                    result.put("message", "新增失敗");
                }
            }
        } catch (Exception e) {
            System.out.println(annoyanceBean.toString());
            System.out.println(e);
            result.put("result", false);
            result.put("errorCode", "");
            result.put("message", "新增失敗");
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @PatchMapping("/modify/{id}")
    public ResponseEntity modifyAnnoyance(@PathVariable(name = "id") int id, AnnoyanceBean annoyanceBean) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        annoyanceService.update(id, annoyanceBean);
        result.put("result", true);
        result.put("errorCode", "200");
        result.put("message", "修改成功");
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
}
