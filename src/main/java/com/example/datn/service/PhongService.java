package com.example.datn.service;

import com.example.datn.model.NhanVien;
import com.example.datn.model.Phong;

import com.example.datn.repository.PhongRepo;


import java.util.List;

public interface PhongService {

    List<Phong> getAll();

    public void add(Phong phong);

    public Phong detailPhong(Integer id);

    public void updateStatusPhong(Integer id);

    public void update(Phong phong);


}
