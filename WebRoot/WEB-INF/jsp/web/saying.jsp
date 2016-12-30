<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link href="${pageContext.request.contextPath }/css/saying.css" rel="stylesheet">
		<script type="text/javascript">
			var list_url = "${pageContext.request.contextPath }/web/web_saying.action";
		</script>
	</head>
	<body>
		<jsp:include page="/common/web_header.jsp"></jsp:include>
		<div class="moodlist">
		  <h1 class="t_nav"><span>删删写写，回回忆忆，虽无法行云流水，却也可碎言碎语。</span>
		  	<a href="${pageContext.request.contextPath }/web/web_index.action" class="n1">网站首页</a>
		  	<a href="#" class="n2">碎言碎语</a>
		  </h1>
		  <div class="bloglist">
		    <s:iterator value="pageResult.items" status="st">
			    <ul class="arrow_box">
			     <div class="sy">
			     <img src="${pageContext.request.contextPath }/images/001.png">
			      <p><s:property value="content" escape="false"/></p>
			      </div>
			      <span class="dateview"><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></span>
			    </ul>
		    </s:iterator>
		  </div>
		  <jsp:include page="/common/pageNavigator.jsp"></jsp:include>
		  <div class="page"><a title="Total record"><b>41</b></a><b>1</b><a href="/news/s/index_2.html">2</a><a href="/news/s/index_2.html">&gt;</a><a href="/news/s/index_2.html">&gt;&gt;</a></div>
		</div>
		<jsp:include page="/common/web_footer.jsp"></jsp:include>
	</body>
</html>