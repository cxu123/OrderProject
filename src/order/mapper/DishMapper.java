package order.mapper;

import java.util.List;

import order.pojo.Dish;

public interface DishMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dish record);

    int insertSelective(Dish record);

    Dish selectByPrimaryKey(Integer id);
    
    List<Dish> selectAll();
    
    List<Dish> selectByDishType(String dishType);
    
    List<Dish> queryDishByDishname(String dishName);
    
    int updateByPrimaryKeySelective(Dish record);

    int updateByPrimaryKey(Dish record);
}