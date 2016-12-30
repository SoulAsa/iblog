<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	<%@ taglib uri="/struts-tags" prefix="s" %>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：友情链接管理&nbsp;>&nbsp;修改友情链接'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/sys/link_edit.action" enctype="multipart/form-data">
 	 				<div>
 	 					<label>链接名称：</label>
 	 					<s:textfield id="name" name="link.linkName"/>
 	 				</div>
 	 				<div>
 	 					<label>链接URL：</label>
 	 					<s:textfield id="url" name="link.url"/>
 	 				</div>
 	 				<div>
 	 					<label>链接图标：</label>
 	 					<s:if test="%{link.iconLink != null && link.iconLink != ''}">
                    		<img src="${pageContext.request.contextPath }/<s:property value='link.iconLink'/>" width="100" height="100"/>
                    		<s:hidden name="link.iconLink"/>
                		</s:if>
                		<input type="file" name="iconLink"/>
 	 				</div>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 				<s:hidden name="link.linkId"/>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>