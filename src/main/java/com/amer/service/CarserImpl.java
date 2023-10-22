package com.amer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amer.dao.CarRepo;
import com.amer.entity.Car;

@Service
public class CarserImpl implements CarService {

	@Autowired
	private CarRepo repo ;
	
	@Override
	public void save(Car c) {
		// TODO Auto-generated method stub
        repo.save(c);
	}

	@Override
	public List<Car> getall() {
		// TODO Auto-generated method stub
		return repo.findAll();
	}

	@Override
	public Car getone(int id) {
		// TODO Auto-generated method stub
		return repo.findById(id).get();
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
        repo.deleteById(id);
	}

}
