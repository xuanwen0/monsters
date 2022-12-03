package com.example.demo.controller;

import com.example.demo.bean.AnnoyanceBean;
import com.example.demo.bean.DiaryBean;
import com.example.demo.bean.PersonalInfoBean;
import com.example.demo.service.impl.AnnoyanceServiceImpl;
import com.example.demo.service.impl.DiaryServiceImpl;
import com.example.demo.service.impl.PersonalInfoServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/social")
public class SocialController {
    private final AnnoyanceServiceImpl annoyanceService;
    private final DiaryServiceImpl diaryServiceimpl;
    private final PersonalInfoServiceImpl personalInfoService;

    @ResponseBody
    @GetMapping(path = "", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchSocialAll() {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnnoyanceBean> annoyanceList = annoyanceService.searchAnnoyanceByShare();
            List<DiaryBean> diaryList = diaryServiceimpl.searchAnnoyanceByShare();
            if (annoyanceList.size() != 0 || diaryList.size() != 0) {
                Collections.sort(annoyanceList, new Comparator<AnnoyanceBean>() {
                    @Override
                    public int compare(AnnoyanceBean o1, AnnoyanceBean o2) {
                        return o2.getTime().compareTo(o1.getTime());
                    }
                });
                Collections.sort(diaryList, new Comparator<DiaryBean>() {
                    @Override
                    public int compare(DiaryBean o1, DiaryBean o2) {
                        return o2.getTime().compareTo(o1.getTime());
                    }
                });
                for (AnnoyanceBean annoyanceBean : annoyanceList) {
                    ObjectNode annoyanceNode = dataNode.addObject();
                    Optional<PersonalInfoBean> personalInfo = personalInfoService.getByPK(annoyanceBean.getAccount());
                    String nickName = personalInfo.get().getNickName();
                    annoyanceNode.put("id", annoyanceBean.getId());
                    annoyanceNode.put("nickName", nickName);
                    annoyanceNode.put("content", annoyanceBean.getContent());
                    annoyanceNode.put("type", annoyanceBean.getType().getId());
                    annoyanceNode.put("monsterId", annoyanceBean.getMonsterId());
                    annoyanceNode.put("mood", annoyanceBean.getMood());
                    annoyanceNode.put("index", annoyanceBean.getIndex());
                    annoyanceNode.put("time", annoyanceBean.getTime().format(DateTimeFormatter.ofPattern("MM/dd")));
                    annoyanceNode.put("solve", annoyanceBean.getSolve());
                    annoyanceNode.put("share", annoyanceBean.getShare());
                }
                for (DiaryBean diaryBean : diaryList) {
                    ObjectNode diaryNode = dataNode.addObject();
                    Optional<PersonalInfoBean> personalInfo = personalInfoService.getByPK(diaryBean.getAccount());
                    String nickName = personalInfo.get().getNickName();
                    diaryNode.put("id", diaryBean.getId());
                    diaryNode.put("nickName", nickName);
                    diaryNode.put("content", diaryBean.getContent());
                    diaryNode.put("monsterId", diaryBean.getMonsterId());
                    diaryNode.put("index", diaryBean.getIndex());
                    diaryNode.put("time", diaryBean.getTime().format(DateTimeFormatter.ofPattern("MM/dd")));
                    diaryNode.put("share", diaryBean.getShare());
                }
                result.put("result", true);
                result.put("errorCode", "200");
                result.put("message", "查詢成功");
            } else {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "查詢失敗");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @GetMapping(path = "/annoyance", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchSocialByAnnoyance() {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnnoyanceBean> annoyanceList = annoyanceService.searchAnnoyanceByShare();
            if (annoyanceList.size() != 0) {
                Collections.sort(annoyanceList, new Comparator<AnnoyanceBean>() {
                    @Override
                    public int compare(AnnoyanceBean o1, AnnoyanceBean o2) {
                        return o2.getTime().compareTo(o1.getTime());
                    }
                });
                for (AnnoyanceBean annoyanceBean : annoyanceList) {
                    ObjectNode annoyanceNode = dataNode.addObject();
                    Optional<PersonalInfoBean> personalInfo = personalInfoService.getByPK(annoyanceBean.getAccount());
                    String nickName = personalInfo.get().getNickName();
                    annoyanceNode.put("id", annoyanceBean.getId());
                    annoyanceNode.put("content", annoyanceBean.getContent());
                    annoyanceNode.put("nickName", nickName);
                    annoyanceNode.put("type", annoyanceBean.getType().getId());
                    annoyanceNode.put("monsterId", annoyanceBean.getMonsterId());
                    annoyanceNode.put("mood", annoyanceBean.getMood());
                    annoyanceNode.put("index", annoyanceBean.getIndex());
                    annoyanceNode.put("time", annoyanceBean.getTime().format(DateTimeFormatter.ofPattern("MM/dd")));
                    annoyanceNode.put("solve", annoyanceBean.getSolve());
                    annoyanceNode.put("share", annoyanceBean.getShare());
                }
                result.put("result", true);
                result.put("errorCode", "200");
                result.put("message", "查詢成功");
            } else {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "查詢失敗");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @GetMapping(path = "/diary", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchSocialByDiary() {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<DiaryBean> diaryList = diaryServiceimpl.searchAnnoyanceByShare();
            if (diaryList.size() != 0) {
                Collections.sort(diaryList, new Comparator<DiaryBean>() {
                    @Override
                    public int compare(DiaryBean o1, DiaryBean o2) {
                        return o2.getTime().compareTo(o1.getTime());
                    }
                });
                for (DiaryBean diaryBean : diaryList) {
                    ObjectNode diaryNode = dataNode.addObject();
                    Optional<PersonalInfoBean> personalInfo = personalInfoService.getByPK(diaryBean.getAccount());
                    String nickName = personalInfo.get().getNickName();
                    diaryNode.put("id", diaryBean.getId());
                    diaryNode.put("nickName", nickName);
                    diaryNode.put("content", diaryBean.getContent());
                    diaryNode.put("monsterId", diaryBean.getMonsterId());
                    diaryNode.put("index", diaryBean.getIndex());
                    diaryNode.put("time", diaryBean.getTime().format(DateTimeFormatter.ofPattern("MM/dd")));
                    diaryNode.put("share", diaryBean.getShare());
                }
                result.put("result", true);
                result.put("errorCode", "200");
                result.put("message", "查詢成功");
            } else {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "查詢失敗");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

    @ResponseBody
    @GetMapping(path = "/{account}", produces = "application/json; charset=UTF-8")
    public ResponseEntity SearchSocialbyAccount(@PathVariable(name = "account") String account) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        ArrayNode dataNode = result.putArray("data");
        try {
            List<AnnoyanceBean> annoyanceList = annoyanceService.searchAnnoyanceByShareByAccount(account);
            List<DiaryBean> diaryList = diaryServiceimpl.searchAnnoyanceByShareByAccount(account);
            if (annoyanceList.size() != 0 || diaryList.size() != 0) {
                Collections.sort(annoyanceList, new Comparator<AnnoyanceBean>() {
                    @Override
                    public int compare(AnnoyanceBean o1, AnnoyanceBean o2) {
                        return o2.getTime().compareTo(o1.getTime());
                    }
                });
                Collections.sort(diaryList, new Comparator<DiaryBean>() {
                    @Override
                    public int compare(DiaryBean o1, DiaryBean o2) {
                        return o2.getTime().compareTo(o1.getTime());
                    }
                });
                for (AnnoyanceBean annoyanceBean : annoyanceList) {
                    ObjectNode annoyanceNode = dataNode.addObject();
                    Optional<PersonalInfoBean> personalInfo = personalInfoService.getByPK(annoyanceBean.getAccount());
                    String nickName = personalInfo.get().getNickName();
                    annoyanceNode.put("id", annoyanceBean.getId());
                    annoyanceNode.put("content", annoyanceBean.getContent());
                    annoyanceNode.put("nickName", nickName);
                    annoyanceNode.put("type", annoyanceBean.getType().getId());
                    annoyanceNode.put("monsterId", annoyanceBean.getMonsterId());
                    annoyanceNode.put("mood", annoyanceBean.getMood());
                    annoyanceNode.put("index", annoyanceBean.getIndex());
                    annoyanceNode.put("time", annoyanceBean.getTime().format(DateTimeFormatter.ofPattern("MM/dd")));
                    annoyanceNode.put("solve", annoyanceBean.getSolve());
                    annoyanceNode.put("share", annoyanceBean.getShare());
                }
                for (DiaryBean diaryBean : diaryList) {
                    ObjectNode diaryNode = dataNode.addObject();
                    Optional<PersonalInfoBean> personalInfo = personalInfoService.getByPK(diaryBean.getAccount());
                    String nickName = personalInfo.get().getNickName();
                    diaryNode.put("id", diaryBean.getId());
                    diaryNode.put("nickName", nickName);
                    diaryNode.put("content", diaryBean.getContent());
                    diaryNode.put("monsterId", diaryBean.getMonsterId());
                    diaryNode.put("index", diaryBean.getIndex());
                    diaryNode.put("time", diaryBean.getTime().format(DateTimeFormatter.ofPattern("MM/dd")));
                    diaryNode.put("share", diaryBean.getShare());
                }
                result.put("result", true);
                result.put("errorCode", "200");
                result.put("message", "查詢成功");
            } else {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "查詢失敗");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }

}
