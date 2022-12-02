package com.example.demo.bean;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class AllMonsterBean extends BaseBean {
    private Integer id;
    private String nameChinese;
    private String nameEnglish;
    private String photo;
    private String avatar;
    private String rightGif;
    private String leftGif;
    private Integer group;
    private Integer main;

    private MultipartFile photoFile;
    private MultipartFile avatarFile;
    private MultipartFile rightGifFile;
    private MultipartFile leftGifFile;
}
