package com.example.datn.controller;

import com.example.datn.model.DichVu;
import com.example.datn.service.IMPL.DichVuServiceIMPL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("/dich_vu")
public class DichVuController {

    @Autowired
    DichVuServiceIMPL dichVuServiceIMPL;

    @GetMapping("/home")
    public String home(Model model){
        model.addAttribute("list",dichVuServiceIMPL.getAll());
        return "/DichVu/home";
    }


}
