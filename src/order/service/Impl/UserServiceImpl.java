package order.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;

import order.mapper.UserMapper;
import order.pojo.User;
import order.service.UserService;

public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper mapper;
	
	public User findUser(String username) throws Exception {
		return mapper.selectByUsername(username);
	}

	public void addUser(User user) throws Exception {
		mapper.insert(user);
	}

	public void updateUser(User user) throws Exception {
		mapper.updateByPrimaryKey(user);	
	}

	public boolean checkPhonenum(String phonenum) throws Exception {
		User user = findUserByPhonenum(phonenum);
		if (user!=null) {
			return true;
		}
		return false;
	}

	public boolean checkPsw(String username, String password) throws Exception {
		User user = findUser(username);
		return user.getPassword().equals(password);
	}

	public boolean checkExist(String username) throws Exception {
		if(findUser(username)!=null){
			return true;
		}
		return false;
	}

	public User findUserByPhonenum(String phonenum) throws Exception {
		return mapper.selectByPhoneNum(phonenum);
	}

}
