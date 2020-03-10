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
    <script src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script>
        //时间日期格式转换
        function dateFormats(dd) {
            var month = fix(dd.getMonth() + 1, 2);
            var year = dd.getFullYear();
            var dates = fix(dd.getDate(), 2);
            var hour = dd.getHours();
            var minutes = dd.getMinutes();
            var Second = dd.getSeconds();
            //	var d1=year+"-"+month+"-"+dates+hours+":"+minutes ;
            var d1 = year + "-" + month + "-" + dates + " " + hour + ":" + minutes + ":" + Second;
            return d1;
        }

        function fix(num, length) {
            return ('' + num).length < length ? ((new Array(length + 1))
                .join('0') + num).slice(-length) : '' + num;
        }

        $(function () {
            /*移除 option*/
            $("#queryLid").empty();
            /*填充查询下拉框*/
            $.ajax({
                url: "${pageContext.request.contextPath}/leibie/getQuerySelect",
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        if(res[i].lid==1){
                            $("#queryLid").append( "<option  selected value=" + res[i].lid + ">"+res[i].lname+ "</option>" )
                        }else {
                            if(res[i].lpid==1){
                                $("#queryLid").append("<option value="  + res[i].lid + ">" + res[i].lname+'(主类别)'+ "</option>")
                            }else{
                                $("#queryLid").append("<option value=" + res[i].lid + ">" + res[i].lname + "</option>")
                            }

                        }
                    }
                }
            })
            lookWupinAll();
        })

        function lookWupinAll() {
            $("#lookWupinAll").bootstrapTable("destroy");
            $("#lookWupinAll").bootstrapTable({
                url: "${pageContext.request.contextPath}/wupin/lookWupinAll",
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
                queryParams: function (params) {//请求携带的参数
                    var temp = {
                        lid: $("#queryLid option:selected").val(),//按类别(下拉框)查询，
                        lname: $("#queryLname").val()//按物品名字模糊查的参数
                    }
                    return temp;
                },
                columns: [
                    {field: "wid", title: "编号"},
                    {field: "leibie.lname", title: "所属类别"},
                    {field: "wname", title: "物品名称"},
                    {field: "wcount", title: "物品数量"},
                    {
                        field: "addTime", title: "添加时间",
                        formatter: function (value, rows, index) {
                            var dd = new Date(rows.addTime);
                            return dateFormats(dd);
                        }
                    },
                    {
                        title: "操作",
                        formatter: function (value, rows, index) {
                            var row = JSON.stringify(rows);
                            return "<a  id='a_ids' class='btn btn-primary' role='button' href='javascript:updWupin(" + row + ")'>修改</a>" +
                                "<a class='btn btn-primary' role='button' href='javascript:delWupin(" + rows.wid + ")'>删除</a>";
                        }
                    },
                ],
            });
        }

        /*修改物品*/
        function updWupin(row) {
            /*清空表单*/
            document.getElementById("updWupinForm").reset();
            /*移除 option*/
            $("#updwlid").empty();
            $("#updwid").val(row.wid);
            /*$("#updwlid").val(row.wlid);*/
            $("#updwname").val(row.wname);
            $("#updwcount").val(row.wcount);
            $("#updaddTime").val(
                function () {
                    var str = '';
                    var time = new Date(row.addTime);
                    str += time.getFullYear() + '-';
                    str += time.getMonth() + 1 + '-';
                    str += time.getDate() + ' ';
                    str += time.getHours() + ':';
                    str += time.getMinutes() + ':';
                    str += time.getSeconds() + '';
                    return str;
                }
            );

            /*填充下拉框*/
            $.ajax({
                url: "${pageContext.request.contextPath}/leibie/getSelect",
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        if (res[i].lid == row.wlid) {
                            $("#updwlid").append(
                                "<option selected value=" + res[i].lid + ">" + res[i].lname + "</option>"
                            )
                        } else {
                            $("#updwlid").append(
                                "<option value=" + res[i].lid + ">" + res[i].lname + "</option>"
                            )
                        }
                    }
                }
            })
            /*打开修改模态框*/
            $("#updWupinModal").modal("show");
        }

        /*修改物品*/
        function updWupin_() {
            if (confirm("确定修改？？")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/wupin/upd",
                    data: $("#updWupinForm").serialize(),
                    success: function (res) {
                        if (res) {
                            layer.msg("修改成功~~");
                            $("#updWupinModal").modal("hide");
                            lookWupinAll();
                        } else {
                            layer.msg("修改失败！！");
                        }
                    }
                })
            }
        }

        /*删除物品*/
        function delWupin(wid) {
            if (confirm("确定删除？？？")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/wupin/del",
                    data: {wid: wid},
                    success: function (res) {
                        if (res) {
                            layer.msg("删除成功~~");
                            lookWupinAll();
                        } else {
                            layer.msg("删除失败！！");
                        }
                    }
                })
            }
        }

        /*打开添加物品模态框*/
        function adwpMotal() {
            /*清空表单*/
            document.getElementById("addWupinForm").reset();
            /*移除 option*/
            $("#updwlid").empty();
            $("#addWupinModal").modal("show");
            /*填充下拉框*/
            $.ajax({
                url: "${pageContext.request.contextPath}/leibie/getSelect",
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        $("#wlid").append(
                            "<option value=" + res[i].lid + ">" + res[i].lname + "</option>"
                        )
                    }
                }
            })
        }

        /*添加物品*/
        function addWupin() {
            var wupin = {
                wlid: $("#wlid").val(),
                wname: $("#wname").val(),
                wcount: $("#wcount").val(),
                addTime: $("#addTime").val(),
            }
            $.ajax({
                url: "${pageContext.request.contextPath}/wupin/add",
                type: "POST",
                data: wupin,
                success: function (res) {
                    layer.msg("添加成功~~");
                    $("#addWupinModal").modal("hide");
                    lookWupinAll();
                }
            })
        }


    </script>
