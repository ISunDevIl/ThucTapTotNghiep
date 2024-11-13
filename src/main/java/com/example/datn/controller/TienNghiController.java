package com.example.datn.controller;

import com.example.datn.model.NhanVien;
import com.example.datn.model.TienNghi;
import com.example.datn.service.IMPL.TienNghiServiceIMPL;
import com.example.datn.service.TienNghiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/tien-nghi")
public class TienNghiController {
    @Autowired
    TienNghiService tienNghiService;
//    @Autowired
//    TienNghiServiceIMPL tienNghiServiceIMPL;
    @GetMapping("/home")
    public String home(Model model){
        model.addAttribute("listTienNghi",tienNghiService.getAll());
        return "TienNghi/home";
    }

    @PostMapping("/add")
    public String add(TienNghi tienNghi){
        tienNghiService.add(tienNghi);
        return "redirect:/tien-nghi/home";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id,Model model){
        model.addAttribute("listTienNghi",tienNghiService.getAll());
        model.addAttribute("TienNghi",tienNghiService.detail(id));
        return "TienNghi/home";
    }
    @GetMapping("/delete")
    public String dedlete(@RequestParam("id") int id){
        tienNghiService.delete(id);
        return "redirect:/tien-nghi/home";
    }

    @PostMapping("/update")
    public String update(TienNghi tienNghi){
        tienNghiService.update(tienNghi);
        return "redirect:/tien-nghi/home";
    }
    @GetMapping("/update-status")
    public String update(@RequestParam("id") int id,TienNghi tienNghi){
        tienNghiService.updateStatusTienNghi(id);
        return "redirect:/tien-nghi/home";
    }

    @GetMapping("/filter")
    public String filterDonGia(@RequestParam("dg1")Double dg1,@RequestParam("dg2") Double dg2,Model model){
        model.addAttribute("listTienNghi",tienNghiService.filterDonGia(dg1,dg2));
        return "TienNghi/home";
    }

    @GetMapping("/search")
    public String search(@RequestParam(name = "keyword", required = false) String keyword, Model model) {
        List<TienNghi> list;
        if (keyword != null && !keyword.isEmpty()) {
            list = tienNghiService.search(keyword);
        } else {
            list = tienNghiService.getAll();
        }
        model.addAttribute("listTienNghi", list);
        // Trả về một phần của trang, thay vì toàn bộ trang
        return "TienNghi/home";  // chỉ trả về fragment tbody
    }

}
