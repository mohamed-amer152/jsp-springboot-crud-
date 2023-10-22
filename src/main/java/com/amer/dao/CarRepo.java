package com.amer.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.amer.entity.Car;
@Repository
public interface CarRepo extends JpaRepository<Car, Integer> {

}
