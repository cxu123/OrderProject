package order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import order.pojo.User;
import order.service.DishService;
import order.service.UserService;

@Controller
public class LoginController {
	//添加文字说明	
	@Autowired
	private UserService userService;
	@Autowired
	private DishService dishService;

	@RequestMapping("login.action")
	public String login(Model model,String username,String password) throws Exception{

		if (!userService.checkExist(username)) {
			errorCheck(model);
			sendback(model,"error1()");//提示用户不存在

		}else if (!userService.checkPsw(username, password)) {
			errorCheck(model);
			sendback(model,"error2()");//提示密码错误

		}else{
			User user = userService.findUser(username);
			sendback(model,"loginS()");//提示登入成功
			StoreController sc = new StoreController();
			sc.backStepOut(sc,model, user, username, dishService);
		}

		return "store/store";
	}

	@RequestMapping("toUserinfo.action")
	public String toUserinfo(Model model,String userdata) throws Exception{

		model.addAttribute("user", userService.findUser(userdata));
		return "userinfo/userinfo";
	}

	@RequestMapping("changePswDone.action")
	public String changePswDone(Model model,String username,String rn_password) throws Exception{
		User user = userService.findUser(username);
		user.setPassword(rn_password);
		userService.updateUser(user);

		//		model.addAttribute("username1", username);
		return "forward:backToStore.action?username1="+username;
	}

	@RequestMapping("changePsw.action")
	public String changePsw(Model model,String c_username,String c_name,String c_phonenum) throws Exception{
		User user = userService.findUser(c_username);
		if (!userService.checkExist(c_username)) {
			model.addAttribute("exist", "该用户不存在！");
			model.addAttribute("display", "none");
		}else if (!user.getName().equals(c_name)) {
			model.addAttribute("nwrong", "姓名不正确！");
			model.addAttribute("display", "none");
		}else if (!user.getPhonenum().equals(c_phonenum)) {
			model.addAttribute("pwrong", "电话号码不正确！");
			model.addAttribute("display", "none");
		}else{
			model.addAttribute("display", "");
			model.addAttribute("user",user );
		}

		return "userinfo/changePsw";
	}



	//下面是对重复代码的提取
	private void sendback(Model model,String function){
		model.addAttribute("sendback", function);
	}

	private void errorCheck(Model model) throws Exception{
		
		model.addAttribute("slist", new StoreController().showAll(dishService));
		model.addAttribute("display", "");
	}

}
