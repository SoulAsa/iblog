<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<jsp:include page="/common/web_head.jsp"></jsp:include>
	<body>
		<jsp:include page="/common/web_header.jsp"></jsp:include>
		<div class="banner">
		  <section class="box">
		    <ul class="texts">
		      <p>打了死结的青春，捆死一颗苍白绝望的灵魂。</p>
		      <p>为自己掘一个坟墓来葬心，红尘一梦，不再追寻。</p>
		      <p>加了锁的青春，不会再因谁而推开心门。</p>
		    </ul>
		    <div class="avatar"><a href="#"><span>SoulAsa</span></a></div>
		  </section>
		</div>

		<div class="template">
		  <div class="box">
		    <h3>
		      <p><span>个人博客</span>精品</p>
		    </h3>
		    <ul>
		      <li><a href="/" target="_blank"><img src="images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span></li>
		      <li><a href="/"  target="_blank"><img src="images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span></li>
		      <li><a href="/" target="_blank"><img src="images/04.jpg"></a><span>女生清新个人博客网站模板</span></li>
		      <li><a href="/"  target="_blank"><img src="images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span></li>
		      <li><a href="/"  target="_blank"><img src="images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span></li>
	      	  <s:iterator value="pageResult.items" status="st">
	      		<li><a href="/"  target="_blank">
	      			<img src="images/article/<s:property value="iconCover"/>"></a><span><s:property value="title"/></span>
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
		    <figure><img src="images/001.png"></figure>
		    <ul>
		      <p>如果说掌握一门赖以生计的技术是技术人员要学会的第一课的话， 那么我觉得技术人员要真正学会的第二课，不是技术，而是业务、交流与协作，学会关心其他工作伙伴的工作情况和进展...</p>
		      <a title="/" href="new.html" target="_blank" class="readmore">阅读全文>></a>
		    </ul>
		    <p class="dateview"><span>2013-11-04</span><span>作者：杨青</span><span>个人博客：[<a href="/news/life/">程序人生</a>]</span></p>
		    <h3>程序员请放下你的技术情节，与你的同伴一起进步</h3>
		    <figure><img src="images/001.png"></figure>
		    <ul>
		      <p>如果说掌握一门赖以生计的技术是技术人员要学会的第一课的话， 那么我觉得技术人员要真正学会的第二课，不是技术，而是业务、交流与协作，学会关心其他工作伙伴的工作情况和进展...</p>
		      <a title="/" href="/" target="_blank" class="readmore">阅读全文>></a>
		    </ul>
		    <p class="dateview"><span>2013-11-04</span><span>作者：杨青</span><span>个人博客：[<a href="/news/life/">程序人生</a>]</span></p>
		  </div>
  
		  <aside class="right">
		    <div class="weather"><iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
			<jsp:include page="/common/web_sort.jsp"></jsp:include>
		  </aside>
		</article>
		<jsp:include page="/common/web_footer.jsp"></jsp:include>
	</body>
</html>
