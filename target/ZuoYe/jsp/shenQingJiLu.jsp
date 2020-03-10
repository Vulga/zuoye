<%--
  Created by IntelliJ IDEA.
  User: zhangchao
  Date: 2020/1/7
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script>
        //时间日期格式转换
        function dateFormats3(dd) {
            var month = fix3(dd.getMonth() + 1, 2);
            var year = dd.getFullYear();
            var dates = fix3(dd.getDate(), 2);
            var hour = dd.getHours();
            var minutes = dd.getMinutes();
            var Second = dd.getSeconds();
            //	var d1=year+"-"+month+"-"+dates+hours+":"+minutes ;
            var d1 = year + "-" + month + "-" + dates + " " + hour + ":" + minutes + ":" + Second;
            return d1;
        }

        function fix3(num, length) {
            return ('' + num).length < length ? ((new Array(length + 1))
                .join('0') + num).slice(-length) : '' + num;
        }

        $(function () {
            shenQingJiLu();
        })

        function shenQingJiLu() {
            $("#shenQingJiLu").bootstrapTable("destroy");
            $("#shenQingJiLu").bootstrapTable({
                url: "${pageContext.request.contextPath}/plan/queryAll2",
                method: "POST",
                contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                pagination: true,/*开启分页*/
                sidePagination: "client",/*启用客户端分页*/
                pageNumber: 1,/*默认第一页*/
                pageSize: 5,/*每页5条*/
                pageList: [1, 3, 5],/*选择每页显示的页数*/
                sortOrder: "desc",/*降序排序*/
                catch: false,/*不启用缓存*/
                detailView: false,/*不启用父子表*/
                columns: [
                    {
                        field: "pid",
                        title: "编号"
                    }, {
                        field: "leibie.lname",
                        title: "所属类别"
                    }, {
                        field: "pname",
                        title: "物品名称",
                    }, {
                        field: "pcount",
                        title: "申请数量",
                    }, {
                        field: "ptime",
                        title: "申请时间",
                        formatter: function (value, rows, index) {
                            var dd = new Date(rows.ptime)
                            return dateFormats3(dd);
                        }
                    }, {
                        field: "reason",
                        title: "审批意见"
                    }, {
                        title: "操作",
                        formatter: function (value, rows, index) {
                            var row = JSON.stringify(rows);
                            if (rows.pok == 1) {
                                return "<a id='a_ids' class='btn btn-primary' role='button' href='javascript:;'>通过</a>";
                            }
                            if (rows.pok == 0) {
                                return "<a id='a_ids' class='btn btn-primary' role='button' href='javascript:;'>等待审核</a>";
                            }
                            if (rows.pok == 2) {
                                return "<a type='button' class='btn btn-primary' role='button' href='javascript:cxsq(" + row + ")'>重新申请</a>";
                            }
                        }
                    }
                ]
            })
        }
        /*物品名称下拉框，随 所属类别 改变*/
        $("#cxsqpleibie").on("change", function () {
            /*移除 option*/
            $("#cxsqpname").empty();
            var lid = $("#cxsqpleibie option:selected").val();
            $.ajax({
                url: '${pageContext.request.contextPath}/wupin/lookWupinAll',
                type: 'post',
                data: {lid: lid, lname: ''},
                success: function (res) {
                    if (res.length == 0) {
                        layer.msg("该类别下没有物品！！！")
                    }
                    for (var i = 0; i < res.length; i++) {
                        $("#cxsqpname").append("<option value=" + res[i].wname + ">" + res[i].wname + "</option>")
                    }
                }
            })
        })
        function cxsq(row) {
            /*重新申请是时要把原因划掉*/
            /*所属类别下拉框*/
            /*移除 option*/
            $("#cxsqpleibie").empty();
            $.ajax({
                url: '${pageContext.request.contextPath}/leibie/getSelect',
                type: 'post',
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        if (res[i].lid == row.pleibie) {
                            $("#cxsqpleibie").append("<option selected value=" + res[i].lid + ">" + res[i].lname + "</option>");
                        } else {
                            $("#cxsqpleibie").append("<option value=" + res[i].lid + ">" + res[i].lname + "</option>");
                        }

                    }
                }
            })
            /*所属类别 冰箱*/
            /*移除 option*/
            $("#cxsqpname").empty();
            $.ajax({
                url: '${pageContext.request.contextPath}/wupin/lookWupinAll',
                type: 'post',
                data: {lid: row.pleibie, lname: ''},
                success: function (res) {
                    for (var i = 0; i < res.length; i++) {
                        $("#cxsqpname").append("<option value=" + res[i].wname + ">" + res[i].wname + "</option>")
                    }
                }
            })

            $("#cxsqid").val(row.pid);
            $("#cxsqpcount").val(row.pcount);
            $("#cxsqptime").val(
                function () {
                    var str = '';
                    var time = new Date(row.ptime);
                    str += time.getFullYear() + '-';
                    str += time.getMonth() + 1 + '-';
                    str += time.getDate() + ' ';
                    str += time.getHours() + ':';
                    str += time.getMinutes() + ':';
                    str += time.getSeconds() + '';
                    return str;
                }
            );

            $("#cxsqModal").modal("show");
        }

        /*=====*/
        function cxsqSave() {
            $.ajax({
                url: '${pageContext.request.contextPath}/plan/upd',
                type: 'post',
                data:$("#cxsqForm").serialize(),
                success: function (res) {
                    $("#cxsqModal").modal("hide");
                    layer.msg("重新申请成功，等待审核~~");
                    /*清空表单*/
                    shenQingJiLu();
                }
            })
        }
    </script>
</head>
<body>
<table id="shenQingJiLu"></table>


<div class="modal fade" id="cxsqModal">
    <form id="cxsqForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <input id="cxsqid" name="pid" hidden/>
                <div class="modal-header">
                    <span id="title">重新申请</span>
                    <button class="close" data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <label>所属类别</label>
                    <select class="form-control" name="pleibie" id="cxsqpleibie"></select>
                </div>
                <div class="modal-body">
                    <label>物品名称</label>
                    <select class="form-control" name="pname" id="cxsqpname"></select>
                </div>
                <div class="modal-body">
                    <label>申请数量</label>
                    <input type="text" class="form-control" name="pcount" id="cxsqpcount">
                </div>
                <div class="modal-body">
                    <label>申请时间</label>
                    <input onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" name="ptime" type="text"
                           class="form-control"
                           id="cxsqptime">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" onclick="cxsqSave()" value="确定">
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="返回">
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
