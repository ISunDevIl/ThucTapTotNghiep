package com.example.datn.repository;

import com.example.datn.model.PhieuDichVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhieuDichVuRepo extends JpaRepository<PhieuDichVu, Integer> {
}
