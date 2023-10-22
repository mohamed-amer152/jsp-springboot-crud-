package com.amer.service;

import java.util.List;

import com.amer.entity.Car;

public interface CarService {

	
	public void save (Car c) ;
	
	public List<Car> getall();
	
	public Car getone(int id);
	
	public void delete(int id ) ;
}
