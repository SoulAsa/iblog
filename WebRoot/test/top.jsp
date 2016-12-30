<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
	<!-- 引入css文件 -->
    <link rel="stylesheet" href="themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="themes/icon.css" type="text/css"></link>
    <link rel="stylesheet" href="css/style.css" type="text/css"></link>
	<!-- 引入js文件 -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body class="easyui-layout">
   	 <div data-options="region:'north'" style="height:69px">
   	 	<div class="nav-top">
	   	 	<span>个人后台管理系统</span>
		    <div class="nav-topright">
		    	<p>上次登陆时间：2015-04-15 22:33:50   登陆IP：192.168.1.1</p>
		        <span>您好：管理员</span><span>注销</span>
		    </div>
	    </div>
   	 </div>
   	 <div data-options="region:'center'">
   	 	<div class="easyui-layout" data-options="fit:true">
   	 		<div data-options="region:'west'" style="width:300px">
   	 			<div data-options="region:'north'" style="height:300px">
	   	 			<div id="aa" class="easyui-accordion" data-options="fit:true">   
					    <div title="文章模块" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px">
					   		<a class="easyui-linkbutton" href="list.jsp" data-options="iconCls:'icon-search',width:200">easyui</a>  
							<a class="easyui-linkbutton" href="listUI.jsp" data-options="iconCls:'icon-save',width:200">easyui</a>
					    </div>   
					    <div title="碎言碎语模块" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">   
					        content2    
					    </div>   
					    <div title="友情链接模块">   
					        content3    
					    </div>   
					</div>
				</div>
				<div class="easyui-panel" title="个人信息" data-options="region:'center',fit:true">
				</div> 
   	 		</div>