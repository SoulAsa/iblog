<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="top.jsp"></jsp:include>
	 	<div data-options="region:'center'">
	 		<div class="easyui-layout" data-options="fit:true">
 	 		<div data-options="region:'north'" style="height:50px">
 	 			<p>
 	 			&nbsp;&nbsp;&nbsp;&nbsp;当前位置：文章管理&nbsp;>&nbsp;添加分类名称
 	 		</div>
 	 		<div data-options="region:'center'">
 	 			<form id="frm" method="POST" action="${pageContext.request.contextPath }/category_add.action">
 	 				<div>
 	 					<label for="name">文章名称</label>
 	 					<input class="easyui-validatebox" type="text" name="category.cateName" data-options="required:true" />
 	 				</div>
 	 				<div>
 	 					<input type="submit" value="提交" />
 	 				</div>
 	 			</form>
 	 		</div>
 	 	</div>
	<script type="text/javascript">
  		/* $("#frm").form('submit',{
  			url : "${pageContext.request.contextPath }/category_add.action?time="+new Date().getTime(),
  		}); */
  	</script>
	<jsp:include page="foot.jsp"></jsp:include>