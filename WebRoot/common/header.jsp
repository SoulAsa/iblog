<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
	<!-- 引入css文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/icon.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/header.css" type="text/css"></link>
	<!-- 引入js文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body class="easyui-layout">
   	 <!-- <div data-options="region:'north'" style="height:69px"> -->
   	 <div data-options="region:'north'" style="height:140px;overflow:hidden">
   	 	<%--<div class="nav-top">
	   	 	<span>个人博客后台管理系统</span>
		    <div class="nav-topright">
		    	<p>我用双手成就你的梦想</p>
		        <span>您好：管理员</span><span><a href="${pageContext.request.contextPath }/sys/login_logout.action">注销</a></span>
		    </div> 
	    </div>--%>
		<img src="${pageContext.request.contextPath }/images/head/00.jpg" width="100%" height="140px">
   	 </div>
   	 <div data-options="region:'center'">
   	 	<div class="easyui-layout" data-options="fit:true">
   	 		<div data-options="region:'west'" style="width:20%">
   	 			<div data-options="region:'north'" style="height:50%">
	   	 			<div id="aa" class="easyui-accordion" data-options="fit:true">   
					    <div title="&nbsp;&nbsp;文章模块" data-options="iconCls:'icon-article'" style="overflow:auto;padding:10px">
							<a class="easyui-linkbutton" 
								href="${pageContext.request.contextPath }/sys/category_listUI.action" 
								data-options="iconCls:'icon-category'"
								style="width:90%;margin:1px">&nbsp;分类信息</a>
					   		<a class="easyui-linkbutton" 
					   			href="${pageContext.request.contextPath }/sys/tag_listUI.action" 
					   			data-options="iconCls:'icon-tag'"
								style="width:90%;margin:1px">&nbsp;标签信息</a>
					   		<a class="easyui-linkbutton" 
					   			href="${pageContext.request.contextPath }/sys/article_listUI.action" 
					   			data-options="iconCls:'icon-article'"
								style="width:90%;margin:1px">&nbsp;文章信息</a>
					    </div>
					    <div title="&nbsp;&nbsp;碎言碎语模块" data-options="iconCls:'icon-check'" style="padding:10px;">   
					        <a class="easyui-linkbutton" 
					        	href="${pageContext.request.contextPath }/sys/saying_listUI.action" 
					        	data-options="iconCls:'icon-check'"
								style="width:90%;margin:5px">&nbsp;碎言碎语信息</a>
					    </div>
					    <div title="&nbsp;&nbsp;友情链接模块" data-options="iconCls:'icon-link'" style="padding:10px;">   
					        <a class="easyui-linkbutton" 
					        	href="${pageContext.request.contextPath }/sys/link_listUI.action" 
					        	data-options="iconCls:'icon-link'"
								style="width:90%;margin:5px">&nbsp;友情链接信息</a>
					    </div>
					    <div title="&nbsp;&nbsp;多说模块" data-options="iconCls:'icon-chat'" style="padding:10px;">   
					        <a class="easyui-linkbutton" 
					        	href="${pageContext.request.contextPath }/sys/comment_listUI.action" 
					        	data-options="iconCls:'icon-comment'"
								style="width:90%;margin:5px">&nbsp;评论信息</a>
					        <a class="easyui-linkbutton" 
					        	href="${pageContext.request.contextPath }/sys/message_listUI.action" 
					        	data-options="iconCls:'icon-message'"
								style="width:90%;margin:5px">&nbsp;留言信息</a>
					    </div>
					    <div title="&nbsp;&nbsp;管理员模块" data-options="iconCls:'icon-github'" style="padding:10px;">   
					        <a class="easyui-linkbutton" 
					        	href="${pageContext.request.contextPath }/sys/admin_info.action" 
					        	data-options="iconCls:'icon-github'"
								style="width:90%;margin:5px">&nbsp;管理员信息</a>
					    </div>
					</div>
				</div>
				<div class="easyui-panel" 
					data-options="region:'center',fit:true"
					style="background-image: url('${pageContext.request.contextPath}/images/head/a.jpg');">
					<img src="${pageContext.request.contextPath }/images/head/a.jpg" width="100%" height="50%">
				</div> 
   	 		</div>