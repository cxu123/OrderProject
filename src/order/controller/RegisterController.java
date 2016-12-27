package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import order.pojo.User;
import order.service.DishService;
import order.service.UserService;

@Controller
public class RegisterController {
	@Autowired
	private UserService userService;
	@Autowired
	private DishService dishService;
	
	private User newUser;
	@RequestMapping("/register.action")
	public String register(Model model,User user) throws Exception{
		if (userService.checkExist(user.getUsername())) {
			model.addAttribute("pexist", "");
			model.addAttribute("exist", "该用户名已存在！");
			return "register/register";
		}else if (userService.checkPhonenum(user.getPhonenum())) {
			model.addAttribute("exist", "");
			model.addAttribute("pexist", "该号码已被使用！");
			return "register/register";
		}
		user.setBalance(50.0);
		userService.addUser(user);
		newUser = user;
		
		
			sendback(model, "registers()");
			
			
		return "register/register";
	}
	
	@RequestMapping("registerOver.action")
	public String registerOver(Model model) throws Exception{
		StoreController sc = new StoreController();
		sc.backStepOut(sc, model, newUser, newUser.getUsername(), dishService);
		return "store/store";
	}
	
	private void sendback(Model model,String function){
		model.addAttribute("sendback", function);
	}
}
