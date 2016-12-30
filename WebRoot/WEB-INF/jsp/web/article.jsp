<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/new.css">
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
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/basic-grey.css">
		<style>
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
				$("#MyDiv2").slideToggle("slow");
			};
		</script>
				
		<script type="text/javascript">
			function doValidate(commentId) {
				pid = commentId;
				content = $("#"+commentId).parent().parent().prev().children(":first-child").val();
				if (content == "") {
					alert("请输入评论信息");
					//$.messager.alert('评论框','请输入评论信息');
				} else {
					ShowDiv('MyDiv');
				}
			}
		</script>
		
		<script type="text/javascript">
			var artId = "${article.artId}";
			var list_url = "${pageContext.request.contextPath }/web/web_article.action?article.artId=" + artId;
			function doSend() {
				var userName = $('#username').val();
				var email = $('#email').val();
				var flag = null;
				if (userName == "" || email =="") {
					alert("请输入用户名与电子邮箱");
					//$.messager.alert('评论框','请输入用户名与电子邮箱');
				} else {
					flag = email.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);
					if (flag == null) {
						alert("您输入的电子邮箱格式不正确");
						//$.messager.alert('评论框','您输入的电子邮箱格式不正确');
					} else {
						$.ajax({
							url:"${pageContext.request.contextPath }/web/web_addComment.action",
							data:{
								"comment.userName" : userName,
								"comment.email" : email,
								"comment.content" : content,
								"comment.comment.commentId" : pid,
								"comment.article.artId" : artId
							},
							type:"post",
							success:function(returnVal){
								alert("评论成功！");
								//$.messager.alert('评论框','评论成功！');
								window.location.href = list_url;
							}
						});
					}
				}
			}
		</script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
		<script type="text/javascript">
			// 异步增加阅读量
			$.ajax({
				url:"${pageContext.request.contextPath }/web/web_addReadCount.action",
				data:{
					"article.artId" : "${article.artId}"
				},
				type:"post"
			});
		</script>
	</head>
	<body>
		<jsp:include page="/common/web_header.jsp"></jsp:include>
		<article class="blogs">
  			<h1 class="t_nav"><span>我们长路漫漫，只因学无止境。</span>
	  		  <a href="${pageContext.request.contextPath }/web/web_index.action" class="n1">网站首页</a>
	  		  <a href="#" class="n2">日记</a>
  			</h1>
		  <div class="index_about">
		    <h2 class="c_titile"><s:property value="article.title"/></h2>
		    <p class="box_c"><span class="d_time">发布时间：<s:date name="article.createTime" format="yyyy-MM-dd HH:mm"/></span>
		    	<span>编辑：<s:property value="admin.name"/></span>
		    	<span onload="">阅读（<s:property value="article.readCount"/>）</span>
		    </p>
		    <ul class="infos">
		    	<s:property value="article.content" escape="false"/>
		    </ul>
		    <div class="keybq">
		    <p><span>关键字词</span>：<s:property value="article.keyword"/></p>
		    
		    </div>
		    <div class="nextinfo">
		      <p>上一篇：<a href="/news/s/2013-09-04/606.html">程序员应该如何高效的工作学习</a></p>
		      <p>下一篇：<a href="/news/s/2013-10-21/616.html">柴米油盐的生活才是真实</a></p>
		    </div>
		    
		    <!-- 评论框及 列表 -->
			<div class="book left">
				<!-- 评论 start -->
				<div id="content" style="width: 600px; height: auto;margin-left:20px;margin-top:40px">
					<div class="wrap">
						<div class="comment">
							<div style="margin:10px;padding-left:50px">
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
										<input id="comment" type="button" onclick="doValidate('comment')" value="发布"/>
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
												<s:if test="comment.commentId != null">
													<span>回复&nbsp;<s:property value="comment.userName"/>：</span>
												</s:if>
												<s:property value="content"/>
											</p>
											<p class="comment-footer">
												<s:date name="commentTime" format="yyyy-MM-dd HH:mm"/>
												<span style="margin-left:20px">
													<input type="button" 
														onclick="ShowDiv2('MyDiv2','<s:property value="commentId" />')"
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
													<input id="<s:property value='commentId'/>" type="button" onclick="doValidate('<s:property value="commentId" />')" value="发布"/>
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
				<!-- 评论 end -->
			</div>
		    
		  </div>
		  <aside class="right">
		    <div class="blank"></div>
		    <%@ include file="/common/web_sort.jsp"%>
		    <div class="visitors">
		      <h3><p>最近访客</p></h3>
		      <ul>
		      
		      </ul>
		    </div>
		  </aside>
		</article>
		<jsp:include page="/common/web_footer.jsp"></jsp:include>
	</body>
</html>