<%--
  Created by IntelliJ IDEA.
  User: zhangchao
  Date: 2020/1/6
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wopop</title>
    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>

    <link href="${pageContext.request.contextPath}/jsp/Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jsp/Wopop_files/jquery.ui.all.css">

    <%--登录js--%>
    <script>
        function login123(){
            $.ajax({
                url:"${pageContext.request.contextPath}/login",
                data:{
                    username:$("#username").val(),
                    password:$("#password").val()
                },
                success:function (res) {
                    if(res){
                        layer.msg("登录成功~~");
                        location.href="${pageContext.request.contextPath}/jsp/test.jsp";
                    }else{
                        layer.msg("密码或用户名错误！！")
                    }
                },error:function (res) {
                    alert("后台出错！！")
                }
            })
        }
    </script>

</head>
<body class="login" mycollectionplug="bind">
<div class="login_m">
    <div class="login_logo"><img src="${pageContext.request.contextPath}/jsp/Wopop_files/logo.png" width="196" height="100"></div>
    <div class="login_boder">

        <div class="login_padding" id="login_model">

            <h2>用户名</h2>
            <label>
                <input type="text" id="username" class="txt_input txt_input2" placeholder="请输入用户名">
            </label>
            <h2>密码</h2>
            <label>
                <input type="password" name="textfield2" id="password" class="txt_input" placeholder="请输入密码">
            </label>


            <div class="rem_sub">
                <div class="rem_sub_l">


                </div>
                <label>
                    <input type="button" onclick="login123()" class="sub_button" name="button" id="button" value="登录"
                           style="opacity: 0.7;">
                </label>
            </div>
        </div>


        <div id="forget_model" class="login_padding" style="display:none">
            <br>


            <br>

            <label>
                <input type="text" id="usrmail" class="txt_input txt_input2">
            </label>


            <div class="rem_sub">
                <div class="rem_sub_l">
                </div>
                <label>
                    <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now"
                           style="opacity: 0.7;">
                    　　　
                    <input type="submit" class="sub_button" name="button" id="denglou" value="Return"
                           style="opacity: 0.7;">　　

                </label>
            </div>
        </div>
    </div>
</div>
</body>
</html>