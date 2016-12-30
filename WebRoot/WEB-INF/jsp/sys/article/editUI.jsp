<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath }/js/ueditor/lang/zh-cn/zh-cn.js"></script>
	<script>
    	window.UEDITOR_HOME_URL = "${pageContext.request.contextPath }/js/ueditor/";
    	var ue = UE.getEditor('editor');
    </script>
 	 		<div data-options="region:'center',title:'&nbsp;&nbsp;&nbsp;&nbsp;当前位置：友情链接管理&nbsp;>&nbsp;修改友情链接'">
 	 			<form id="frm" 
 	 				method="POST" 
 	 				action="${pageContext.request.contextPath }/sys/article_edit.action" 
 	 				enctype="multipart/form-data"
 	 				style="margin:10px;">
 	 				
 	 				<div style="margin:10px;">
 	 					<label for="name">分&nbsp;&nbsp;&nbsp;&nbsp;类：</label>
 	 					<s:select class="easyui-combobox" data-options="required:true"
 	 						name="article.category.cateId" 
 	 						list="%{cateList}"
 	 						listKey="cateId"
 	 						listValue="cateName"
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
 	 					<s:textfield name="article.title" cssStyle="width:30%" class="easyui-validatebox" data-options="required:true"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label for="name">关键字：</label>
 	 					<s:textfield name="article.keyword" cssStyle="width:50%"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label for="name">是否推荐：</label>
 	 					<s:radio list="#{'true':'推荐','false':'不推荐'}" name="article.isFlag" value="article.isFlag"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>封面图片：</label>
                    	<input type="file" name="iconCover" />
                		<s:if test="%{article.iconCover != null && article.iconCover != ''}">
                    		<img src="${pageContext.request.contextPath }/<s:property value='article.iconCover'/>" width="100" height="100"/>
                    		<s:hidden name="article.iconCover"></s:hidden>
               			</s:if>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>创建时间：</label>
 	 					<s:date name="article.createTime" format="yyyy-MM-dd HH:mm"/>
             			<s:hidden name="article.createTime"/>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>修改时间：</label>
                		<s:if test="%{article.modifyTime != null}">
                    		<s:date name="article.modifyTime" format="yyyy-MM-dd HH:mm"/>
                    		<s:hidden name="article.modifyTime"/>
               			</s:if>
 	 				</div>
 	 				<div style="margin:10px;">
 	 					<label>文章内容：</label><p>
 	 					<s:textarea id="editor" name="article.content" cssStyle="width:90%;height:400px;" />
 	 				</div>
 	 				<div align="center">
 	 					<input type="button" value="返回" onclick="javascript:history.back(-1);"/>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 				<s:hidden name="article.artId"/>
 	 				<s:hidden name="article.readCount"/>
 	 			</form>
 	 		</div>
	<script type="text/javascript">
  	</script>
	<jsp:include page="/common/footer.jsp"></jsp:include>