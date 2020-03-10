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
        //时间日期格式转换
        function dateFormats2(dd) {
            var month = fix2(dd.getMonth() + 1, 2);
            var year = dd.getFullYear();
            var dates = fix2(dd.getDate(), 2);
            var hour = dd.getHours();
            var minutes = dd.getMinutes();
            var Second = dd.getSeconds();
            //	var d1=year+"-"+month+"-"+dates+hours+":"+minutes ;
            var d1 = year + "-" + month + "-" + dates + " " + hour + ":" + minutes + ":" + Second;
            return d1;
        }

        function fix2(num, length) {
            return ('' + num).length < length ? ((new Array(length + 1))
                .join('0') + num).slice(-length) : '' + num;
        }

        $(function () {
            queryChuHuoJiLu();
        })

        /*出货审批列表 查询pok==0*/
        function queryChuHuoJiLu() {
            $("#queryChuHuoJiLu").bootstrapTable("destroy");
            $("#queryChuHuoJiLu").bootstrapTable({
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
                queryParams: function (params) {/*后台传参*/
                    var temp = {
                        flag: true,/*true 表示 出货记录查询 查询审批通过的 即pok==1*/
                        pname:$("#queryChuHuoJiLuFromName").val(),
                    }
                    return temp;
                },
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
                            return dateFormats2(dd);
                        }
                    },
                ]
            })
        }

    /*按名称模糊查*/
    function queryChuHuoJiLuFromName() {
        queryChuHuoJiLu();
    }
    </script>
</head>
<body>
    <input placeholder="按名称模糊查" type="text" id="queryChuHuoJiLuFromName"><input type="button" onclick="queryChuHuoJiLuFromName()" value="查询">
    <table id="queryChuHuoJiLu"></table>
</body>
</html>
