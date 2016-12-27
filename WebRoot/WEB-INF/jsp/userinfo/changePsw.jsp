<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<script type="text/javascript">
	function checkw(){
		var a = document.forms["cform"]["psw"].value;
		var b = document.forms["cform"]["rpsw"].value;
		if (a==null||a=="") {
			document.getElementById("checkl").innerHTML="密码不能为空";
			document.getElementById("check").innerHTML="";
		}else if (a.length<6) {
			document.getElementById("checkl").innerHTML="密码要在6~30位之间";
			document.getElementById("check").innerHTML="";
		}else if (a!=b) {
			document.getElementById("check").innerHTML="两次输入密码必须一致！";
			document.getElementById("checkl").innerHTML="";
		}else{
			document.getElementById("checkl").innerHTML="";
			document.getElementById("check").innerHTML="";
			var c=confirm("确定修改密码并登入？");
			if (c) {
				document.cform.action="${pageContext.request.contextPath}/changePswDone.action";
				document.cform.submit();
			} 
		}
	}
	

</script>

<div id=win
		style="display:${display};POSITION:absolute;
 left:57%; top:55%; width:450px; height:200px; margin-left:-300px; margin-top:-200px; 
 border:1px solid #888; background-color:white; text-align:center">
		<h2>
			<b>修改密码</b>
		</h2>
		<form name="cform" 
			method="post">
			<table width="100%"
				style="table-layout: fixed; border-collapse: separate; border-spacing: 0px 10px;">
				<tr>
					<td align="right">输入新密码:</td>
					<td align="left"><input type="password" id="psw" name="n_password"></td>
					<td><a id="checkl" style="color: red" ></a></td>
				</tr>
				<tr>
					<td align="right">确认密码:</td>
					<td align="left"><input type="password" id="rpsw" name="rn_password"></td>
					<td><a id="check" style="color: red" ></a></td>
				</tr>
			</table>
			<p align="right">
				<input type="hidden" name="username" value="${user.username}">
				<button type="button" onclick="checkw()">确定</button>
				&nbsp;
				<button type="button" onclick="closeLogin()">取消</button>
				&nbsp;&nbsp;&nbsp;
			</p>
		</form>
	</div>
	<script>
		function openLogin() {
			document.getElementById("win").style.display = "";
		}
		function closeLogin() {
			document.getElementById("win").style.display = "none";
		}
	</script>



	<h2>找回密码</h2>
	<form action="${pageContext.request.contextPath}/changePsw.action" method="post">
		请输入您的账号:&nbsp;<input type="text" name="c_username"><a style="color: red" >${exist}</a><br/><br>
		请输入您的姓名:&nbsp;<input type="text" name="c_name"><a style="color: red" >${nwrong}</a><br/><br>
		请输入您的注册电话号码:&nbsp;<input type="text" name="c_phonenum" 
		onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><a style="color: red" >${pwrong}</a><br/><br>
		<button type="submit" >&nbsp;&nbsp;提交&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/toStore.action">返回</a>
	</form>
</body>
</html>