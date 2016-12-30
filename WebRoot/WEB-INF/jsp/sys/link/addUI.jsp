<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：友情链接管理&nbsp;>&nbsp;添加友情链接'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/sys/link_add.action" enctype="multipart/form-data">
 	 				<div>
 	 					<label for="name">链接名称：</label>
 	 					<input class="easyui-validatebox" type="text" name="link.linkName" data-options="required:true" />
 	 				</div>
 	 				<div>
 	 					<label>链接URL：</label>
 	 					<input type="text" name="link.url" />
 	 				</div>
 	 				<div>
 	 					<label>链接图标：</label>
 	 					<input type="file" name="iconLink" />
 	 				</div>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>