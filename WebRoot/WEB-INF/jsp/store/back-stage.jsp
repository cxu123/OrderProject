
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
	function selecttype() {
		window.history.go(-1);
	}
	function loststh(){
		var dn = document.forms["addd"]["dishname"].value;
		var dnu = document.forms["addd"]["num"].value;
		var dp = document.forms["addd"]["price"].value;
		if (dn==null||dn==""||dnu==null||dnu==""||dp==null||dp=='') {
			alert("请将要添加的食品资料填写完整！");
			return false;
		}else {
			alert("添加成功！");
		}
	}
	function success(){
		alert("修改成功！");
	}
</script>
</head>

<body>

	<h1 align="center">
		<b>商城管理</b>
	</h1>
	<h4>
		<a href="${pageContext.request.contextPath}/backToStore.action?username1=${username}">返回</a>
	</h4>
	<hr>
	
		<fieldset>
			
			<table width="100%">
				<tr><td></td>
					<td align="center">[菜名]</td>
					<td align="center">[数量]</td>
					<td></td>
					<td align="center">[价格]</td>
					<td></td>
					<td align="center">[种类]</td>
				</tr>
				</table>
		
			<table width="100%">
			<form name="addd" action="${pageContext.request.contextPath}/BackStageAdd.action"
				method="post" onsubmit="return loststh()">
				<tr>
					<td>添加:</td>
					<td><input type="text" name="dishname"></td>
					<td><input type="number" name="num"
						onkeyup="this.value=this.value.replace(/\D/g,'')"
						onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
					<td></td>
					<td><input type="number" name="price"
						onkeyup="this.value=this.value.replace(/\D/g,'')"
						onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
					<td></td>
					<td>选择种类:&nbsp;<select name="dishtype">
							<optgroup  label="种类">
								<option  value="主食" selected="selected">主食</option>
								<option  value="饮料">饮料</option>
								<option  value="小吃">小吃</option>								
							</optgroup>
						</select>&nbsp;&nbsp;<button type="submit">&nbsp;确定&nbsp;</button></td><input type="hidden" name="username" value="${username}">
					
				</tr>
				</form>
				<tr height="8"></tr>
				
			<form action="${pageContext.request.contextPath}/BackStage.action"
				method="post" onsubmit="return success();">
				<c:forEach items="${cDishs}" var="list">
					<tr>
						<td></td>
						<td>${list.dishname}<input type="hidden" name="udid"
							value="${list.id}"></td>
						<td><input type="number" name="udnum" value="${list.num}"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')">份</td>
						<td></td>
						<td><input type="number" name="udprice" value="${list.price}"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')">元</td>
						<td></td>
						<td>选择种类:&nbsp;<select name="udtype">
								<optgroup label="种类">
									<option value="主食">主食</option>
									<option <c:if test="${list.dishtype=='饮料'}">selected</c:if>
										value="饮料">饮料</option>
									<option <c:if test="${list.dishtype=='小吃'}">selected</c:if>
										value="小吃">小吃</option>
								</optgroup>
						</select></td>
					</tr>
				</c:forEach>
		</table>
			<input type="hidden" name="username" value="${username}">
		</fieldset>
		<br>
		<div align="right">
			<button type="submit">确认修改</button>
		</div>
	</form>
</body>
</html>