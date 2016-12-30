<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	<jsp:include page="/common/header.jsp"></jsp:include>
	 	<div data-options="region:'center'">
 	 		<table id="dg"></table>
 	 	</div>
	<script type="text/javascript">
		$(function(){
  			$("#dg").datagrid({
  				url : "${pageContext.request.contextPath }/sys/article_list.action",
  				title : "&nbsp;&nbsp;&nbsp;&nbsp;当前位置：文章管理&nbsp;>&nbsp;文章列表",
  				pagination : true,
  				// pagePosition : 'both',
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
  					{field:'artId',title:'编号',width:150,align:'center',sortable : true},
  					{field:'title',title:'标题',width:150,align:'center',sortable : true,
  						// 预览
  						formatter : function(value,rowData){
  							return '<a target="_blank" href="${pageContext.request.contextPath }/sys/article_preview.action?article.artId=' + rowData.artId + '">' + value + '</a>';
  						}
  					},
  					{field:'category',title:'分类名称',width:150,align:'center',sortable : true,
  						// 获取分类名称
  						formatter : function(value){
  							return value.cateName;
  						}
  					},
  					{field:'createTime',title:'创建时间',width:150,align:'center'},
  					{field:'modifyTime',title:'修改时间',width:150,align:'center'},
  					{field:'readCount',title:'阅读量',width:150,align:'center'},
  					{field:'isFlag',title:'是否推荐',width:150,align:'center',
  						// 切换按钮
  						formatter : function(value,row,index){
  							var btnStr = value ? '已推荐' : '未推荐';
  							// return '<a href="${pageContext.request.contextPath }/sys/article_recommend.action?article.artId=' + rowData.artId + '">' + value + '</a>';
							// return '<button onclick="recommend('+row.artId+')">' + btnStr + '</button>';
							return btnStr;
						}
  					}
  				]],
  				toolbar : [
  					{
						iconCls: 'icon-add',
						handler: function(){
							window.location.href = "${pageContext.request.contextPath }/sys/article_addUI.action";
						}
					},
  					{
						iconCls: 'icon-edit',
						handler: function(){
							var selectedRow = $("#dg").datagrid('getSelected');
							window.location.href = "${pageContext.request.contextPath }/sys/article_editUI.action?article.artId="+selectedRow.artId;
						}
					},
  					{
						iconCls: 'icon-remove',
						handler: function(){
							var checkedRow = $("#dg").datagrid('getSelections');
							var selectedList = {};
							for (var i = 0; i < checkedRow.length; i++) {
								selectedList["selectedRows["+i+"]"] = checkedRow[i].artId;
							}
							$.post(
								"${pageContext.request.contextPath }/sys/article_deleteSelected.action",
								selectedList,
								function(returnVal){
									window.location.href = "${pageContext.request.contextPath }/sys/article_listUI.action";
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
  		function recommend(artId){
  			$.ajax({
				url:"${pageContext.request.contextPath }/sys/article_recommend.action",
				data:{
					"article.artId" : artId
				},
				type:"post",
				success:function(returnVal){
					$.ajax({
						url:"${pageContext.request.contextPath }/sys/article_list.action",
						type:"post"
					});
				}
			});
  		}
  	</script>
	<jsp:include page="/common/footer.jsp"></jsp:include>
	
	