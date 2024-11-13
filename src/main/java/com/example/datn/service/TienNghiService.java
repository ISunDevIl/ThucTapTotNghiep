package com.example.datn.service;

import com.example.datn.model.DichVu;
import com.example.datn.model.NhanVien;
import com.example.datn.model.TienNghi;

import java.util.List;

public interface TienNghiService {
    List<TienNghi> getAll();

    public void add(TienNghi tienNghi);

    public TienNghi detail(Integer id);

    public void delete(Integer id);

    public void update(TienNghi tienNghi);

    public void updateStatusTienNghi(Integer id);

    public List<TienNghi> filterDonGia(Double dg1,Double dg2);

    List<TienNghi> search(String keyword);
}
