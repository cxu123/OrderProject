<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RECHARGE</title>
</head>
<script type="text/javascript">
	function check(){
		var a = document.forms['fo']['recharge'].value;
		if (a==null||a==0) {
			alert("......");
		}else{
			alert("充值成功！");
		}
	}
</script>
<body>
<form name="fo" action="${pageContext.request.contextPath}/RechargeDone.action" method="post" onsubmit="return check()">
<h2>充值页面</h2>
<hr>		<input type="hidden" name="username" value="${username}">
	充值金额:<input type="text"  onkeyup="this.value=this.value.replace(/\D/g,'')" 
	onafterpaste="this.value=this.value.replace(/\D/g,'')" name="recharge" ><button type="submit">确认</button>
</form>
</body>
</html>