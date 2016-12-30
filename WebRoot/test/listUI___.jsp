<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    
	<script type="text/javascript">
	    //全选、全反选
		function doSelectAll(){
			// jquery 1.6 前
			//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
			//prop jquery 1.6+建议使用
			$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));		
		}
		// 新增
		function doAdd(){
			document.forms[0].action = "${pageContext.request.contextPath }/article/category_addUI.action";
			document.forms[0].submit();
		}
		// 编辑
		function doEdit(cateId){
			document.forms[0].action = "${pageContext.request.contextPath }/article/category_editUI.action?category.cateId=" + cateId;
			document.forms[0].submit();
		}
		// 删除
		function doDelete(cateId){
			document.forms[0].action = "${pageContext.request.contextPath }/article/category_delete.action?category.cateId=" + cateId;
			document.forms[0].submit();
		}
		// 批量删除
		function doDeleteAll(){
			document.forms[0].action = "${pageContext.request.contextPath }/article/category_deleteSelected.action";
			document.forms[0].submit();
		}
	</script>
	<script type="text/javascript">
		$(function(){
			$("#dg").datagrid({
				url : "${pageContext.request.contextPath}/article/category_listUI.action?time="+new Date().getTime(),
				columns:[[
			        {field:'category.cateId',title:'编号',width:100},
			        {field:'category.cateName',title:'分类名称',width:100}
			    ]],
			    singleSelect : true,
			    pagination : true
			});
		});
	</script>
  </head>
  <body>
  	<br/>
  	<br/>
  	<form name="form1" action="" method="POST">
	    <div class="p_d_1">
	        <div class="p_d_1_1">
	            <div class="content_info">
	                <div class="c_crumbs"><div><b></b><strong>分类管理</strong></div> </div>
	                <div class="search_art">
	                    <li style="float:right;">
	                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
	                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
	                    </li>
	                </div>
	
	                <div class="t_list" style="margin:0px; border:0px none;">
	                    <table id="dg">
	                    </table>
	                </div>
	            </div>
	        <%-- <jsp:include page="/common/pageNavigator.jsp"></jsp:include> --%>
	        </div>
	    </div>
	</form>
  </body>
</html>
