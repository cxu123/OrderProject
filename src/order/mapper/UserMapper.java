package order.mapper;

import order.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User user);

    int insertSelective(User user);
    
    User selectByUsername(String username);
    
    User selectByPhoneNum(String phonenum);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User user);
}