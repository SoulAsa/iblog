<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!doctype html>
<html>
	<head>
		<jsp:include page="/common/web_head.jsp"></jsp:include>
		<link href="${pageContext.request.contextPath }/css/about.css" rel="stylesheet">
		<!-- <link href='http://fonts.googleapis.com/css?family=Architects+Daughter' rel='stylesheet' type='text/css'> -->
	</head>
	<body>
		<jsp:include page="/common/web_header.jsp"></jsp:include>
		<article class="aboutcon">
			<h1 class="t_nav"><span>像“草根”一样，紧贴着地面，低调的存在，冬去春来，枯荣无恙。</span>
			<a href="${pageContext.request.contextPath }/web/web_index.action" class="n1">网站首页</a>
			<a href="${pageContext.request.contextPath }/web/web_about.action" class="n2">关于我</a></h1>
			<div class="about left">
			  <h2>Just about me</h2>
			    <ul> 
				    <p>杨青，女，一个80后草根女站长！09年入行，从业已经有三四年。从搬砖一样的生活方式换成了现在有“单”而居的日子。当然这个单不是单身的单，跟我的职业相比，爱情脱单并不是问题！虽然极尽苛刻的征婚条件但也远不及客户千奇百怪的要求。告别了朝九晚五，躲过了风吹日晒，虽然不再有阶梯式的工资，但是偶尔可以给自己放放假，挽着老公，一起轻装旅行。</p>
					<p>
					人生就是一个得与失的过程，而我却是一个幸运者，失去的永远比得到的多。生活的压力迫使我放弃了轻松的前台接待，放弃了体面的编辑，换来虽有些蓬头垢面的工作，但是我仍然很享受那些熬得只剩下黑眼圈的日子，因为我在学习使用Photoshop、Flash、Dreamweaver、ASP、PHP、JSP...中激发了兴趣，然后越走越远....</p>
					<p>在这条路上，我要感谢三个人，第一个是我从事编辑的老板，是他给了我充分学习研究div的时间，第二个人是我的老师，如果不是街上的一次偶遇，如果不是因为我正缺钱，我不会去强迫自己做不会的事情，但是金钱的诱惑实在是抵挡不了，于是我选择了“接招”，东拼西凑的把一个网站做好了，当时还堪称佳作的网站至今已尘归尘土归土了。第三个人，我总说他是我的伯乐，因为我当初应聘技术员的时候，我说我什么都不会，但是他却给了我机会，而我就牢牢的把握了那次机会，直到现在如果不是我主动把域名和空间转出来，我会一直霸占着公司资源，免费下去（可我就偏偏不是喜欢爱占便宜的人，总感觉欠了就得还）...</p>
					<p>
					还要特别感谢一个人，是我的老公。他是我的百科，我不会的，他会，最后我还是不会。博客能做到今天这样，一半都有他的功劳。他不仅仅支持我的事业作为我有力的经济后盾，还毫无怨言的包容我所有工作、生活当中有理无理的坏脾气，曾经我是多么有自己原则的一个人，但是遇到他，打破了我自己毕生坚持的原则，喜欢一句话“冥冥中该来则来，无处可逃”。
					</p>
			    </ul>
			    <h2>About my blog</h2>
			    <p>程  序：Java MySQL</p>
			</div>
			<aside class="right">
				<jsp:include page="/common/web_info.jsp"></jsp:include>
			</aside>
		</article>
		<jsp:include page="/common/web_footer.jsp"></jsp:include>
	</body>
</html>