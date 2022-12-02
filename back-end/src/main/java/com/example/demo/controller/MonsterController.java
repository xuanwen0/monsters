package com.example.demo.controller;

import com.example.demo.bean.AllMonsterBean;
import com.example.demo.service.impl.AllMonsterServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/monster")
public class MonsterController {
    private final AllMonsterServiceImpl allMonsterService;

    private final String MONSTER_FILE = "D:/monsters/back-end/file/monster/";

    @ResponseBody
    @PostMapping(value = "/create")
    public ResponseEntity register(@ModelAttribute AllMonsterBean allMonsterBean) {
        ObjectMapper mapper = new ObjectMapper();
        ObjectNode result = mapper.createObjectNode();
        result.putObject("data");
        try {
            if (allMonsterBean.getPhoto().isEmpty() && allMonsterBean.getPhoto() == null && allMonsterBean.getPhotoFile().isEmpty() && allMonsterBean.getPhotoFile() == null) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                byte[] photoBytes = allMonsterBean.getPhotoFile().getBytes();
                Path photoPath = Paths.get(MONSTER_FILE + allMonsterBean.getGroup() + "/" + allMonsterBean.getPhotoFile().getOriginalFilename());
                Files.write(photoPath, photoBytes);
                allMonsterBean.setPhoto(photoPath.toString());
            }
            if (allMonsterBean.getAvatar().isEmpty() && allMonsterBean.getAvatar() == null && allMonsterBean.getAvatarFile().isEmpty() && allMonsterBean.getAvatarFile() == null) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                byte[] avatarBytes = allMonsterBean.getAvatarFile().getBytes();
                Path avatarPath = Paths.get(MONSTER_FILE + allMonsterBean.getGroup() + "/" + allMonsterBean.getAvatarFile().getOriginalFilename());
                Files.write(avatarPath, avatarBytes);
                allMonsterBean.setAvatar(avatarPath.toString());
            }
            if (allMonsterBean.getRightGif().isEmpty() && allMonsterBean.getRightGif() == null && allMonsterBean.getRightGifFile().isEmpty() && allMonsterBean.getRightGif() == null) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                byte[] rightGIFBytes = allMonsterBean.getRightGifFile().getBytes();
                Path rightGIFPath = Paths.get(MONSTER_FILE + allMonsterBean.getGroup() + "/" + allMonsterBean.getRightGifFile().getOriginalFilename());
                Files.write(rightGIFPath, rightGIFBytes);
                allMonsterBean.setRightGif(rightGIFPath.toString());
            }
            if (allMonsterBean.getLeftGif().isEmpty() && allMonsterBean.getLeftGif() == null && allMonsterBean.getLeftGifFile().isEmpty() && allMonsterBean.getLeftGifFile() == null) {
                result.put("result", false);
                result.put("errorCode", "");
                result.put("message", "新增失敗");
            } else {
                byte[] leftGIFBytes = allMonsterBean.getLeftGifFile().getBytes();
                Path leftGIFPath = Paths.get(MONSTER_FILE + allMonsterBean.getGroup() + "/" + allMonsterBean.getLeftGifFile().getOriginalFilename());
                Files.write(leftGIFPath, leftGIFBytes);
                allMonsterBean.setLeftGif(leftGIFPath.toString());
            }
            allMonsterService.createAndReturnBean(allMonsterBean);
            result.put("result", true);
            result.put("errorCode", "200");
            result.put("message", "新增成功");
        } catch (Exception e) {
            result.put("result", false);
            result.put("errorCode", "");
            result.put("message", "新增失敗");
            e.printStackTrace();
        }
        return ResponseEntity.status(HttpStatus.CREATED).body(result);
    }
}
