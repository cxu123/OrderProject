package order.service;

import java.util.List;

import order.pojo.Order;

public interface OrderService {
	public List<Order> findOrderByUsername(String username)throws Exception;
	
	public List<Order> findOrderByLinenum(int linenum)throws Exception;
	
	public List<Order> findAll()throws Exception;
	
	public void addOrder(Order order)throws Exception;
	
	public void deleteOrder(int id)throws Exception;
	
	public void deleteByLinenum(Integer[] linenums)throws Exception;
}
