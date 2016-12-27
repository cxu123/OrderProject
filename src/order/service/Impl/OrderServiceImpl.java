package order.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import order.mapper.OrderMapper;
import order.pojo.Order;
import order.service.OrderService;

public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper mapper;
	
	public List<Order> findOrderByUsername(String username) throws Exception {
		return mapper.selectByUsername(username);
	}

	public List<Order> findOrderByLinenum(int linenum) throws Exception {
		return mapper.selectByLinenum(linenum);
	}

	public List<Order> findAll() throws Exception {
		return mapper.selectAll();
	}

	public void addOrder(Order order) throws Exception {
		mapper.insert(order);
	}

	public void deleteOrder(int id) throws Exception {
		mapper.deleteByPrimaryKey(id);
	}

	public void deleteByLinenum(Integer[] linenums) throws Exception {
		for (Integer linenum:linenums) {
			mapper.deleteByLinenum(linenum);	
		}
	}

}
