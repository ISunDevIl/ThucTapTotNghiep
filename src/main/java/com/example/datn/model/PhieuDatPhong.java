package com.example.datn.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "PhieuDatPhong")
public class PhieuDatPhong {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_khach_hang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "id_loai_phong")
    private LoaiPhong loaiPhong;

    @Column(name = "ma_dat_phong")
    private String maDatPhong;

    @Column(name = "thoi_gian_dat")
    private LocalDateTime thoiGianDat;

    @Column(name = "thoi_gian_vao_du_kien")
    private LocalDateTime thoiGianVaoDuKien;
    @Column(name = "thoi_gian_ra_du_kien")
    private LocalDateTime thoiGianRaDuKien;


    @Column(name = "so_nguoi")
    private Integer soNguoi;
    @Column(name = "so_phong")
    private Integer soPhong;
    @Column(name = "trang_thai")
    private String trangThai;
}
