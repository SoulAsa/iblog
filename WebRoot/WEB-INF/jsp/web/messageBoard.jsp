<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bookbase.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/book.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/message.css" />
		<!-- 引入easyui - css文件 -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/default/easyui.css" type="text/css"></link>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/icon.css" type="text/css"></link>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css" type="text/css"></link>
		<!-- 引入easyui - js文件 -->
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
	    
	    <!-- 弹出层 -->
		<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/smart-green.css"> --%>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/basic-grey.css">
		<style>
			.black_overlay{
				display: none;
				position: absolute;
				top: 0%;
				left: 0%;
				width: 100%;
				height: 100%;
				background-color: black;
				z-index:1001;
				-moz-opacity: 0.8;
				opacity:.80;
				filter: alpha(opacity=80);
			}
			.white_content {
				display: none;
				position: fixed;
				*position: absolute;
				top: 30%;
				left: 30%;
				width: 40%;
				height: 50%;
				margin:-50px 0 0 -50px;
				background-color: white;
				z-index:1002;
				overflow: auto;
			}
			.content1 {
				display: none;
				margin-left:70px;
			}
			
			.white_content_small {
				display: none;
				position: absolute;
				top: 20%;
				left: 30%;
				width: 40%;
				height: 50%;
				border: 16px solid lightblue;
				background-color: white;
				z-index:1002;
				overflow: auto;
			}
		</style>
		<script type="text/javascript">
			//弹出隐藏层
			function ShowDiv(show_div) {
				document.getElementById(show_div).style.display='block';
			};
			//关闭弹出层
			function CloseDiv(show_div) {
				document.getElementById(show_div).style.display='none';
			};
		</script>
		<script type="text/javascript">
			//下滑隐藏层
			function ShowDiv2(show_div,messageId){
				//document.getElementById(show_div).style.display='block';
				$("#MyDiv2").slideToggle("slow");
			};
		</script>
				
		<script type="text/javascript">
			function doValidate(messageId) {
				pid = messageId;
				content = $("#"+messageId).parent().parent().prev().children(":first-child").val();
				if (content == "") {
					$.messager.alert('留言板','请输入留言信息');
				} else {
					ShowDiv('MyDiv');
				}
			}
		</script>
		
		<script type="text/javascript">
			var list_url = "${pageContext.request.contextPath }/web/web_messageBoard.action";
			function doSend() {
				var userName = $('#username').val();
				var email = $('#email').val();
				var flag = null;
				if (userName == "" || email =="") {
					$.messager.alert('留言板','请输入用户名与电子邮箱');
				} else {
					flag = email.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
					if (flag == null) {
						$.messager.alert('留言板','您输入的电子邮箱格式不正确');
					} else {
						$.ajax({
							url:"${pageContext.request.contextPath }/web/web_addMessage.action",
							data:{
								"message.userName" : userName,
								"message.email" : email,
								"message.content" : content,
								"message.message.messageId" : pid
							},
							type:"post",
							success:function(returnVal){
								$.messager.alert('留言板','留言成功！');
								window.location.href = list_url;
							}
						});
					}
				}
			}
		</script>
	</head>
	<body>
		<jsp:include page="/common/web_header.jsp"></jsp:include>
		<article class="aboutcon">
			<h1 class="t_nav"><span>你，生命中最重要的过客，之所以是过客，因为你未曾为我停留。</span>
				<a href="${pageContext.request.contextPath }/web/web_index.action" class="n1">网站首页</a>
				<a href="${pageContext.request.contextPath }/web/web_messageBoard.action" class="n2">留言版</a>
			</h1>
			<div class="book left">
				<!-- 多说留言板 start -->
				<div id="content" style="width: 600px; height: auto;margin-left:20px;margin-top:40px">
					<div class="wrap">
						<div class="comment">
							<div style="margin:10px;padding-left:50px">
								<!-- 用&nbsp;户&nbsp;名：<input type="text" id="username" name="message.userName"/>&nbsp;&nbsp;
								电&nbsp;子&nbsp;邮&nbsp;箱：<input type="text" id="email" name="message.email"/> -->
								<p>
							</div>
							<div class="head-face">
								<img src="${pageContext.request.contextPath }/images/1.jpg"/>
							</div>
							<div class="content">
								<div class="cont-box">
									<textarea class="text" placeholder="请输入..."></textarea>
								</div>
								<div class="tools-box">
									<div class="submit-btn">
										<input id="message" type="button" onclick="doValidate('message')" value="发布"/>
									</div>
								</div>
							</div>
						</div>
						<div id="info-show">
							<ul>
								<s:iterator value="pageResult.items" status="st">
									<li>
										<div class="head-face">
											<img src="${pageContext.request.contextPath }/images/1.jpg" />
										</div>
										<div class="reply-cont">
											<p class="username"><s:property value="userName" escape="false"/></p>
											<p class="comment-body">
												<s:if test="message.messageId != null">
													<span>回复&nbsp;<s:property value="message.userName"/>：</span>
												</s:if>
												<s:property value="content"/>
											</p>
											<p class="comment-footer">
												<s:date name="messageTime" format="yyyy-MM-dd HH:mm"/>
												<span style="margin-left:20px">
													<input type="button" 
														onclick="ShowDiv2('MyDiv2','<s:property value="messageId" />')"
														value="回复"/>
												</span>
											</p>
										</div>
										<!-- 下滑层begin -->
										<div id="MyDiv2" class="content1">
											<div class="cont-box">
												<textarea class="text" placeholder="请输入..."></textarea>
											</div>
											<div class="tools-box">
												<div class="submit-btn">
													<input id="<s:property value='messageId'/>" type="button" onclick="doValidate('<s:property value="messageId" />')" value="发布"/>
												</div>
											</div>
										</div>
										<!-- 下滑层end -->
									</li>
								</s:iterator>
							</ul>
						</div>
						<!-- 弹出层begin -->
						<div id="MyDiv" class="white_content">
							<form action="" method="post" class="basic-grey">
								<h1>联系表单
									<span id="tip">请填写所有表单项</span>
								</h1>
								<label>
									<span>用户名：</span>
									<input id="username" type="text" name="message.userName" placeholder="请输入用户名..." />
								</label>
								<label>
									<span>电子邮箱：</span>
									<input id="email" type="email" name="message.email" placeholder="请输入邮箱..." />
								</label>
						
								<label>
									<span>&nbsp;</span>
									<span onclick="CloseDiv('MyDiv','fade')">
									   <input type="button" class="button" value="Cancel" />
									</span>
									<span>&nbsp;</span>
									<span>
									   <input type="button" class="button" value="发布" onClick="doSend()"/>
									</span>
								</label>
							</form>
						</div>
						<!-- 弹出层end -->
					</div>
				</div>
				<jsp:include page="/common/pageNavigator.jsp"></jsp:include>
				<div style="text-align:center;">
				</div>
				<!-- 多说留言板 end -->
			</div>
			<aside class="right">  
			    <jsp:include page="/common/web_info.jsp"></jsp:include>
			</aside>
		</article>
		<jsp:include page="/common/web_footer.jsp"></jsp:include>
	</body>
</html>


