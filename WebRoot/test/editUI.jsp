<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="top.jsp"></jsp:include>
	<%@ taglib uri="/struts-tags" prefix="s" %>
	 	<div data-options="region:'center'">
	 		<div class="easyui-layout" data-options="fit:true">
 	 		<div data-options="region:'north'" style="height:50px">
 	 			<p>
 	 			&nbsp;&nbsp;&nbsp;&nbsp;当前位置：文章管理&nbsp;>&nbsp;修改分类名称
 	 		</div>
 	 		<div data-options="region:'center'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/category_edit.action">
 	 				<div>
 	 					<label for="name">文章名称</label>
 	 					<s:textfield id="name" name="category.cateName"/>
 	 				</div>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 				<s:hidden name="category.cateId"/>
 	 			</form>
 	 		</div>
 	 	</div>
	<script type="text/javascript">
  	</script>
	<jsp:include page="foot.jsp"></jsp:include>