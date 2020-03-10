<%--
  Created by IntelliJ IDEA.
  User: zhangchao
  Date: 2020/1/7
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        //时间日期格式转换
        function dateFormats1(dd) {
            var month = fix1(dd.getMonth() + 1, 2);
            var year = dd.getFullYear();
            var dates = fix1(dd.getDate(), 2);
            var hour = dd.getHours();
            var minutes = dd.getMinutes();
            var Second = dd.getSeconds();
            //	var d1=year+"-"+month+"-"+dates+hours+":"+minutes ;
            var d1 = year + "-" + month + "-" + dates + " " + hour + ":" + minutes + ":" + Second;
            return d1;
        }

        function fix1(num, length) {
            return ('' + num).length < length ? ((new Array(length + 1))
                .join('0') + num).slice(-length) : '' + num;
        }

        $(function () {
            lookChuHuoShenPi();
        })

        /*出货审批列表 查询pok==0*/
        function lookChuHuoShenPi() {
            $("#lookChuHuoShenPi").bootstrapTable("destroy");
            $("#lookChuHuoShenPi").bootstrapTable({
                url: "${pageContext.request.contextPath}/plan/queryAll",
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
                            return dateFormats1(dd);
                        }
                    }, {
                        title: "操作",
                        formatter: function (value, rows, index) {
                            return "<a  id='a_ids' class='btn btn-primary' role='button' href='javascript:pok(" + rows.pcount+","+ rows.pid+","+ "&quot;"+ rows.pname+"&quot;" + ",1)'>通过</a>" +
                            "<a class='btn btn-primary' role='button' href='javascript:pok(" + rows.pcount+","+ rows.pid+","+"&quot;"+ rows.pname+"&quot;"+ ",2)'>不通过</a>";
                        }
                    },
                ]
            })
        }

        layer.config({
            extend: 'extend/layer.ext.js'
        });

        /*审核*/
        function pok(pcount, id, pname, type) {
            if (type == 1) {
                layer.confirm("确定通过么？", {btn: ["确定", "取消"], title: "提示"}, function () {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/plan/ackPlan",
                        data: {pcount: pcount, id: id, pname: pname, type: type},
                        dataType: "json",
                        success: function (data) {
                            if (data) {
                                layer.closeAll('dialog');
                                $("#lookChuHuoShenPi").bootstrapTable("destroy");
                                lookChuHuoShenPi();
                            } else {
                                alert("审核失败");
                            }
                        }
                    })
                });
            }
            if (type == 2) {
                layer.prompt({
                    formType: 2,
                    title: '请输入原因',
                    area: ['400px', '250px'] //自定义文本域宽高
                }, function (value, index) {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/plan/ackPlan",
                        data: {pcount: pcount, id: id, pname: pname, type: type, reason: value},
                        dataType: "json",
                        success: function (data) {
                            if (data) {
                                layer.close(index);
                                $("#lookChuHuoShenPi").bootstrapTable("destroy");
                                lookChuHuoShenPi();
                            } else {
                                alert("审核失败");
                            }
                        }
                    });
                })
            }
        }


    </script>
</head>
<body>
<table id="lookChuHuoShenPi"></table>
</body>
</html>
