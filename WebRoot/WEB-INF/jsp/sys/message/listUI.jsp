<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	 	<div data-options="region:'center'">
 	 		<table id="dg"></table>
 	 	</div>
	<script type="text/javascript">
		$(function(){
  			$("#dg").datagrid({
  				url : "${pageContext.request.contextPath }/sys/message_list.action",
  				title : "&nbsp;&nbsp;&nbsp;&nbsp;当前位置：多说管理&nbsp;>&nbsp;留言列表",
  				pagination : true,
  				resizable : true,
  				selectOnCheck : true,
  				checkOnSelect : true,
  				singleSelect : true,
  				fit : true,
  				fitColumns : true,
  				rownumbers : true,
  				nowrap : true, // 多行数据 --> 一行显示
  				columns : [[
  					{field:'selectedRow',checkbox:true,width:50},
  					{field:'userName',title:'用户名',width:150,align:'center',sortable : true},
  					{field:'email',title:'电子邮箱',width:150,align:'center',sortable : true},
  					{field:'content',title:'留言内容',width:150,align:'center'},
  					{field:'messageTime',title:'留言时间',width:150,align:'center'},
  					{field:'messageId',title:'操作',width:150,align:'center',
  						// 预览
  						formatter : function(value,rowData){
  							return '<a href="${pageContext.request.contextPath }/sys/message_replyUI.action?message.message.messageId=' + rowData.messageId + '">回复</a>';
  						}
  					}
  				]],
  				toolbar : [
  					{
						iconCls: 'icon-remove',
						handler: function(){
							var checkedRow = $("#dg").datagrid('getSelections');
							var selectedList = {};
							for (var i = 0; i < checkedRow.length; i++) {
								selectedList["selectedRows["+i+"]"] = checkedRow[i].messageId;
							}
							$.post(
								"${pageContext.request.contextPath }/sys/message_deleteSelected.action",
								selectedList,
								function(returnVal){
									window.location.href = "${pageContext.request.contextPath }/sys/message_listUI.action";
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
	
	