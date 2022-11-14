package com.example.demo.controller;

import com.example.demo.bean.PersonalInfoBean;
import com.example.demo.service.PersonalInfoService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/member")
public class PersonalInfoController {
    private final PersonalInfoService personalInfoService;
    private final PasswordEncoder passwordEncoder;

    @ResponseBody
    @PostMapping(value = "/create")
    public ResponseEntity register(@RequestBody PersonalInfoBean personalInfoBean) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            personalInfoService.createAndReturnBean(personalInfoBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.put("result", true);
        result.put("errorCode", "");
        result.put("message", "新增成功");
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @PostMapping(value = "/login")
    public ResponseEntity login(@RequestBody PersonalInfoBean personalInfoBean){
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        try {
            Optional<PersonalInfoBean> personalInfoBeanOptional = personalInfoService.getByPK(personalInfoBean.getAccount());
            PersonalInfoBean local = personalInfoBeanOptional.get();
            if(passwordEncoder.matches(personalInfoBean.getPassword(), local.getPassword())){
                result.put("account", local.getAccount());
                result.put("birthday", local.getBirthday().toString());
                result.put("mail",local.getMail());
                result.put("nickName", local.getNickName());
                result.put("password", local.getPassword());
                result.put("lock",local.getPhoto());
                result.put("photo",local.getPhoto());
                result.put("dailyTest", local.getDailyTest());
            }
            result.put("result", true);
            result.put("errorCode", "");
            result.put("message", "登入成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @GetMapping(path = "search", params = "account", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchPersonalInfoByAccount(@RequestParam(name = "account") String account) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<PersonalInfoBean> personalInfoList = personalInfoService.searchPersonalInfoByAccount(account);
            for (PersonalInfoBean personalInfoBean : personalInfoList) {
                String birthday = personalInfoBean.getBirthday().toString().replace("-", "/");
                ObjectNode personalInfoNode = dataNode.addObject();
                personalInfoNode.put("nickName", personalInfoBean.getNickName());
                personalInfoNode.put("birthday", birthday.substring(birthday.length() - 5));
                personalInfoNode.put("mail", personalInfoBean.getMail());
            }
            result.put("result", true);
            result.put("errorCode", "");
            result.put("message", "查詢成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @Transactional(readOnly = true)
    @PatchMapping(value = "/modify")
    public ResponseEntity patch(@RequestBody PersonalInfoBean personalInfoBean){
        personalInfoService.update(personalInfoBean.getAccount(), personalInfoBean);
        return ResponseEntity.ok("修改成功");
    }

}
