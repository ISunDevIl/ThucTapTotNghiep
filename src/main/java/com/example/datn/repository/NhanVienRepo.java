package com.example.datn.repository;

import com.example.datn.model.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NhanVienRepo extends JpaRepository<NhanVien, Integer> {
    @Query("SELECT nv FROM NhanVien nv " +
            "WHERE nv.maNhanVien LIKE %:keyword% " +
            "OR nv.hoTen LIKE %:keyword% " +
            "OR nv.gioiTinh LIKE %:keyword% " +
            "OR nv.email LIKE %:keyword% " +
            "OR nv.sdt LIKE %:keyword% " +
            "OR nv.trangThai LIKE %:keyword% "
    )
    List<NhanVien> search(@Param("keyword") String keyword);
}
