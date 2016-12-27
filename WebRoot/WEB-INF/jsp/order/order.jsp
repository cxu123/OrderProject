
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ORDER Manager</title>
<script type="text/javascript">
		var f = ${leftTime};
		var t = new Date(f);
	
	function time() {
		if (eval(t.getMinutes()) < eval(5)) {
			t.setSeconds(t.getSeconds() + 1, 0);
			if (t.getSeconds() < 10) {
				document.getElementById("demo").innerHTML = t.getMinutes()
						+ ":0" + t.getSeconds();
			} else {
				document.getElementById("demo").innerHTML = t.getMinutes()
						+ ":" + t.getSeconds();
			}
		}else{
				document.getElementById("demo").innerHTML = "订单已完成";
				document.getElementById("doneer").innerHTML = "";
			if (t.getMinutes()==5&&(t.getSeconds()==0)) {
				history.go(0);
				inst++;
			}
		}
	}
	var a = setInterval(function() {
		time();
	}, 1000);
	function warn() {
		alert("取消订单成功，退款已打入余额");
	}
	
	
		
</script>

</head>

<body onload="time()">
	<h2 align="center">
		<b>订单管理</b>
	</h2>
	<h4>
		<a
			href="${pageContext.request.contextPath}/backToStore.action?username1=${username}"><b>返回</b></a>
	</h4>
	<hr>
	<c:if test="${orderList!=null}">
		<fieldset>
			<legend>
				<b>正在进行</b>
			</legend>
			<table width="100%" border="4">
				<c:forEach items="${orderList}" var="olist" end="0">
					<tr>
						<td rowspan="2">订单号:${olist.linenum}</td><script>int lin =${olist.linenum}; 
																			document.getElementById("linenumid").value=lin;</script>
						<td align="center" colspan="3"><b>订单内容</b></td>
					</tr>
					<tr>
						<td><c:forEach items="${orderList}" var="olist1">
					${olist1.dishname}
					&nbsp;&nbsp;&nbsp;${olist1.num}份<br>
							</c:forEach></td>
<%-- ${leftTime} --%>
						<td>订餐时间<b>:</b>&nbsp;&nbsp;<fmt:formatDate
								value="${olist.date}" pattern="HH:mm:ss" /></td>
						<td>即将送餐<b>:</b>&nbsp;&nbsp;<a id="demo" ></a><a style="padding-left: 25%;"></a> 
						<a onclick="warn()" id="doneer" href="${pageContext.request.contextPath}/deleteOneOrder.action?linenum=${olist.linenum}&username=${username}">取消订单</a></td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
		<hr>
	</c:if>
	<fieldset>
		<legend>
			<b>历史订单</b>
		</legend>
		<c:forEach items="${odMap}" var="omap" end="0">
		<c:if test="${omap.value!=null}">	
		<form action="${pageContext.request.contextPath}/deleteOrder.action"
			onsubmit="return errors()" method="post">
			<input type="hidden" name="username" value="${username}">
			<c:forEach items="${orderList}" var="olist" end="0">
			<input type="hidden" name="linenum" id="linenumid" value="${olist.linenum}">
			</c:forEach>
			<table width="100%">
				<tr>
					<td><button type="button" onclick = "checke()">全选</button></td>
					
					<td align="right"><button type="submit">删除</button></td>
				</tr>
			</table>

			<table width="100%" border="4">
				<tr>
					<td colspan="4"><b style="font-size: large;">用户名:&nbsp;&nbsp;[${username}]</b></td>
				</tr>
				<c:forEach items="${odMap}" var="map">
					<tr>
						<td rowspan="2"><input type="checkbox" name="checkes" value="${map.key}"></td>
						<td rowspan="2">订单号:${map.key}</td>
						<td align="center" colspan="2"><b>订单内容</b></td>
					</tr>
					<tr>
						<td><c:forEach items="${map.value}" var="list2">
					${list2.dishname}
					&nbsp;&nbsp;&nbsp;${list2.num}份<br>
							</c:forEach></td>
						<c:forEach items="${map.value}" var="list2" end="0">
							<td>订餐时间<b>:</b>&nbsp;&nbsp;<fmt:formatDate
									value="${list2.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>

		</form>
		</c:if>
		<c:if test="${orderList==null&&omap.value==null}">
			<h2 align="center">
				<b style="color: red;">没有任何订单，快去点餐吧！</b>
			</h2>
		</c:if>
		</c:forEach>
	</fieldset>
	<script type="text/javascript">

		var a = 1;
		var c = document.getElementsByName("checkes");
		
		function checke() {
			if (a % 2 != 0) {

				for (var i = 0; i < c.length; i++) {
					c[i].checked = "checked";
				}
				a++;
			} else {

				for (var i = 0; i < c.length; i++) {
					c[i].checked = "";
				}
				a++;
			}
		}
		
		function errors() {
			var b = 0;
			if (c == null || c.length == 0) {
				alert("没有订单！")
				return false;
			} else {
				for (var i = 0; i < c.length; i++) {
					if (c[i].checked==true) {
						b++;
					}
				}
				if (b == 0) {
					alert("请至少选择一个订单！");
					return false;
				}
				alert("订单删除成功！");
			}
		}
	</script>
</body>
</html>