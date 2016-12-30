<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	 	<div data-options="region:'center'">
 	 		<table id="dg"></table>
 	 	</div>
	<script type="text/javascript">
		$(function(){
  			$("#dg").datagrid({
  				url : "${pageContext.request.contextPath }/sys/comment_list.action",
  				title : "&nbsp;&nbsp;&nbsp;&nbsp;当前位置：评论管理&nbsp;>&nbsp;评论列表",
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
  					{field:'content',title:'评论内容',width:150,align:'center'},
  					{field:'commentTime',title:'评论时间',width:150,align:'center'},
  					{field:'commentId',title:'操作',width:150,align:'center',
  						// 回复评论
  						formatter : function(value,rowData){
  							return '<a href="${pageContext.request.contextPath }/sys/comment_replyUI.action?comment.comment.commentId=' + rowData.commentId + '&comment.article.artId=' + rowData.article.artId + '">回复</a>';
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
								selectedList["selectedRows["+i+"]"] = checkedRow[i].commentId;
							}
							$.post(
								"${pageContext.request.contextPath }/sys/comment_deleteSelected.action",
								selectedList,
								function(returnVal){
									window.location.href = "${pageContext.request.contextPath }/sys/comment_listUI.action";
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
	
	