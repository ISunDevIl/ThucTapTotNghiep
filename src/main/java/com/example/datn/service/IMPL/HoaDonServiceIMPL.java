package com.example.datn.service.IMPL;

import com.example.datn.model.HoaDon;
import com.example.datn.repository.HoaDonRepo;
import com.example.datn.service.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonServiceIMPL implements HoaDonService {
    @Autowired
    HoaDonRepo hoaDonRepo;

    @Override
    public List<HoaDon> findAll() {
        return hoaDonRepo.findAll();
    }

    @Override
    public void addHoaDon(HoaDon hoaDon) {
        hoaDonRepo.save(hoaDon);
    }

    @Override
    public HoaDon detailHoaDon(Integer id) {
        return hoaDonRepo.findById(id).get();
    }

    @Override
    public void updateHoaDon(HoaDon hoaDon) {
        hoaDonRepo.save(hoaDon);
    }

    @Override
    public void updateStatusHoaDon(Integer id) {
        HoaDon hoaDon = hoaDonRepo.findById(id).orElse(null);
        if (hoaDon != null){
            if (hoaDon.getTrangThai().equals("Chưa thanh toán")){
                hoaDon.setTrangThai("Đã thanh toán");
            }else {
                hoaDon.setTrangThai("Chưa thanh toán");
            }
            hoaDonRepo.save(hoaDon);
        }
    }
}
