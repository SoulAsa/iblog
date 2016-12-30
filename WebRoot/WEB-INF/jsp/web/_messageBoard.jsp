<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link href="${pageContext.request.contextPath }/css/bookbase.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/css/book.css" rel="stylesheet">
		<link  rel="stylesheet" href="${pageContext.request.contextPath }/css/message.css" />
		<!-- 引入css文件 -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/default/easyui.css" type="text/css"></link>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/icon.css" type="text/css"></link>
	    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css" type="text/css"></link>
		<!-- 引入js文件 -->
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
	    
		<script type="text/javascript">
			var list_url = "${pageContext.request.contextPath }/web/web_messageBoard.action";
			function doValidate() {
				var c = $("#button12").parent().parent().prev().children(":first-child").val();
				alert(c);
				var userName = $('#username').val();
				var email = $('#email').val();
				var content = $('.text').val();
				var flag = null;
				if (content == "") {
					alert("请输入留言内容");
				} else if (userName == "" || email =="") {
					alert("请输入用户名与电子邮箱");
				} else {
					flag = email.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
					if (flag == null) {
						alert("您输入的电子邮箱格式不正确");
					} else {
						$.ajax({
							url:"${pageContext.request.contextPath }/web/web_addMessage.action",
							data:{
								"message.userName" : userName,
								"message.email" : email,
								"message.content" : content
							},
							type:"post",
							success:function(returnVal){
								alert("留言成功！");
								window.location.href = list_url;
							}
						});
					}
				}
			}
		</script>
		<script type="text/javascript">
			// 回复框
			function reply(messageId) {
				var html = "";
				html += '<div class="content" style="margin-left:70px">';
				html += '	<div class="cont-box">';
				html += '		<textarea class="text" placeholder="请输入..."></textarea>';
				html += '	</div>';
				html += '	<div class="tools-box">';
				html += '		<div class="submit-btn"><input id="button12" type="button" onClick="doValidate()" value="发布"/></div>';
				html += '	</div>';
				html += '</div>';
				$("#"+messageId).append(html);
				
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
								用&nbsp;户&nbsp;名：<input type="text" id="username" name="message.userName"/>&nbsp;&nbsp;
								电&nbsp;子&nbsp;邮&nbsp;箱：<input type="text" id="email" name="message.email"/>
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
									<div class="submit-btn"><input id="button11" type="button" onClick="doValidate()" value="发布"/></div>
								</div>
							</div>
						</div>
						<div id="info-show">
							<ul>
								<s:iterator value="pageResult.items" status="st">
									<li id="<s:property value='messageId'/>">
										<div class="head-face">
											<img src="${pageContext.request.contextPath }/images/1.jpg" />
										</div>
										<div class="reply-cont">
											<p class="username"><s:property value="userName"/></p>
											<p class="comment-body">
												<s:if test="message.messageId != null">
													<span>回复&nbsp;<s:property value="message.userName"/>：</span>
												</s:if>
												<s:property value="content"/>
											</p>
											<p class="comment-footer">
												<s:date name="messageTime" format="yyyy-MM-dd HH:mm"/>
												<span style="margin-left:20px"><input type="button" onClick="reply('<s:property value="messageId" />')" value="回复"/></span>
											</p>
										</div>
										<!-- <div class="content">
											<div class="cont-box">
												<textarea class="text" placeholder="请输入..."></textarea>
											</div>
											<div class="tools-box">
												<div class="submit-btn"><input id="button12" type="button" onClick="doValidate()" value="发布"/></div>
											</div>
										</div> -->
									</li>
								</s:iterator>
							</ul>
						</div>
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


