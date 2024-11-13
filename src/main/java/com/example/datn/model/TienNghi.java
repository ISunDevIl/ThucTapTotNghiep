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
@Table(name = "TienNghi")
public class TienNghi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ma_tien_nghi")
    private String maTienNghi;

    @Column(name = "ten_tien_nghi")
    private String tenTienNghi;

    @Column(name = "so_luong_ton")
    private Integer soLuongTon;

    @Column(name = "don_gia")
    private Double donGia;

    @Column(name = "trang_thai")
    private String trangThai;
}
