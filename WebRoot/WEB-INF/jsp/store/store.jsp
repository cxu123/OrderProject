
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>STORE</title>
<script type="text/javascript">
	function time() {
		var t = new Date();
		var d = t.toLocaleTimeString();

		document.getElementById("demo").innerHTML = d;
	}
	var a = setInterval(function() {
		time()
	}, 1000);

	function registers() {
		var r = confirm("注册成功！点击确定立即登入")
		if (r == true) {
		} else {
			window.history.go(-1);
		}
	}

	function error1() {
		alert("用户不存在！");
	}
	function error2() {
		alert("密码不正确！");
	}
	function loginS() {
		alert("登入成功！");
	}
	function sumbmits(){
		alert("点餐成功，如需更改请在5分钟之内操作!");
	}
	function sumbmitn(){
		alert("请选择至少一件商品!");
	}
	function sumbmitn2(){
		alert("请登入!");
	}
	
	var a = new Array();
	var c = new Array();
</script>
</head>

<body id="body" onload="${sendback}">
	<div id=win
		style="display:${display};POSITION:absolute;
 left:57%; top:55%; width:400px; height:200px; margin-left:-300px; margin-top:-200px; 
 border:1px solid #888; background-color:white; text-align:center">
		<h2>
			<b>登入</b>
		</h2>
		<form action="${pageContext.request.contextPath}/login.action"
			method="post">
			<table width="100%"
				style="table-layout: fixed; border-collapse: separate; border-spacing: 0px 10px;">
				<tr>
					<td align="right">账号:</td>
					<td align="left"><input type="text" name="username"></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">密码:</td>
					<td align="left"><input type="password" name="password"></td>
					<td><a name="fgpw" href="${pageContext.request.contextPath}/toChangePsw.action">忘记密码？</a></td>
				</tr>
			</table>
			<p align="right">
				<button name="comi" type="submit">确定</button>
				&nbsp;
				<button name="givu" type="button" onclick="closeLogin()">取消</button>
				&nbsp;&nbsp;&nbsp;
			</p>
		</form>
	</div>
	<script>
		function openLogin() {
			document.getElementById("win").style.display = "";
			
			var tdisab=document.getElementsByTagName("button");
			for (var i = 0; i < tdisab.length; i++) {
				if (tdisab[i].name=="comi"||tdisab[i].name=="givu") {	
				}else{
					tdisab[i].disabled="true";
				}
			}
			
			var tdisab1=document.getElementsByTagName("a");
			for (var i = 0; i < tdisab1.length; i++) {
				if (tdisab1[i].name=="fgpw") {	
				}else{
					tdisab1[i].disabled="true";
				}
			}
			
			var tdisab2=document.getElementsByTagName("input");
			for (var i = 0; i < tdisab2.length; i++) {
				if (tdisab2[i].name=="username"||tdisab2[i].name=="password") {	
				}else{
					tdisab2[i].disabled="true";
				}
			}
			
			var tdisab3=document.getElementsByTagName("select");
			for (var i = 0; i < tdisab3.length; i++) {
					tdisab3[i].disabled="true";
			}
		}
		
		function closeLogin() {
			
			document.getElementById("win").style.display = "none";
			
			var tdisab=document.getElementsByTagName("button");
			for (var i = 0; i < tdisab.length; i++) {
					tdisab[i].disabled="";
			}
			
			var tdisab1=document.getElementsByTagName("a");
			for (var i = 0; i < tdisab1.length; i++) {
					tdisab1[i].disabled="";
			}
			
			var tdisab2=document.getElementsByTagName("input");
			for (var i = 0; i < tdisab2.length; i++) {
					tdisab2[i].disabled="";
			}
			
			var tdisab3=document.getElementsByTagName("select");
			for (var i = 0; i < tdisab3.length; i++) {
					tdisab3[i].disabled="";
			}
			
		}
	
	</script>

	<input type="hidden" name="userdata">
	<table width="100%">
		<tr>
			<td><c:if test="${user==null}">
				<a href="javascript:openLogin();"><b>登入</b></a>
				</c:if>
				<c:if test="${user!=null}">
				<a href="${pageContext.request.contextPath}/toUserinfo.action?userdata=${user.username}" 
				style="text-decoration: none;color: black;"><b>${user.name}&nbsp;&nbsp;</b></a>
				</c:if>
				|
				<c:if test="${user==null}"><a charset="UTF-8"
				href="${pageContext.request.contextPath}/toRegister.action?userdata=${user.username}" >
				<b>注册</b></a></c:if>
				<c:if test="${user!=null}">
				<a charset="UTF-8"
				href="${pageContext.request.contextPath}/toStore.action">
				<b>注销</b></a>
				</c:if>
				</td>
			<td align="right"><a style="font-size: 3"
				href="${pageContext.request.contextPath}/toBackStage.action?userdata=${user.username}"><b>后台</b></a></td>
		</tr>
	</table>

	<h1 align="center">
		<b>点餐系统</b>
	</h1>
	<br>

	<table width="100%">
		<tr>
			<form action="${pageContext.request.contextPath}/searchdish.action"
				method="post">
				<input type="hidden" name="userdata" value="${user.username}">
			<td>搜索菜品:&nbsp;&nbsp;<input type="text" name="condition">
				<button type="submit" >&nbsp;搜索&nbsp;</button>
				</form>&nbsp;&nbsp;&nbsp; <a
				href="${pageContext.request.contextPath}/backToStore.action?username1=${user.username}"><b>显示全部&nbsp;</b><b
					style="font-size: small;">▼</b></a>
			</td>
			<form method="post" name="tyform" action="${pageContext.request.contextPath}/findTlist.action">
			<td align="right">选择种类:
			<input type="hidden" name="userdata" value="${user.username}">
			 <select name="selted" id="district" >
					<optgroup label="种类">
						<option onclick="findbytype()" value="主食">主食</option>
						<option <c:if test="${selcted=='饮料'}">selected</c:if> onclick="findbytype()" value="饮料">饮料</option>
						<option <c:if test="${selcted=='小吃'}">selected</c:if> onclick="findbytype()" value="小吃">小吃</option>
			</select></td></form>
		</tr>
	</table>

	<hr>
	<form name="sform" action="${pageContext.request.contextPath}/orderSubmit.action" method="post" onsubmit="return errorf()">
		<fieldset>
			<legend>菜单</legend>
			<table width="100%" onkeyup="errorf()">
				<tr>
					<td align="center"><b>菜品名称:</b></td>
					<td align="center"><b>类型:</b></td>
					<td></td>
					<td align="center"><b>价格:</b></td>
					<td></td>
					<td align="center"><b>剩余:</b></td>
					<td></td>
					<td align="center"><b>购买数量:</b></td>
				</tr>
				<tr></tr>
				<tr></tr>
				
				<c:forEach items="${slist}" var="list" varStatus="status">
					<tr>
						<td style="padding-left: 6%;">${list.dishname}</td>
						<td align="center">${list.dishtype}</td>
						<td></td>
						<td style="padding-left: 4%;"><a name="price">${list.price}</a></td>
						<td>元</td>
						<td style="padding-left: 4%;"><a name="num">${list.num}</a></td>
						<td>份</td>
						<td align="center"><input type="hidden" name="ids"
							value="${list.id}"><input size="5" type="number"
							name="nums" onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
					</tr>
					<script>a.push("${list.num}");c.push("${list.price}")</script>
				</c:forEach>
			</table>
		</fieldset>
		<br>

		<script type="text/javascript">
			function findbytype(){
				document.tyform.submit();
				/* var sele=document.getElementById("district");
				alert(sele.value); */
			}
		
			var b=document.getElementsByName("nums");
			function errorn(){
				
			var linss =document.getElementById("line").value;
				if (linss>0) {
					alert("您还有正在进行的订单，如需更改可进入订单页取消后重新下单。");
					return false;
				}
				
				var h = 0;
				for (var i = 0; i < a.length; i++) {
					h=h+b[i].value;
				}
				if (h==0||h==null) {
					sumbmitn();
					return false;
				}
				
			}
		
			function errorf(){
				
				
				var f=document.getElementById("balan").value;
				var d = 0;
				if (a.length==null||a.length==0) {
					var x=document.getElementById("errors").innerHTML="没有类似食品！";
					return false;
				}
				var h = 0;
				for (var i = 0; i < a.length; i++) {
					if (eval(b[i].value)>eval(a[i])) {
						var x=document.getElementById("errors").innerHTML="库存不足！";
						return false;
					}else {
						var x=document.getElementById("errors").innerHTML="";
					}
					d=d+b[i].value*c[i];
					h=h+b[i].value;
				}
				
				
				var x=document.getElementById("sum").innerHTML=d;
				//var sx=document.getElementById("sxx").value=d;
				if (eval(d)>eval(f)) {
					var x=document.getElementById("errors").innerHTML="余额不足！";
					return false;
				}else{
					var x=document.getElementById("errors").innerHTML="";
				}
				var linss =document.getElementById("line").value;
				if (h==0||h==null||linss>0) {
					return false;
				}
			}
		
			function torecharge(){
				document.sform.action="${pageContext.request.contextPath}/toRecharge.action";
				document.sform.submit();
			}
			
			function toorder() {
				document.sform.action = "${pageContext.request.contextPath}/toOrder.action";
				document.sform.submit();
			}
		</script>

		<table width="100%">
			<tr><td></td><td align="right"><a style="color: red;" id="errors"></a></td></tr>
			<tr>
				<td><input type="hidden" name="userdata"value="${user.username}"> 
				<b>您的可用余额为:<input type="hidden" id="balan" value="${user.balance}">
				<c:if test="${user==null}">0</c:if>
				<c:if test="${user!=null}">${user.balance}</c:if>
				
						元&nbsp;
						<button type="button" onclick="torecharge()">充值</button>
				</b></td>  
				<td align="right"><b>共计:<a id="sum">0</a> 元</b> &nbsp;&nbsp;&nbsp; 
					<button type="submit" onclick="errorn()">确认支付</button>
				
					<b style="font-size: large;">&nbsp;|&nbsp;</b>
			
					<input type="hidden" id="line" name="orderline" value="${line}">
					<button type="button" onmousemove="errorf()" onclick="toorder()">查看订单</button></td>
			</tr>
					
		</table>
			</form> 
</body>
</html>