<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	 	<div data-options="region:'center'">
 	 		<table id="dg"></table>
 	 	</div>
	<script type="text/javascript">
		$(function(){
  			$("#dg").datagrid({
  				url : "${pageContext.request.contextPath }/sys/link_list.action",
  				title : "&nbsp;&nbsp;&nbsp;&nbsp;当前位置：友情链接管理&nbsp;>&nbsp;友情链接列表",
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
  					{field:'linkId',title:'编号',width:150,align:'center',sortable : true},
  					{field:'linkName',title:'链接名称',width:150,align:'center',sortable : true},
  					{field:'url',title:'链接URL',width:150,align:'center'},
  					{field:'iconLink',title:'链接图标',width:150,align:'center',
  						formatter : function(value,row,index){
							return '<img src="${pageContext.request.contextPath }/'+value+'"/>';
						}
  					}
  				]],
  				toolbar : [
  					{
						iconCls: 'icon-add',
						handler: function(){
							window.location.href = "${pageContext.request.contextPath }/sys/link_addUI.action";
						}
					},
  					{
						iconCls: 'icon-edit',
						handler: function(){
							var selectedRow = $("#dg").datagrid('getSelected');
							window.location.href = "${pageContext.request.contextPath }/sys/link_editUI.action?link.linkId="+selectedRow.linkId;
						}
					},
  					{
						iconCls: 'icon-remove',
						handler: function(){
							var checkedRow = $("#dg").datagrid('getSelections');
							var selectedList = {};
							for (var i = 0; i < checkedRow.length; i++) {
								selectedList["selectedRows["+i+"]"] = checkedRow[i].linkId;
							}
							$.post(
								"${pageContext.request.contextPath }/sys/link_deleteSelected.action",
								selectedList,
								function(returnVal){
									window.location.href = "${pageContext.request.contextPath }/sys/link_listUI.action";
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
	
	