package order.service;

import java.util.List;

import order.pojo.Dish;

public interface DishService {
	public Dish findById(int id)throws Exception;
	
	public List<Dish> findAll()throws Exception;
	
	public List<Dish> findByType(String dishType)throws Exception;
	
	public List<Dish> queryDish(String dishname)throws Exception;
	
	public void addDish(Dish dish)throws Exception;
	
	public void updateDish(Dish dish)throws Exception;
	
	public void deleteDish(int id)throws Exception;
	
	public boolean checkExist(int id)throws Exception;
}
