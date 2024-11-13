package com.example.datn.service.IMPL;

import com.example.datn.model.NhanVien;
import com.example.datn.repository.NhanVienRepo;
import com.example.datn.service.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class NhanVienServiceIMPL implements NhanVienService {
    @Autowired
    NhanVienRepo nhanVienRepo;

    @Override
    public List<NhanVien> getAll() {
        return nhanVienRepo.findAll();
    }

    @Override
    public NhanVien findById(Integer id) {
        return nhanVienRepo.findById(id).get();
    }

    @Override
    public void addNhanVien(NhanVien nhanVien) {
        nhanVienRepo.save(nhanVien);
    }

    @Override
    public void updateNhanVien(NhanVien nhanVien) {
        nhanVienRepo.save(nhanVien);
    }

    @Override
    public void updateTrangThaiNhanVien(Integer id) {
        NhanVien nhanVien = nhanVienRepo.findById(id).orElse(null);
        if (nhanVien != null) {
            if (nhanVien.getTrangThai().equals("Hoạt động")) {
                nhanVien.setTrangThai("Ngừng hoạt động");
            } else {
                nhanVien.setTrangThai("Hoạt động");
            }
            nhanVienRepo.save(nhanVien);
        }
    }

    @Override
    public List<NhanVien> search(String keyword) {
        return nhanVienRepo.search(keyword);
    }

}
