package com.example.datn.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

@Entity
@Table(name = "LoaiPhong")
public class LoaiPhong {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @ManyToOne
    @JoinColumn(name = "id_phong")
    private Phong phong;

    @Column(name = "ma_loai_phong")
    private String maLoaiPhong;
    @Column(name = "ten_loai_phong")
    private String tenLoaiPhong;

    @Column(name = "suc_chua")
    private Integer sucChua;

    @Column(name = "gia_theo_gio")
    private Double giaTheoGio;

    @Column(name = "gia_qua_dem")
    private Double giaQuaDem;
    @Column(name = "hinh_anh")
    private String hinhAnh;

    @Column(name = "ghi_chu")
    private String ghiChu;

    @Column(name = "trang_thai")
    private String trangThai;
}
