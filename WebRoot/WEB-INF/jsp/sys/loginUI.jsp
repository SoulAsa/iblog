<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>登陆页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css" type="text/css"></link>
	<script type="text/javascript">
		$(function() {
			//得到焦点
			$("#password").focus(function() {
				$("#left_hand").animate({
					left : "150",
					top : " -38"
				}, {
					step : function() {
						if (parseInt($("#left_hand").css("left")) > 140) {
							$("#left_hand").attr("class", "left_hand");
						}
					}
				}, 2000);
				$("#right_hand").animate({
					right : "-64",
					top : "-38px"
				}, {
					step : function() {
						if (parseInt($("#right_hand").css("right")) > -70) {
							$("#right_hand").attr("class", "right_hand");
						}
					}
				}, 2000);
			});
			//失去焦点
			$("#password").blur(function() {
				$("#left_hand").attr("class", "initial_left_hand");
				$("#left_hand").attr("style", "left:100px;top:-12px;");
				$("#right_hand").attr("class", "initial_right_hand");
				$("#right_hand").attr("style", "right:-112px;top:-12px");
			});
		});
	</script>

  </head>
  
  <body>
	<form action="${pageContext.request.contextPath }/sys/login_login.action" method="post">
		<DIV class="top_div"></DIV>
		<DIV
			style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 225px; text-align: center;">
			<DIV style="width: 165px; height: 96px; position: absolute;">
				<DIV class="tou"></DIV>
				<DIV class="initial_left_hand" id="left_hand"></DIV>
				<DIV class="initial_right_hand" id="right_hand"></DIV>
			</DIV>
			<P style="padding: 30px 0px 10px; position: relative;">
				<SPAN class="u_logo"></SPAN> <INPUT class="ipt" type="text"
					name="adminId.admin" placeholder="请输入账号">
			</P>
			<P style="padding: 0px 0px 10px;position: relative;">
				<SPAN class="p_logo"></SPAN> <INPUT class="ipt" id="password"
					type="password" name="adminId.pwd" placeholder="请输入密码">
			</P>			
			<div
				style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
				<P style="margin: 0px 35px 10px 20px;">
					<SPAN style="float: left;margin-left:20px;">
						<font color="red" id="errMsg"><s:property value="loginResult"/></font>
					</SPAN>
					<SPAN style="float: right;margin-right:20px;"> <input
						style="background: rgb(0, 142, 173); padding: 10px 30px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;"
						type="submit" value="登录"/></SPAN>
				</P>
				<input type="hidden" name="method" value="userLogin"/>
			</div>
		</DIV>
		</DIV>
	</form>
</body>
</html>
