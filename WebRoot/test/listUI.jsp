<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="top.jsp"></jsp:include>
	 	<div data-options="region:'center'">
	 		<div class="easyui-layout" data-options="fit:true">
 	 		<div data-options="region:'north'" style="height:50px">
 	 			<p>
 	 			&nbsp;&nbsp;&nbsp;&nbsp;当前位置：文章管理&nbsp;>&nbsp;文章列表
 	 		</div>
 	 		<div data-options="region:'center'">
 	 			<table id="dg"></table>
 	 		</div>
 	 	</div>
	<script type="text/javascript">
		$(function(){
  			$("#dg").datagrid({
  				url : "${pageContext.request.contextPath }/category_listUI.action",
  				title : "分类列表",
  				pagination : true,
  				resizable : true,
  				selectOnCheck : true,
  				checkOnSelect : true,
  				singleSelect : true,
  				fit : true,
  				fitColumns : true,
  				rownumbers : true,
  				columns : [[
  					{field:'selectedRow',checkbox:true,width:50},
  					{field:'cateId',title:'编号',width:150,align:'center',sortable : true},
  					{field:'cateName',title:'分类名称',width:150,align:'left',halign:'center'}
  				]],
  				toolbar : [
  					{
						iconCls: 'icon-add',
						handler: function(){
							window.location.href = "${pageContext.request.contextPath }/category_addUI.action";
						}
					},
  					{
						iconCls: 'icon-edit',
						handler: function(){
							var selectedRow = $("#dg").datagrid('getSelected');
							window.location.href = "${pageContext.request.contextPath }/category_editUI.action?category.cateId="+selectedRow.cateId;
							/* $.get(
								"${pageContext.request.contextPath }/category_editUI.action",
								{
									"category.cateId" : selectedRow.cateId
								},
								function(returnVal){
									// window.location.href = "${pageContext.request.contextPath }/listUI.jsp";
								}
							); */
						}
					},
  					{
						iconCls: 'icon-remove',
						handler: function(){
							var checkedRow = $("#dg").datagrid('getSelections');
							var selectedList = {};
							for (var i = 0; i < checkedRow.length; i++) {
								selectedList["selectedRows["+i+"]"] = checkedRow[i].cateId;
							}
							$.post(
								"${pageContext.request.contextPath }/category_deleteSelected.action",
								selectedList,
								function(returnVal){
									window.location.href = "${pageContext.request.contextPath }/listUI.jsp";
								}
							);
						}
					},
					{
						iconCls: 'icon-help',
						handler: function(){alert('帮助按钮')}
					}
  				]
  			});
  			/* var pager = $("#dg").datagrid("getPager");
			$(pager).pagination({
				displayMsg : 'Displaying {from} to {to} of {total} items'
			}); */
  		});
  	</script>
	<jsp:include page="foot.jsp"></jsp:include>