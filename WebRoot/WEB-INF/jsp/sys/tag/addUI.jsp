<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：标签管理&nbsp;>&nbsp;添加标签'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/sys/tag_add.action">
 	 				<div>
 	 					<label for="name">标签名称：</label>
 	 					<input class="easyui-validatebox" type="text" name="tag.tagName" data-options="required:true" />
 	 				</div>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>