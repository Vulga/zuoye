<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: zhangchao
  Date: 2020/1/7
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        $(function () {
            lookUserAll();
        })

        function lookUserAll() {
            $("#lookUserAll").bootstrapTable("destroy");
            $("#lookUserAll").bootstrapTable({
                url: "${pageContext.request.contextPath}/findAllUser",
                method: "POST",
                contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                pagination: true,/*开启分页*/
                sidePagination: "client",/*启用客户端分页*/
                pageNumber: 1,/*默认第一页*/
                pageSize: 5,/*每页5条*/
                pageList: [3, 5, 10],/*选择每页显示的页数*/
                sortOrder: "desc",/*降序排序*/
                sortOrder: "id",/*根据指定字段排序*/
                catch: false,/*不启用缓存*/
                columns: [
                    {field: "id", title: "编号"},
                    {field: "username", title: "用户名"},
                    {field: "password", title: "密码"},
                    {field: "sex", title: "性别"},
                    {field: "phone", title: "手机号"},
                    {
                        title: "操作",
                        formatter: function (value, rows, index) {
                            var row = JSON.stringify(rows);
                            return "<a  id='a_ids' class='btn btn-primary' role='button' href='javascript:updUser(" + row + ")'>修改</a>" +
                                "<a class='btn btn-primary' role='button' href='javascript:delUser(" + rows.id + ")'>删除</a>";
                        }
                    },
                ],
            });
        }

        /*打开修改的模态框并回显用户信息系*/
        function updUser(row) {
            document.getElementById("updForm").reset();

            $("#uname").val(row.username);
            $("#upd").val(row.password);
            $("#pnb").val(row.phone);
            $("#id").val(row.id);
            if (row.sex == '男') {
                var aaa = document.getElementById("sex1");
                aaa.checked = true;
            } else {
                var bbb = document.getElementById("sex2");
                bbb.checked = true;
            }
            $("#updModal").modal("show");
        }

        /*修改信息*/
        function save2() {
            if (confirm("是否修改？？")) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/updUser',
                    data: $("#updForm").serialize(),
                    type:"post",
                    success: function (res) {
                        if (res) {
                            debugger
                            layer.msg("修改成功~~");
                            $("#updModal").modal("hide");
                            lookUserAll();
                        } else {
                            layer.msg("添加失败！！");
                        }
                    }, error: function (res) {
                        alert("ERROR");
                    }
                })
            }
        }

        /*删除用户 根据id*/
        function delUser(id) {
            if (confirm("是否删除？？")) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/delUser',
                    type:"post",
                    data: {id: id},
                    success: function (res) {
                        if (res) {
                            layer.msg("删除成功~~");
                            lookUserAll();
                        } else {
                            layer.msg("删除失败！！");
                        }
                    }, error: function (res) {
                        alert("后台出错");
                    }
                })
            }
        }

        /*打开添加用户的模态框*/
        function addUser() {
            $("#addModal").modal("show");
        }

        /*添加用户*/
        function save() {
            $.ajax({
                url: '${pageContext.request.contextPath}/addUser',
                data: $("#addForm").serialize(),
                type:"post",
                success: function (res) {
                    if (res) {
                        layer.msg("添加成功~~");
                        $("#addModal").modal("hide");
                        lookUserAll();
                    } else {
                        layer.msg("添加失败！！");
                    }
                }, error: function (res) {
                    alert("ERROR");
                }
            })
        }

    </script>
</head>
<body>
<input type="button" onclick="addUser()" class="btn btn-primary" value="添加用户">
<br>
<table id="lookUserAll"></table>

<%--添加用户的模态框--%>
<div class="modal fade" id="addModal">
    <form id="addForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <span id="title">添加用户</span>
                    <button class="close" data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <label>用户名</label>
                    <input type="text" class="form-control" name="username">
                </div>
                <div class="modal-body">
                    <label>密码</label>
                    <input type="password" class="form-control" name="password">
                </div>
                <div class="modal-body">
                    <label>性别</label>
                    男：<input type="radio" value="男" checked name="sex">&nbsp;&nbsp;
                    女：<input type="radio" value="女" name="sex">
                </div>
                <div class="modal-body">
                    <label>手机号</label>
                    <input type="text" class="form-control" name="phone">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" onclick="save()" value="确定">
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="返回">
                </div>
            </div>
        </div>
    </form>
</div>

<%--修改的模态框--%>
<div class="modal fade" id="updModal">
    <form id="updForm">
        <div class="modal-dialog">
            <div class="modal-content">

                <input id="id" name="id" hidden/>

                <div class="modal-header">
                    <span id="title1">添加用户</span>
                    <button class="close" data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <label>用户名</label>
                    <input type="text" class="form-control" id="uname" name="username">
                </div>
                <div class="modal-body">
                    <label>密码</label>
                    <input type="password" class="form-control" id="upd" name="password">
                </div>
                <div class="modal-body">
                    <label>性别</label>
                    男：<input type="radio" id="sex1" value="男" name="sex">&nbsp;&nbsp;
                    女：<input type="radio" id="sex2" value="女" name="sex">
                </div>
                <div class="modal-body">
                    <label>手机号</label>
                    <input type="text" class="form-control" id="pnb" name="phone">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="save2()">确定</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal">返回</button>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
