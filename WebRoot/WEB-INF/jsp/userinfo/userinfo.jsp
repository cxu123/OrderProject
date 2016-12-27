
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User-Information</title>

</head>

<body>
		<input type="hidden" name="username1">
		<h2 align="center"><b>用户信息</b></h2><h4 style="color:blue;"><a charset="UTF-8" href="${pageContext.request.contextPath}
		/backToStore.action?username1=${user.username}" ><b>返回</b></a></h4>
		<hr>
		<table style="padding-left: 7%;" width="30%" >
				<tr>
					<td><b>用户名:&nbsp;</b></td>
					<td><b>${user.username}</b></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td><b>姓名:&nbsp;</b></td>
					<td><b>${user.name}</b></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td><b>性别 :&nbsp;</b></td>
					<td><b>${user.sex}</b></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr>
					<td><b>地址 :&nbsp;</b></td>
					<td><b>${user.address}</b></td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td><b>电话号码 :&nbsp;</b></td>
					<td><b>${user.phonenum}</b></td>
				</tr>
		</table>
</body>
</html>