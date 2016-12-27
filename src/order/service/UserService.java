package order.service;

import order.pojo.User;

public interface UserService {
	public User findUser(String username)throws Exception;
	
	public User findUserByPhonenum(String phonenum)throws Exception;	
	
	public void addUser(User user)throws Exception;
	
	public void updateUser(User user)throws Exception;
	
	public boolean checkPhonenum(String phonenum)throws Exception;
	
	public boolean checkPsw(String username,String password)throws Exception;
	
	public boolean checkExist(String username)throws Exception;
}
