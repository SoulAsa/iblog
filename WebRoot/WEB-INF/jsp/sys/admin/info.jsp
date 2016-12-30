<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
 	 		<div data-options="region:'center'">
 	 			<div class="easyui-panel" data-options="title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：管理员管理&nbsp;>&nbsp;管理员信息',
 	 													fit:true,
 	 													tools:[{
 	 														iconCls:'icon-edit',
															handler:function(){
																location.href = '${pageContext.request.contextPath }/sys/admin_editUI.action';
															}
 	 													}]">
 	 				<p>网名：<span><s:property value="admin.name"/></span> | 即步非烟</p>
					<p>姓名：<s:property value="admin.name"/></p>
					<p>生日：<s:date name="admin.birthday" format="yyyy-MM-dd"/></p>
					<p>籍贯：<s:property value="admin.hometown"/></p>
					<p>现居：<s:property value="admin.city"/></p>
					<p>职业：<s:property value="admin.work"/></p>
					<p>喜欢的动漫：<s:property value="admin.anime"/></p>
					<p>喜欢的音乐：<s:property value="admin.music"/></p>
 	 			</div>
 	 		</div>
 	<jsp:include page="/common/footer.jsp"></jsp:include>
	
	