package com.example.datn.dto.request;

import com.example.datn.model.HoaDon;
import com.example.datn.model.KhachHang;
import com.example.datn.model.NhanVien;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DatPhongRequest {
    private Integer id;
    private KhachHang khachHang;
    private String maDatPhong;
    private LocalDate ngayDat;
    private Double tongTien;
    private Double datCoc;
    private String ghiChu;
    private String trangThai;
}