<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：留言管理&nbsp;>&nbsp;回复留言'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/sys/message_reply.action">
 	 				<div>
 	 					<label for="name">回复留言：</label>
 	 					<p>
 	 					<textarea rows="10" cols="100" name="message.content" class="easyui-validatebox" data-options="required:true"></textarea>
 	 				</div>
 	 				<s:hidden name="message.message.messageId"/>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>