package order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import order.pojo.Dish;
import order.pojo.Order;
import order.pojo.User;
import order.service.DishService;
import order.service.OrderService;
import order.service.UserService;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private DishService dishService;
	@Autowired
	private UserService userService;
	
	private Map<Integer,List<Order>> odMap;
	private List<Order> orderList;
	@RequestMapping("toOrder.action")
	public String toOrder(Model model,Integer orderline,String userdata) throws Exception{
		if (userdata==null||userdata.equals("")) {
			model.addAttribute("sendback", "sumbmitn2()");
			return "forward:backToStore.action";
		}
		toTheOrder(model, userdata, orderline);
		
		return "order/order";
	}
	
	@RequestMapping("deleteOrder.action")
	public String deleteOrder(Model model,String username,Integer linenum,Integer[] checkes) throws Exception{
		orderService.deleteByLinenum(checkes);
		toTheOrder(model, username, linenum);
		return "order/order";
	}
	@RequestMapping("deleteOneOrder.action")
	public String deleteOneOrder(Model model,String username,Integer linenum) throws Exception{

		int spri=0;
		List<Order> olist = orderService.findOrderByLinenum(linenum);
		for (Order order:olist) {
			spri+=order.getPrice();		
		}
		User user = userService.findUser(username);
		user.setBalance(user.getBalance()+spri);
		userService.updateUser(user);
		//退款后删除订单
		Integer[] i = new Integer[]{linenum};
		orderService.deleteByLinenum(i);
		
		toTheOrder(model, username, linenum);
		return "order/order";
	}
	
	private void toTheOrder(Model model,String userdata,Integer orderline) throws Exception{
		
		Integer orderlinenum = orderline;
		//查询所有订单
		odMap = new HashMap<Integer, List<Order>>();
		
		List<Order> alorderList = orderService.findOrderByUsername(userdata);
		Iterator<Order> aliterator = alorderList.iterator();
		while (aliterator.hasNext()) {
			Order alorder = (Order) aliterator.next();
			int linenum = alorder.getLinenum();
			
			Date date = new Date();
			long time=date.getTime()-alorder.getDate().getTime();
			date.setTime(time);
			if (date.getMinutes()<5) {
				orderlinenum=linenum;
			}
			List<Order> orderList = orderService.findOrderByLinenum(linenum);
			odMap.put(linenum, orderList);
		}
		
		//当前订单	
		orderList = odMap.get(orderlinenum);
		
		if (orderList!=null) {
			Date date = new Date();
			long time=date.getTime()-orderList.get(0).getDate().getTime();
			date.setTime(time);
			if (date.getMinutes()<5) {
				odMap.remove(orderlinenum);
			}else {
				odMap.put(orderlinenum, orderList);
			}
			model.addAttribute("leftTime", time);
		}
		
		model.addAttribute("odMap", odMap);
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderline", orderlinenum);
		model.addAttribute("username", userdata);
	}
}
