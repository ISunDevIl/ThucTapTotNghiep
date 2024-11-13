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
@Table(name = "ChiTietHoaDon")

public class ChiTietHoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "id_phieu_dich_vu")
    private PhieuDichVu phieuDichVu;


    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "id_phong")
    private Phong phong;

    @Column(name = "hinh_thuc_thue")
    private String hinhThucThue;

    @Column(name = "thoi_gian_ra")
    private LocalDateTime thoiGianRa;

    @Column(name = "thoi_gian_thue")
    private LocalDateTime thoiGianThue;

    @Column(name = "tien_phong")
    private Double tienPhong;

    @Column(name = "tien_dich_vu")
    private Double tienDichVu;


    @Column(name = "tong_tien")
    private Double tongTien;
}
