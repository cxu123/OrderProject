package order.mapper;

import java.util.List;

import order.pojo.Order;

public interface OrderMapper {
	int deleteByPrimaryKey(Integer id);
	
	int deleteByLinenum(Integer linenum);

	int insert(Order record);

	int insertSelective(Order record);

	Order selectByPrimaryKey(Integer id);

	List<Order> selectByUsername(String username);

	List<Order> selectByLinenum(Integer linenum);

	List<Order> selectAll();

	int updateByPrimaryKeySelective(Order record);

	int updateByPrimaryKey(Order record);
}