</head>
<body>
<input type="button" onclick="adwpMotal()" class="btn btn-primary" value="添加物品">
<input type="button" class="btn btn-primary" onclick="lookWupinAll()" value="查询全部">
<select id="queryLid"></select>
<input type="button" onclick="lookWupinAll()" value="按类别查询">
<input type="text" id="queryLname">
<input type="button" onclick="lookWupinAll()" value="按物品名称查询">
<input type="button" onclick="javascript:$('#queryLname').val('')" value="清空">
<br>
<table id="lookWupinAll"></table>

<%--添加物品模态框--%>
<div class="modal fade" id="addWupinModal">
    <form id="addWupinForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <span id="title">添加物品</span>
                    <button class="close" data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <label>所属类别</label>
                    <select class="form-control" id="wlid" name="wlid"> </select>
                </div>
                <div class="modal-body">
                    <label>物品名称</label>
                    <input type="text" class="form-control" id="wname" name="wname">
                </div>
                <div class="modal-body">
                    <label>物品数量</label>
                    <input type="text" class="form-control" id="wcount" name="wcount">
                </div>
                <div class="modal-body">
                    <label>添加时间</label>
                    <input onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" type="text" class="form-control"
                           id="addTime" name="addTime">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" onclick="addWupin()" value="确定">
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="返回">
                </div>
            </div>
        </div>
    </form>
</div>

<%--修改物品模态框--%>
<div class="modal fade" id="updWupinModal">
    <form id="updWupinForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <span id="titleupd">修改物品</span>
                    <button class="close" data-dismiss="modal">X</button>
                </div>
                <input hidden id="updwid" name="wid">
                <div class="modal-body">
                    <label>所属类别</label>
                    <select class="form-control" id="updwlid" name="wlid"> </select>
                </div>
                <div class="modal-body">
                    <label>物品名称</label>
                    <input type="text" class="form-control" id="updwname" name="wname">
                </div>
                <div class="modal-body">
                    <label>物品数量</label>
                    <input type="text" class="form-control" id="updwcount" name="wcount">
                </div>
                <div class="modal-body">
                    <label>添加时间</label>
                    <input onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" type="text" class="form-control"
                           id="updaddTime" name="addTime">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" onclick="updWupin_()" value="确定 ">
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="返回">
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
