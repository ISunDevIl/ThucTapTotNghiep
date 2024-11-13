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
@Table(name = "LoaiPhong_TienNghi")

public class LoaiPhong_TienNghi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_loai_phong")
    private LoaiPhong loaiPhong;

    @JoinColumn(name = "id_tien_nghi")
    @ManyToOne
    private TienNghi tienNghi;


    @Column(name = "so_luong_cung_cap")
    private Integer soLuongCungCap;
}
