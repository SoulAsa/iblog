<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	<%@ taglib uri="/struts-tags" prefix="s" %>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：标签管理&nbsp;>&nbsp;修改标签'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/sys/tag_edit.action">
 	 				<div>
 	 					<label for="name">标签名称：</label>
 	 					<s:textfield id="name" name="tag.tagName"/>
 	 				</div>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 				<s:hidden name="tag.tagId"/>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>