<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	 	<div data-options="region:'center'">
 	 		<table id="dg"></table>
 	 	</div>
	<script type="text/javascript">
		$(function(){
  			$("#dg").datagrid({
  				url : "${pageContext.request.contextPath }/sys/tag_list.action",
  				title : "&nbsp;&nbsp;&nbsp;&nbsp;当前位置：标签管理&nbsp;>&nbsp;标签列表",
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
  					{field:'tagId',title:'编号',width:150,align:'center',sortable : true},
  					{field:'tagName',title:'标签名称',width:150,align:'left',halign:'center'}
  				]],
  				toolbar : [
  					{
						iconCls: 'icon-add',
						handler: function(){
							window.location.href = "${pageContext.request.contextPath }/sys/tag_addUI.action";
						}
					},
  					{
						iconCls: 'icon-edit',
						handler: function(){
							var selectedRow = $("#dg").datagrid('getSelected');
							window.location.href = "${pageContext.request.contextPath }/sys/tag_editUI.action?tag.tagId="+selectedRow.tagId;
						}
					},
  					{
						iconCls: 'icon-remove',
						handler: function(){
							var checkedRow = $("#dg").datagrid('getSelections');
							var selectedList = {};
							for (var i = 0; i < checkedRow.length; i++) {
								selectedList["selectedRows["+i+"]"] = checkedRow[i].tagId;
							}
							$.post(
								"${pageContext.request.contextPath }/sys/tag_deleteSelected.action",
								selectedList,
								function(returnVal){
									window.location.href = "${pageContext.request.contextPath }/sys/tag_listUI.action";
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
  		});
  	</script>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	
	