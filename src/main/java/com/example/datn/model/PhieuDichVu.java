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
@Table(name = "PhieuDichVu")
public class PhieuDichVu {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_dich_vu")
    private DichVu dichVu;

    @Column(name = "so_luong_su_dung")
    private Integer soLuongSuDung;
    @Column(name = "thanh_tien")
    private Double thanhTien;
}
