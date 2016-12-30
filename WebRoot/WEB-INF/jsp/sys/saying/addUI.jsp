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
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：碎言碎语管理&nbsp;>&nbsp;添加碎言碎语'" style="padding:20px">
 	 			<form id="frm" 
 	 				method="POST" 
 	 				action="${pageContext.request.contextPath }/sys/saying_add.action" 
 	 				enctype="multipart/form-data"
 	 				style="margin:10px;">
 	 				
 	 				<div style="margin:10px;">
 	 					<!-- ueditor 富文本编辑器 -->
 	 					<label>碎言碎语：</label><p>
 	 					<s:textarea id="editor" name="saying.content" cssStyle="width:70%;height:200px;" />
 	 				</div>
 	 				
 	 				<div align="center">
 	 					<input type="button" value="返回" onclick="javascript:history.back(-1);"/>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>