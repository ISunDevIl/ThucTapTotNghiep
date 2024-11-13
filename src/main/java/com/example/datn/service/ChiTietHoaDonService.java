package com.example.datn.service;

import com.example.datn.model.ChiTietHoaDon;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChiTietHoaDonService {
    List<ChiTietHoaDon> findAll();
    public void add(ChiTietHoaDon chiTietHoaDon);
    public ChiTietHoaDon detail(Integer id);
    public void update(ChiTietHoaDon chiTietHoaDon);
    public ChiTietHoaDon delete(Integer id);
}
