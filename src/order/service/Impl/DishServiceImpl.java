package order.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import order.mapper.DishMapper;
import order.pojo.Dish;
import order.service.DishService;

public class DishServiceImpl implements DishService{
	@Autowired
	private DishMapper mapper;
	
	public List<Dish> findAll() throws Exception {
		return mapper.selectAll();
	}

	public List<Dish> findByType(String dishType) throws Exception {
		return mapper.selectByDishType(dishType);
	}

	public List<Dish> queryDish(String dishname) throws Exception {
		return mapper.queryDishByDishname(dishname);
	}

	public void addDish(Dish dish) throws Exception {
		mapper.insert(dish);
	}

	public void updateDish(Dish dish) throws Exception {
		mapper.updateByPrimaryKey(dish);
	}

	public void deleteDish(int id) throws Exception {
		mapper.deleteByPrimaryKey(id);
	}

	public boolean checkExist(int id) throws Exception {
		if(mapper.selectByPrimaryKey(id)!=null){
			return true;
		}
		return false;
	}

	public Dish findById(int id) throws Exception {
		return mapper.selectByPrimaryKey(id);
	}



}
