<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	
</script>
<div class="news">
    <h3><p>最新<span>文章</span></p></h3>
    <ul class="rank">
    	<s:iterator value="newArticleResult.items" status="st">
      		<li><a href="#" target="_blank"><s:property value="title"/></a></li>
    	</s:iterator>
    </ul>
    
    <h3 class="ph"><p>点击<span>排行</span></p></h3>
    <ul class="paih">
    	<s:iterator value="topArticleResult.items" status="st">
      		<li><a href="#" target="_blank"><s:property value="title"/></a></li>
      	</s:iterator>
    </ul>
    
    <h3 class="links"><p>友情<span>链接</span></p></h3>
    <div class="website" style="margin:10px;">
    	<s:iterator value="linkResult.items" status="st">
	        <span><a href="<s:property value='url'/>" style="">
	      		<%-- <img alt="<s:property value='linkName'/>" 
	      			src="${pageContext.request.contextPath }/<s:property value='iconLink'/>" 
	      			style="width:30px; height:24px;" /> --%>
	      		<%-- <button style="width:48px;height:48px;background: url('${pageContext.request.contextPath }/<s:property value="iconLink"/>');"></button> --%>
	      		<span class="icono-chain"></span><s:property value="linkName"/>
	      	</a></span>
	      	&nbsp;
      	</s:iterator>
    </div> 
</div>
