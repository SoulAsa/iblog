<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	 	<div data-options="region:'center'">
 	 		<table id="dg"></table>
 	 	</div>
	<script type="text/javascript">
		$(function(){
  			$("#dg").datagrid({
  				url : "${pageContext.request.contextPath }/sys/saying_list.action",
  				title : "&nbsp;&nbsp;&nbsp;&nbsp;当前位置：碎言碎语管理&nbsp;>&nbsp;碎言碎语列表",
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
  					{field:'sayId',title:'编号',width:150,align:'center',sortable : true},
  					{field:'content',title:'碎言碎语',width:150,align:'center',sortable : true},
  					{field:'createTime',title:'创建时间',width:150,align:'center'}
  				]],
  				toolbar : [
  					{
						iconCls: 'icon-add',
						handler: function(){
							window.location.href = "${pageContext.request.contextPath }/sys/saying_addUI.action";
						}
					},
  					{
						iconCls: 'icon-remove',
						handler: function(){
							var checkedRow = $("#dg").datagrid('getSelections');
							var selectedList = {};
							for (var i = 0; i < checkedRow.length; i++) {
								selectedList["selectedRows["+i+"]"] = checkedRow[i].sayId;
							}
							$.post(
								"${pageContext.request.contextPath }/sys/saying_deleteSelected.action",
								selectedList,
								function(returnVal){
									window.location.href = "${pageContext.request.contextPath }/sys/saying_listUI.action";
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
  	<script type="text/javascript">
  		function recommend(flag){
  			alert(flag);
  		}
  	</script>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	
	