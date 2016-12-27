package order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import order.pojo.Dish;
import order.pojo.Order;
import order.pojo.User;
import order.service.DishService;
import order.service.OrderService;
import order.service.UserService;

@Controller
public class StoreController {
	@Autowired
	private UserService userService;
	@Autowired
	private DishService dishService;
	@Autowired
	private OrderService orderService;

	public List<Dish> showAll(DishService dishService) throws Exception{
		List<Dish> list = dishService.findAll();
		List<Dish> slist = new ArrayList<Dish>();
		String[] types = new String[]{"主食","小吃","饮料"};

		for (int i = 0; i < 3; i++) {
			Iterator<Dish> iterator = list.iterator();
			while (iterator.hasNext()) {
				Dish dish = (Dish) iterator.next();
				if (dish.getDishtype().equals(types[i])) {
					slist.add(dish);
				}
			}
		}

		return slist;
	}
	
	

	@RequestMapping("findTlist.action")
	public String findTlist(Model model,String userdata,String selted) throws Exception{
		List<Dish> dlist = dishService.findByType(selted);
		
		model.addAttribute("selcted", selted);
		model.addAttribute("slist", dlist);
		model.addAttribute("display", "none");
		model.addAttribute("user",userService.findUser(userdata));
		return "store/store";
	}
	
	@RequestMapping("toChangePsw.action")
	public String toChangePsw(Model model){
		model.addAttribute("display", "none");
		return "userinfo/changePsw";
	}
	
	int linen=0;
	@RequestMapping("orderSubmit.action")
	public String orderSubmit(Model model,Integer[] ids,Integer[] nums,String userdata) throws Exception{
		User user = userService.findUser(userdata);
		if (user==null) {
			model.addAttribute("sendback", "sumbmitn2()");
			return "forward:backToStore.action";
		}
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		date = format.parse(format.format(new Date()));

		
		Order order = new Order();
		String  line= user.getId()+""+date.getTime();
		
		order.setLinenum((int)Long.parseLong(line));
		order.setDate(date);
		order.setUsername(userdata);
		
		if (ids.length!=0) {
			
			for (int i = 0; i < ids.length; i++) {
				if (nums[i]!=null&&nums[i]>0) {
					Dish dish = dishService.findById(ids[i]);
					dish.setNum(dish.getNum()-nums[i]);
					dishService.updateDish(dish);
					user.setBalance(user.getBalance()-dish.getPrice()*nums[i]);
					//生成订单
					order.setDishname(dish.getDishname());
					order.setNum(nums[i]);
					order.setPrice(dish.getPrice()*nums[i]);
					orderService.addOrder(order);
				}
			}
		}
		
		model.addAttribute("sendback", "sumbmits()");
		
		userService.updateUser(user);
		linen =  order.getLinenum();
		model.addAttribute("line",linen);
		backStep(model, user, userdata);
		return "store/store";
	}


	@RequestMapping("searchdish.action")
	public String searchdish(Model model,String condition,String userdata) throws Exception{
		User user = userService.findUser(userdata);
		if (user==null) {
			model.addAttribute("loginname", "<a href='javascript:openLogin();'><b>登入</b></a>");
		}else {
			model.addAttribute("loginname", "<a href='"
					+ "toUserinfo.action?userdata="+userdata+"'"
					+ " style='text-decoration: none;color: black;'><b>"+user.getName()+"&nbsp;&nbsp;</b></a>");
		}

		model.addAttribute("slist",dishService.queryDish(condition));
		model.addAttribute("user",user);

		model.addAttribute("display", "none");

		return "store/store";
	}
	
	
	@RequestMapping("toStore.action")
	public String toStore(Model model) throws Exception{
		model.addAttribute("slist", showAll(dishService));
		model.addAttribute("display", "none");
		return "store/store";
	}

	
	@RequestMapping(value="toRegister.action")
	public String toRegister(Model model,String userdata){

		model.addAttribute("username", userdata);
		return "register/register";
	}

	
	@RequestMapping(value="toRecharge.action")
	public String toRecharge(Model model,String userdata){
		if (userdata.equals("")||userdata==null) {
			model.addAttribute("sendback", "sumbmitn2()");
			return "forward:backToStore.action";
		}
		model.addAttribute("username", userdata);
		return "store/recharge";
	}

	
	@RequestMapping(value="backToStore.action")
	public String backToStore(Model model,String username1) throws Exception{
		if (username1==null||username1.equals("")) {
			return"forward:toStore.action";
		}
		User user = userService.findUser(username1);

		backStep(model, user, username1);
		List<Order> linlist = orderService.findOrderByLinenum(linen);
		if (linlist!=null&&linlist.size()!=0) {
			Date date = new Date();
			long time=date.getTime()-linlist.get(0).getDate().getTime();
			date.setTime(time);
			if (date.getMinutes()<5) {
				model.addAttribute("line",linen);
			}
		}else{
			model.addAttribute("line",0);
		}
		return "store/store";
	}
	
	@RequestMapping(value="toBackStage.action")
	public String toBackStage(Model model,String userdata) throws Exception{
		
		model.addAttribute("username", userdata);
		model.addAttribute("cDishs", showAll(dishService));
		return "store/back-stage";
	}
	
	@RequestMapping(value="BackStageAdd.action")
	public String BackStageAdd(Model model,String username,Dish dish) throws Exception{
		dishService.addDish(dish);
		model.addAttribute("username", username);
		model.addAttribute("cDishs", showAll(dishService));
		return "store/back-stage";
	}
	
	@RequestMapping(value="BackStage.action")
	public String BackStage(Model model,String username,
			Integer[] udid,Integer[] udnum,Double[] udprice,String[] udtype) throws Exception{
			Dish dish = new Dish();
		for (int i = 0; i < udid.length; i++) {
			dish = dishService.findById(udid[i]);
			dish.setNum(udnum[i]);
			dish.setPrice(udprice[i]);
			dish.setDishtype(udtype[i]);
			dishService.updateDish(dish);
		}
		
		backStep(model, userService.findUser(username), username);
		return "store/store";
	}
	
	
	
	
	public void backStep(Model model,User user,String username) throws Exception{
		model.addAttribute("slist", showAll(dishService));

		model.addAttribute("user",user);

		model.addAttribute("display", "none");

	}
	
	public void backStepOut(StoreController sc,Model model,User user,String username,DishService dishService) throws Exception{
		model.addAttribute("slist", sc.showAll(dishService));
		
		model.addAttribute("user",user);
		
		model.addAttribute("display", "none");
		
	}
	

}
