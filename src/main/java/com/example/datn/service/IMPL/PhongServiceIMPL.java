package com.example.datn.service.IMPL;

import com.example.datn.model.Phong;
import com.example.datn.repository.PhongRepo;
import com.example.datn.service.PhongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhongServiceIMPL implements PhongService {
    @Autowired
    PhongRepo phongRepo;


    @Override
    public List<Phong> getAll() {

        return phongRepo.findAll();
    }

    @Override

    public void add(Phong phong) {

        phongRepo.save(phong);
    }

    @Override
    public Phong detailPhong(Integer id) {

        return phongRepo.findById(id).get();
    }

    @Override
    public void update(Phong phong) {
        phongRepo.save(phong);

    }
//
//    @Override
//    public void updateStatusPhong(Integer id) {
//        Phong phong = phongRepo.findById(id).orElse(null);
//        if (phong != null) {
//            if (phong.getTrangThai().equals("Không trống")){
//                phong.setTrangThai("Trống");
//            }else {
//                phong.setTrangThai("Không trống");
//            }
//            phongRepo.save(phong);
//        }
//
//    }
    @Override
    public void updateStatusPhong(Integer id) {
        Phong phong = phongRepo.findById(id).orElse(null);
        if (phong != null) {
            if (phong.getTrangThai().equals("Hoạt động")){
                phong.setTrangThai("Không hoạt động");
            }else {
                phong.setTrangThai("Hoạt động");
            }
            phongRepo.save(phong);
        }

    }
}
