<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link href="${pageContext.request.contextPath }/css/learn.css" rel="stylesheet">
		<script type="text/javascript">
			var list_url = "${pageContext.request.contextPath }/web/web_more.action";
		</script>
	</head>
	<body>
		<jsp:include page="/common/web_header.jsp"></jsp:include>
		<article class="blogs">
			<h1 class="t_nav"><span>我们长路漫漫，只因学无止境。 </span>
				<a href="${pageContext.request.contextPath }/web/web_index.action" class="n1">网站首页</a>
				<a href="${pageContext.request.contextPath }/web/web_more.action" class="n2">学无止境</a>
			</h1>
			<div class="newblog left">			   
			   <s:iterator value="pageResult.items" status="st">
				   <h2><s:property value="title"/></h2>
				   <p class="dateview"><span>发布时间：<s:date name="createTime" format="yyyy-MM-dd HH:mm"/></span>
				   		<span>作者：<s:property value="admin.name"/></span>
				   		<span>分类：[<a href="#"><s:property value="category.cateName"/></a>]</span>
				   		<s:if test="articleTags != null">
				    		<span>
					    		<s:iterator value="articleTags">
						    		<span class="icono-tag"></span><s:property value="id.tag.tagName"/>
					    		</s:iterator>
				    		</span>
				    	</s:if>
				   </p>
				    <figure><img width="100px" height="100px" src="${pageContext.request.contextPath }/<s:property value="iconCover"/>"></figure>
				    <ul class="nlist">
				      <p>
				      	<s:if test="content.length() > 150">
		      				<s:property value="content.substring(0,150)" escape="false"/>...
		      			</s:if><s:else>
		      				<s:property value="content" escape="false"/>
		      			</s:else>
				      </p>
				      <a href="${pageContext.request.contextPath }/web/web_article.action?article.artId=<s:property value='artId'/>" 
				      	 target="_blank" class="readmore">详细信息>></a>
				    </ul>
				    <div class="line"></div>
				    
				</s:iterator>
			    <div class="blank"></div>
			    <jsp:include page="/common/pageNavigator.jsp"></jsp:include>
			    <div class="page"><a title="Total record"><b>41</b></a><b>1</b><a href="/news/s/index_2.html">2</a><a href="/news/s/index_2.html">&gt;</a><a href="/news/s/index_2.html">&gt;&gt;</a></div>
			</div>
			<aside class="right">
				<div class="rnav">
			      <h2>栏目导航</h2>
			      <ul>
			      	<s:iterator value="categoryResult.items" status="st">
			        	<li>
			        		<a href="${pageContext.request.contextPath }/web/web_more.action?article.category.cateId=<s:property value='cateId'/>">
			        			<s:property value="cateName"/>
			        		</a>
			        	</li>
					</s:iterator>
			     </ul>      
			    </div>
			   <div class="rnavs">
			      <h2>栏目导航</h2>
			      <ul>
			     	<s:iterator value="categoryResult.items" status="st">
			        	<li>
			        		<a href="${pageContext.request.contextPath }/web/web_more.action?article.category.cateId=<s:property value='cateId'/>">
			        			<s:property value="cateName"/>
			        		</a>
			        	</li>
					</s:iterator>
			     </ul>      
			    </div>
			    <%@ include file="/common/web_sort.jsp"%>
	    		<div class="visitors">
	      			<h3><p>所有标签</p></h3>
				      <ul>
						<s:iterator value="tagResult.items" status="st">
			        		<li><a href="#" target="_blank"><span class="icono-tag"></span><s:property value="tagName"/></a></li>
						</s:iterator>
				      </ul>
	    		</div>
			</aside>
		</article>
		<jsp:include page="/common/web_footer.jsp"></jsp:include>
、	</body>
</html>