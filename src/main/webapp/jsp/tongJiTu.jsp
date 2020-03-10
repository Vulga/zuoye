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
    <script src="${pageContext.request.contextPath}/static/echarts/echarts.min.js"></script>
    <script>
        var a = [];
        var b = [];
        
        var myChart = echarts.init(document.getElementById('main'));
        
        var option = {
            title: {
                text: '出货物品及数量统计图',
                left: 'center'
            },
            color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: a,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '出货数量',
                    type: 'bar',
                    barWidth: '60%',
                    data: b
                }
            ]
        };
        myChart.setOption(option);
        $.ajax({
            url:'${pageContext.request.contextPath}/plan/queryAllTJ',
            data:{flag:true},
            success:function (res) {
                for(var i=0;i<res.length;i++){
                    a.push(res[i].pm);
                    b.push(res[i].count);
                }
                myChart.setOption({
                    series: [
                        {
                            data: b
                        }
                    ],
                    xAxis: [
                        {
                            data: a,
                        }
                    ]
                })
            }
        })
    </script>
</head>
<body>
    <div id="main" style="width: 500px;height:400px; "></div>
</body>
</html>
