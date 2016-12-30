<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script>
    	window.UEDITOR_HOME_URL = "${pageContext.request.contextPath }/js/ueditor/";
    	var ue = UE.getEditor('editor');
    </script>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：管理员管理&nbsp;>&nbsp;修改管理员信息'" style="padding:20px">
 	 			<form id="frm" 
 	 				method="POST" 
 	 				action="${pageContext.request.contextPath }/sys/admin_edit.action" 
 	 				enctype="multipart/form-data"
 	 				style="margin:10px;">
 	 				
 	 				<div style="margin:10px;">
 	 					<img src="${pageContext.request.contextPath }/<s:property value='admin.iconHead'/>" width="100" height="100"/>
                    	<s:hidden name="admin.iconHead"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>头&nbsp;&nbsp;&nbsp;&nbsp;像：</label>
 	 					<input type="file" name="iconHead" />
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label for="name">网&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
 	 					<s:textfield id="name" name="admin.name"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>个性签名：</label>
 	 					<s:textarea id="signature" name="admin.signature" rows="10" cols="50"/>
 	 				</div>
  	 				<div style="margin:10px;">
 	 					<label>手机号：</label>
 	 					<s:textfield id="phone" name="admin.phone"/>
 	 				</div>
  	 				<div style="margin:10px;">
 	 					<label>生&nbsp;&nbsp;&nbsp;&nbsp;日：</label>
 	 					<s:textfield class="easyui-datebox" id="birthday" name="admin.birthday"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>籍&nbsp;&nbsp;&nbsp;&nbsp;贯：</label>
 	 					<s:textfield id="hometown" name="admin.hometown"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>现&nbsp;&nbsp;&nbsp;&nbsp;居：</label>
 	 					<s:textfield id="city" name="admin.city"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>职&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
 	 					<s:textfield id="work" name="admin.work"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>技&nbsp;&nbsp;&nbsp;&nbsp;能：</label>
 	 					<s:textarea id="skill" name="admin.skill" rows="5" cols="20"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>动&nbsp;&nbsp;&nbsp;&nbsp;漫：</label>
 	 					<s:textfield id="anime" name="admin.anime"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>音&nbsp;&nbsp;&nbsp;&nbsp;乐：</label>
 	 					<s:textfield id="music" name="admin.music"/>
 	 				</div>
  	 				<div style="margin:10px;">
 	 					<!-- ueditor 富文本编辑器 -->
 	 					<label>简&nbsp;&nbsp;&nbsp;&nbsp;历：</label><p>
 	 					<s:textarea id="editor" name="admin.about" cssStyle="width:90%;height:400px;" />
 	 				</div>
 	 				
 	 				<s:hidden name="admin.id.admin"/>
 	 				<s:hidden name="admin.id.pwd"/>
 	 				<div align="center">
 	 					<input type="button" value="返回" onclick="javascript:history.back(-1);"/>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>