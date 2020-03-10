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
        $(function () {
            /*所属类别下拉框*/
            /*移除 option*/
            $("#pleibie").empty();
            $.ajax({
                url: '${pageContext.request.contextPath}/leibie/getSelect',
                type: 'post',
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        $("#pleibie").append("<option value=" + res[i].lid + ">" + res[i].lname + "</option>")
                    }
                }
            })
            /*所属类别 冰箱*/
            /*移除 option*/
            $("#pname").empty();
            $.ajax({
                url: '${pageContext.request.contextPath}/wupin/lookWupinAll',
                type: 'post',
                data: {lid: 3, lname: ''},
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        $("#pname").append("<option value=" + res[i].wname + ">" + res[i].wname + "</option>")
                    }
                }
            })
        })

        /*物品名称下拉框，随 所属类别 改变*/
        $("#pleibie").on("change", function () {
            /*移除 option*/
            $("#pname").empty();
            var lid = $("#pleibie option:selected").val();
            $.ajax({
                url: '${pageContext.request.contextPath}/wupin/lookWupinAll',
                type: 'post',
                data: {lid: lid, lname: ''},
                success: function (res) {
                    if (res.length == 0) {
                        layer.msg("该类别下没有物品！！！")
                    }
                    for (var i = 0; i < res.length; i++) {
                        $("#pname").append("<option value=" + res[i].wname + ">" + res[i].wname + "</option>")
                    }
                }
            })
        })

        /*添加 申请出货*/
        function addPlan() {
            $.ajax({
                url: '${pageContext.request.contextPath}/plan/add',
                type: 'post',
                data:$("#addPlanForm").serialize(),
                success: function (res) {
                    layer.msg("申请成功，等待审核~~");
                    /*清空表单*/
                    document.getElementById("addPlanForm").reset();
                }
            })
        }

    </script>
</head>
<body>
<form method="post" id="addPlanForm" class="form-horizontal" role="form"><%--申请出货 添加--%>
    <%--数据添加到plan表--%>
    <div class="form-group">
        <label for="pleibie" class="col-sm-2 control-label">所属类别：</label>
        <div class="col-sm-3">
            <select class="form-control" name="pleibie" id="pleibie"></select>
        </div>
    </div>

    <div class="form-group">
        <label for="pname" class="col-sm-2 control-label">物品名称：</label>
        <div class="col-sm-3">
            <select class="form-control" name="pname" id="pname"></select>
        </div>
    </div>

    <div class="form-group">
        <label for="pcount" class="col-sm-2 control-label">申请数量：</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" name="pcount" id="pcount">
        </div>
    </div>

    <div class="form-group">
        <label for="ptime" class="col-sm-2 control-label">申请时间：</label>
        <div class="col-sm-3">
            <input onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" name="ptime" type="text"
                   class="form-control"
                   id="ptime">
        </div>
    </div>


    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input onclick="addPlan()" class="btn btn-default" value="申请出货">
        </div>
    </div>
</form>
</body>
</html>
