package com.example.datn.service.IMPL;

import com.example.datn.model.TaiKhoan;
import com.example.datn.repository.TaiKhoanRepo;
import com.example.datn.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaiKhoanServiceIMPL implements TaiKhoanService {
    @Autowired
    TaiKhoanRepo taiKhoanRepo;

    @Override
    public List<TaiKhoan> findAll() {
        return taiKhoanRepo.findAll();
    }

    @Override
    public void addTaiKhoan(TaiKhoan taiKhoan) {
        taiKhoanRepo.save(taiKhoan);
    }

    @Override
    public TaiKhoan detailTaiKhoan(Integer id) {
        return taiKhoanRepo.findById(id).get();
    }

    @Override
    public void updateTaiKhoan(TaiKhoan taiKhoan) {
        taiKhoanRepo.save(taiKhoan);
    }

    @Override
    public void updateStatusTaiKhoan(Integer id) {
        TaiKhoan taiKhoan = taiKhoanRepo.findById(id).orElse(null);
        if (taiKhoan != null) {
            if (taiKhoan.getTrangThai().equals("Hoạt động")) {
                taiKhoan.setTrangThai("Ngừng hoạt động");
            } else {
                taiKhoan.setTrangThai("Hoạt động");
            }
            taiKhoanRepo.save(taiKhoan);
        }
    }
}
