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
	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：文章管理&nbsp;>&nbsp;添加文章'" style="padding:20px">
 	 			<form id="frm" 
 	 				method="POST" 
 	 				action="${pageContext.request.contextPath }/sys/article_add.action" 
 	 				enctype="multipart/form-data"
 	 				style="margin:10px;">
 	 				
 	 				<div style="margin:10px;">
 	 					<!-- select -->
 	 					<label for="name">分&nbsp;&nbsp;&nbsp;&nbsp;类：</label>
 	 					<s:select class="easyui-combobox" data-options="required:true"
 	 						name="article.category.cateId"
 	 						list="%{cateList}"
 	 						listKey="cateId"
 	 						listValue="cateName"
 	 						headerKey=""
 	 						headerValue=""
 	 					/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>标&nbsp;&nbsp;&nbsp;&nbsp;签：</label>
 	 					<s:checkboxlist list="%{tagList}" 
 	 						name="articleTagIds" 
 	 						listKey="tagId" 
 	 						listValue="tagName"></s:checkboxlist>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label for="name">标&nbsp;&nbsp;&nbsp;&nbsp;题：</label>
 	 					<input class="easyui-validatebox" type="text" name="article.title" data-options="required:true" style="width:30%"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label for="name">关键字：</label>
 	 					<input class="easyui-validatebox" type="text" name="article.keyword" style="width:50%"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<!-- radio button -->
 	 					<label for="name">是否推荐：</label>
 	 					<s:radio list="#{'true':'推荐','false':'不推荐'}" name="article.isFlag" value="false"/>
 	 					<!-- <input type="radio" name="article.isFlag" value="true"/>推荐
 	 					<input type="radio" name="article.isFlag" value="false"/>不推荐 -->
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>封面图片：</label>
 	 					<input type="file" name="iconCover" />
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>创建时间：</label>
 	 					<s:date name="article.createTime" format="yyyy-MM-dd HH:mm"/>
             			<s:hidden name="article.createTime"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<!-- ueditor 富文本编辑器 -->
 	 					<label>文章内容：</label><p>
 	 					<s:textarea id="editor" name="article.content" cssStyle="width:90%;height:400px;" />
 	 				</div>
 	 				
 	 				<div align="center">
 	 					<input type="button" value="返回" onclick="javascript:history.back(-1);"/>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 			</form>
 	 		</div>
	<jsp:include page="/common/footer.jsp"></jsp:include>