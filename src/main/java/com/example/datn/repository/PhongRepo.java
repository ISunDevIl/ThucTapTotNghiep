package com.example.datn.repository;

import com.example.datn.model.Phong;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhongRepo extends JpaRepository<Phong,Integer> {

}
