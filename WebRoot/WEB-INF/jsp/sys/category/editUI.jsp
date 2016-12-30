<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	<%@ taglib uri="/struts-tags" prefix="s" %>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：分类管理&nbsp;>&nbsp;修改分类'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/sys/category_edit.action">
 	 				<div>
 	 					<label for="name">分类名称：</label>
 	 					<s:textfield id="name" name="category.cateName"/>
 	 				</div>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 				<s:hidden name="category.cateId"/>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>