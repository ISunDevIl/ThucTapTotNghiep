package com.example.datn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class TrangChuController {

    @GetMapping("/trang-chu")
    public String trangchu(){
        return "TrangChu";
    }
}
