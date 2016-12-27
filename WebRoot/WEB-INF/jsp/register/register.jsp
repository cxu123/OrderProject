<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
</head>
<body onload="${sendback}">
<script type="text/javascript">
	function check(){
		var un = document.forms["form"]["usern"].value;
		if (un==null||un=="") {
			document.getElementById("usern_error").innerHTML="用户名不能为空";
			return false;
		}else if(un.length<3||un.length>16){
			document.getElementById("usern_error").innerHTML="用户名要在3~16位之间";
			return false;
		}else if(/^[\u4e00-\u9fa5]+$/.test(un)){
			document.getElementById("usern_error").innerHTML="用户名请设为数字、英文字母";
		}else{
			document.getElementById("usern_error").innerHTML="";
		}
		
		var pw = document.forms["form"]["pwd"].value;
		if (pw==null||pw=="") {
			document.getElementById("pwd_error").innerHTML="	密码不能为空";
			return false;
		}else if (pw.length<6||pw.length>30) {
			document.getElementById("pwd_error").innerHTML="密码要在6~30位之间";
			return false;
		}else{
			document.getElementById("pwd_error").innerHTML="";
		}
		var rp = document.forms["form"]["rpwd"].value;
		if(pw!=rp){
			document.getElementById("rpwd_error").innerHTML="两次密码必须一致";
			return false;
		}else{
			document.getElementById("rpwd_error").innerHTML="";
		}
		var ph = document.forms["form"]["phn"].value;
		if (ph==null||ph=="") {
			document.getElementById("phn_error").innerHTML="请填写手机号码";
			return false;
		}else if (ph.length!=11) {
			document.getElementById("phn_error").innerHTML="请正确填写手机号码(11位)";
			return false;
		}else{
			document.getElementById("phn_error").innerHTML="";
		}
		
		var uname = document.forms["form"]["uname"].value;
		if (!/^[\u4e00-\u9fa5]+$/.test(uname)||uname.length<2) {
			document.getElementById("uname_error").innerHTML="请输入2个或以上的汉字";
			return false;
		}else{
			document.getElementById("uname_error").innerHTML="";
		}
		
		var ad = document.forms["form"]["add"].value;
		if (ad==null||ad=="") {
			document.getElementById("add_error").innerHTML="	请填写外卖送达地址";
			return false;
		}else{
			document.getElementById("add_error").innerHTML="";
		}
				
	}
	function registers() {
		var r = confirm("注册成功！点击确定立即登入")
		if (r == true) {
			document.form.action = "${pageContext.request.contextPath}/registerOver.action";
			document.form.submit();
		} else {
			window.history.go(-1);
		}
	}
	function error1() {alert("用户不存在！");}
	function error2() {alert("密码不正确！");}
</script>
	<h2 align="center"><b>用户注册</b></h2>
	<form name="form" action="${pageContext.request.contextPath}/register.action" onsubmit="return check()" method="post">
	
		<table width="100%" style="table-layout: fixed;border-collapse:separate; border-spacing:0px 10px;" onkeyup="check()">
		
			<tr><td></td><td align="right">注册账号:&nbsp;&nbsp;</td>
			<td><input type="text" name="username" id="usern"></td><td colspan="2"><a style="color: red" name="un_error" id="usern_error">${exist}</a></td></tr>
				
			<tr><td></td><td align="right">注册密码:&nbsp;&nbsp;</td>
			<td><input type="password" name="password" id="pwd"></td><td colspan="2"><a style="color: red" id="pwd_error"></a></td></tr>	
			
			<tr><td></td><td align="right">确认密码:&nbsp;&nbsp;</td>
			<td><input type="password" name="register-password" id="rpwd"></td><td colspan="2"><a style="color: red" id="rpwd_error"></a></td></tr>
				
			<tr><td></td><td align="right">电话号码:&nbsp;&nbsp;</td>
			<td><input type="number" name="phonenum"  id="phn"
			onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td><td colspan="2"><a style="color: red" id="phn_error">${pexist}</a></td></tr>	
			
			<tr><td></td><td align="right">姓&nbsp;&nbsp;名:&nbsp;&nbsp;</td>
			<td><input type="text" name="name" id="uname"></td><td colspan="2"><a style="color: red" id="uname_error"></a></td></tr>	
			
			<tr><td></td><td align="right">性&nbsp;&nbsp;别:&nbsp;&nbsp;</td>
			<td><input type="radio" name="sex"  value="男"/><label for="man">男</label>
			<input type="radio" name="sex"  value="女"/><label for="woman">女</label></td><td colspan="2"></td></tr>	
			
			<tr><td></td><td align="right">家庭地址:&nbsp;&nbsp;</td>
			<td><input type="text" name="address" id="add"></td><td colspan="2"><a style="color: red" id="add_error"></a></td></tr>	
			
			<tr><td  colspan="5"></td></tr>
			<tr><td></td><td></td><td align="right"><button id="rbtn" type="submit">&nbsp;&nbsp;注册&nbsp;&nbsp;</button>
			<input type="hidden" name="username1">
			</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a charset="UTF-8" href="${pageContext.request.contextPath}/backToStore.action?username1=${username}"><b>返回</b></a></td><td></td></tr>
			
		</table>
	</form>
</body>
</html>