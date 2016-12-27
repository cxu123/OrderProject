package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import order.pojo.User;
import order.service.DishService;
import order.service.UserService;

@Controller
public class RechargeController {
	@Autowired
	private UserService userService;
	@Autowired
	private DishService dishService;
	
	@RequestMapping("/RechargeDone.action")
	public String RechargeDone(Model model,String username,
			Integer recharge) throws Exception{
		if (recharge==null) {
			recharge=0;
		}

		User user = userService.findUser(username);
		user.setBalance(user.getBalance()+recharge);
		userService.updateUser(user);
		
		StoreController sc = new StoreController();
		sc.backStepOut(sc, model, user, username, dishService);
		
		return "store/store";
	}
}
