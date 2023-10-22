package com.amer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.amer.entity.Car;
import com.amer.service.CarService;

@RestController
public class CarController {
	
	@Autowired
	private CarService serv ;
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	public String save(@ModelAttribute("car") Car c)
	{
		serv.save(c);
		return "{\"status\":\"success\"}" ;
	}
	@RequestMapping(value = "/getalle" , method = RequestMethod.GET)
	public List<Car> getall()
	{
		return serv.getall();
	}
	@RequestMapping(value = "/getcar/{id}" , method = RequestMethod.GET)
	public Car save(@PathVariable("id") int id )
	{
		return  serv.getone(id);
	}
	@RequestMapping(value = "/edit/{id}" , method = RequestMethod.POST)
	public Car edit(@PathVariable("id")  String id )
	{   		
		return  serv.getone(Integer.parseInt(id));
	}
	@RequestMapping(value = "/remove/{id}" , method = RequestMethod.DELETE)
	public String delete(@PathVariable("id")  String id )
	{   
		int val = Integer.parseInt(id);
	serv.delete(val);
	return "{\"status\":\"success\"}" ;
	}
	

}
