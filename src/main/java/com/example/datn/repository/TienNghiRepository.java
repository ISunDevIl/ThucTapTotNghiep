package com.example.datn.repository;


import com.example.datn.model.NhanVien;
import com.example.datn.model.TienNghi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TienNghiRepository extends JpaRepository<TienNghi,Integer> {

    @Query("SELECT tn FROM TienNghi tn " +
            "WHERE tn.donGia BETWEEN :dg1 AND :dg2 "
    )
    List<TienNghi> filterDonGia(Double dg1,Double dg2);

    @Query("SELECT tn FROM TienNghi tn " +
            "WHERE tn.maTienNghi LIKE %:keyword% " +
            "OR tn.tenTienNghi LIKE %:keyword% " +
            "OR tn.trangThai LIKE %:keyword% "
    )
    List<TienNghi> search(@Param("keyword") String keyword);
}
