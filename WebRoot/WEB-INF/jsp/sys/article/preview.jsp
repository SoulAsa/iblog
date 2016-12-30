<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link href="${pageContext.request.contextPath }/css/new.css" rel="stylesheet">
	</head>
	<body>
		<article class="blogs">
		  <div class="index_about">
		    <h2 class="c_titile"><s:property value="article.title"/></h2>
		    <p class="box_c"><span class="d_time">发布时间：<s:date name="article.createTime" format="yyyy-MM-dd HH:mm"/></span>
		    	<span onload="">阅读（<s:property value="article.readCount"/>）</span>
		    </p>
		    <ul class="infos">
		    	<s:property value="article.content" escape="false"/>
		    </ul>
		    <div class="keybq">
		    <p><span>关键字词</span>：<s:property value="article.keyword"/></p>
		    </div>
		    
		</article>
	</body>
</html>