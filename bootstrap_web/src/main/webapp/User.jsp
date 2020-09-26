<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020-09-18
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet"  href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrap-table.css" />
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-table.js"></script>
    <script type="text/javascript" src="js/bootstrap-table-zh-CN.js"></script>
    <style type="text/css">
        /*解决设置表头列宽无效*/
        #table{
            table-layout: fixed;
        }
        /*给表格边框加颜色*/
        table,table tr th, table tr td {
            border:1px solid #fac090;
        }
        .table-hover > tbody > tr:hover {
            background-color: yellow;
        }
    </style>
</head>
<body>
<%--    <div style="float: left">--%>
<%--        <a class="btn btn-primary btn-sm" style="background-color: cornflowerblue;">添加用户</a>--%>
<%--    </div>--%>

<div class="container">
    <div class="page-header">
        <h1>用户信息</h1>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            查询条件
        </div>
        <div class="panel-body form-group" style="margin-bottom:0px;">
            <div class="input-group col-md-3" style="float: left">
                <span class="input-group-addon">用户名:</span>
                <input type="text" class="form-control" name="username" id="username"  placeholder="请输入用户名"/>
                <div class="input-group-btn">
                    <input class="btn btn-primary" type="button" id="btn_User" value="查询" />
                </div>
            </div>
        </div>
    </div>
        <table id="User_table" class="table table-hover"></table>
</div>
<div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
    <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#addUser">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
    <button id="btn_edit" type="button" class="btn btn-default" style=" border-radius: 0">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
    </button>
    <button id="btn_delete" type="button" class="btn btn-default" style="">
        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
    </button>
</div>
<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabel">
                    添加员工
                </h4>
            </div>
            <div class="modal-body">
                        <form class="form-horizontal">
                                <div class="form-group" style="margin-top: 30px">
                                    <label class="col-sm-3  control-label" for="add_username" style="margin-left: 30px">账号：</label>
                                    <div class="col-sm-6">
                                        <input class="form-control input-sm" type="text" name="username" id="add_username" />
                                    </div>

                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="add_pwd" style="margin-left: 30px">密码：</label>
                                    <div class="col-sm-6">
                                        <input class="form-control input-sm" type="password" name="pwd" id="add_pwd" />
                                    </div>
                                </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="add_uname" style="margin-left: 30px">用户名：</label>
                                <div class="col-sm-6">
                                    <input class="form-control input-sm" type="text" name="uname" id="add_uname" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label" for="add_age" style="margin-left: 30px">年龄：</label>
                                <div class="col-sm-6">
                                    <input class="form-control input-sm" type="text" name="age" id="add_age" />
                                </div>
                            </div>
                                <br>
                        </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="add_btn">添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog --></div>
<div>

</div>
</body>
<script type="text/javascript">
    $(function(){
        var table={
            url:'selUser.action',
            method:'post',
            dataType:'json',
            toolbar: '#toolbar',
            clickToSelect: true,//是否启用点击选中行
            toolbarAlign:'left',//工具栏对齐方式
            buttonsAlign:'right',//按钮对齐方式
            pageNumber: 1, //初始化加载第一页
            pagination:true,//是否分页
            pageSize:1,//单页记录数
            pageList:[1,10,20,30],//可选择单页记录数
            queryParams : function (params) {//上传服务器的参数
                var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
                    limit : params.limit, // 每页显示数量
                    offset : params.offset, // SQL语句起始索引
                    uname:$('#username').val()
                };
                return temp;
            },
            // toolbar:'#table',
            showRefresh:true,
            columns: [
                {
                    checkbox:true //每一行前面是否开启checkbox
                },
                {
                    field: 'id',
                    title: 'ID',
                    align:'center',
                    width:'100px'
                },
                {
                    field: 'username',
                    title: '账号',
                    // valign:'middle',
                    align:'center',
                    // visible:true,  //隐藏
                    width:'100px', //解决设置表头列宽无效样式后 这里的width才会生效
                    //colspan:2,
                    //设置列样式
                    /*cellStyle:{
                        css:{"background-color":"#fac090"}
                    }*/
                },
                {
                    field: 'uname',
                    title: '用户名',
                    align:'center',
                    width:'100px'
                },
                {
                    field: 'age',
                    title: '年龄',
                    align:'center',
                    width:'100px'
                }
            ],
            rowStyle: function (row, index) {
                //根据获取id来判断是否删除了 来显示删除线样式
                if (row.id == "2"){
                    //设置为删除样式 根据自己的项目需求来
                    return {css:{"text-decoration":"line-through","color":"yellow"}}
                }else{
                    return {css:{"background-color":"white"}}
                }
        }}

        $('#User_table').bootstrapTable(table);
    })

    $('#btn_User').click(function () {
        $('#User_table').bootstrapTable('refresh')
    })

    $('#btn_delete').click(function () {
        var a = $('#User_table').bootstrapTable('getSelections');
        if(a.length==1){
            $.post("delUser.action",{"id":a[0].id},function (data) {
                alert(data);
                $('#User_table').bootstrapTable('refresh');
            },"text");
        }else{
            alert("请选中一行")
        }
    })

    $('#add_btn').click(function () {
        $('#addUser')[0].reset();
        var a = {
            username:$('#add_username').val(),
            pwd:$('#add_pwd').val(),
            uname:$('#add_uname').val(),
            age:$('#add_age').val()
        }

        $.post("addUser.action",a,function (data) {
                alert(data);
                $('#addUser').modal('hide');
                // $('#add_username').val("");
                // $('#add_pwd').val("");
                // $('#add_uname').val("");
                // $('#add_age').val("");
                $('#User_table').bootstrapTable('refresh');
        },"text");

    })
</script>
</html>
