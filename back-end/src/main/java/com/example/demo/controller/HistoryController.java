package com.example.demo.controller;

import com.example.demo.service.impl.AnnoyanceServiceImpl;
import com.example.demo.service.impl.DiaryServiceImpl;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@AllArgsConstructor
@Controller
@RequestMapping(value = "/history")
public class HistoryController {
    private final AnnoyanceServiceImpl annoyanceService;
    private final DiaryServiceImpl diaryServiceimpl;
}
