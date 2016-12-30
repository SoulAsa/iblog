<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link href="${pageContext.request.contextPath }/css/index.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="/common/web_header.jsp"></jsp:include>
		<div class="banner">
		  <section class="box">
		    <ul class="texts">
		      <s:property value="admin.signature" escape="false"/>
		    </ul>
		    <div class="avatar">
		    	<a style="background: url('${pageContext.request.contextPath}/<s:property value="admin.iconHead"/>');" href="#">
		    		<span><s:property value="admin.name"/></span>
		    	</a>
		    </div>
		  </section>
		</div>

		<div class="template">
		  <div class="box">
		    <h3>
		      <p><span>个人博客</span>精品</p>
		    </h3>
		    <ul>
	      	  <s:iterator value="articleResult.items" status="st">
	      		<li><a href="/"  target="_blank">
	      			<img src="${pageContext.request.contextPath }/<s:property value="iconCover"/>"></a><span><s:property value="title"/></span>
	      		</li>
	      	  </s:iterator>
		    </ul>
		  </div>
		</div>

		<article>
		  <h2 class="title_tj">
		    <p>文章<span>推荐</span></p>
		  </h2>
		  <div class="bloglist left">
		    <h3>程序员请放下你的技术情节，与你的同伴一起进步</h3>
		    <figure><img src="${pageContext.request.contextPath }/images/001.png"></figure>
		    <ul>
		      <p>如果说掌握一门赖以生计的技术是技术人员要学会的第一课的话， 那么我觉得技术人员要真正学会的第二课，不是技术，而是业务、交流与协作，学会关心其他工作伙伴的工作情况和进展...</p>
		      <a title="/" href="new.html" target="_blank" class="readmore">阅读全文>></a>
		    </ul>
		    <p class="dateview"><span>2013-11-04</span><span>作者：杨青</span><span>个人博客：[<a href="/news/life/">程序人生</a>]</span></p>
		    
		    <s:iterator value="articleResult.items" status="st">
			    <h3><s:property value="title"/></h3>
			    <figure><img src="${pageContext.request.contextPath }/<s:property value="iconCover"/>"></figure>
			    <ul>
			      <p>
	      			<s:if test="content.length() > 150">
	      				<s:property value="content.substring(0,150)" escape="false"/>...
	      			</s:if><s:else>
	      				<s:property value="content" escape="false"/>
	      			</s:else>
			      </p>
			      <a href="${pageContext.request.contextPath }/web/web_article.action?article.artId=<s:property value='artId'/>" 
			      	 target="_blank" class="readmore">阅读全文>></a>
			    </ul>
			    <p class="dateview">
			    	<span><s:date name="createTime" format="yyyy-MM-dd HH:mm"/>
			    	</span><span>作者：<s:property value="admin.name"/></span>
			    	<span>个人博客：[<a href="#"><s:property value="category.cateName"/></a>]</span>
			    	<s:if test="articleTags != null">
			    		<span>
				    		<s:iterator value="articleTags">
					    		<span class="icono-tag"></span><s:property value="id.tag.tagName"/>
				    		</s:iterator>
			    		</span>
			    	</s:if>
			    </p>
		    </s:iterator>
		  </div>
  
		  <aside class="right">
		    <div class="weather"><iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
			<%-- <jsp:include page="/common/web_sort.jsp"></jsp:include> --%>
			<%@ include file="/common/web_sort.jsp"%>
		  </aside>
		</article>
		<jsp:include page="/common/web_footer.jsp"></jsp:include>
	</body>
</html>
