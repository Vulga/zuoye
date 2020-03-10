<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstraps1.css" rel="stylesheet"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/table/bootstrap-table2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/styles1.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap-tab.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/assets/layer/skin/layer.ext.css">
<%--===========--%>
    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap-closable-tab.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/closable-tab-div.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-elements.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/assets/layer/extend/layer.ext.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/common/dataFormater.js" type="text/javascript"></script>

    <script>
        var path = "${pageContext.request.contextPath}";
    </script>
    <%--<script src="${pageContext.request.contextPath}/js/tab.js"></script>--%>
    <script>
        function userMag() {
            closableTab.addTab({"id": "userMag", "name": "用户管理", "url": path + "/jsp/userMag.jsp", "closable": true});
        }

        function leibieMag() {
            closableTab.addTab({"id": "leibieMag", "name": "类别管理", "url": path + "/jsp/leibieMag.jsp", "closable": true});
        }

        function wupinMag() {
            closableTab.addTab({"id": "wupinMag", "name": "物品管理", "url": path + "/jsp/wupinMag.jsp", "closable": true});
        }
        function chuHuoShenPi() {
            closableTab.addTab({"id": "chuHuoShenPi", "name": "出货审批", "url": path + "/jsp/chuHuoShenPi.jsp", "closable": true});
        }
        function chuHuoJiLu() {
            closableTab.addTab({"id": "chuHuoJiLu", "name": "出货记录", "url": path + "/jsp/chuHuoJiLu.jsp", "closable": true});
        }
        function tongJiTu() {
            closableTab.addTab({"id": "tongJiTu", "name": "统计图", "url": path + "/jsp/tongJiTu.jsp", "closable": true});
        }
        function shenQingChuHuo() {
            closableTab.addTab({"id": "shenQingChuHuo", "name": "申请出货", "url": path + "/jsp/shenQingChuHuo.jsp", "closable": true});
        }
        function shenQingJiLu2() {
            closableTab.addTab({"id": "shenQingJiLu", "name": "申请记录", "url": path + "/jsp/shenQingJiLu.jsp", "closable": true});
        }
        function ovid() {
            location.href="${pageContext.request.contextPath}/jsp/login.jsp";
        }
    </script>
    <style>.modal-backdrop {
        z-index: 0;
    }</style>

</head>

<body>

<div class="navbar navbar-inverse" id="navbar">
    <div class="navbar-container" id="navbar-container">
        <span style="font-size: 23px;font-family:'楷体';color: #c5c9cb " class="user-title-label">仓库管理系统</span>
    </div>

    <div style="position:absolute;left:1238px;top:-16px" class="navbar-header pull-right" role="navigation">
        <ul class="nav ace-nav">
            <li class="light-blue">
                <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                    <span
                        class="user-info"><small>欢迎光临,</small>${user.username}
                    </span>
                    <i class="icon-caret-down"></i>
                </a>
                <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                    <li><a href="javascript:ovid()" id="Exit_system"><i class="icon-off"></i>退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<div class="main-container" id="main-container">
    <div class="main-container-inner" style="width: auto; height: auto;">

        <div class="sidebar" id="sidebar">
            <div id="menu_style" class="menu_style">
                <ul class="menu-text" style="font-size: 16px; font-family: 楷体"><li>菜单栏</li></ul>
                <ul class="nav nav-list" id="nav_list">

<c:if test="${user.username=='admin'}">
                    <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i></i><span
                            class="menu-text"> 用户管理 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:userMag()" title="用户管理" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>用户管理</a></li>
                        </ul>
                    </li>

                    <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i></i><span
                            class="menu-text"> 货物管理 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:leibieMag()" title="类别管理" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>类别管理</a></li>
                            <li class="home"><a href="javascript:wupinMag()" title="物品管理" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>物品管理</a></li>
                        </ul>
                    </li>

                    <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i></i><span
                            class="menu-text"> 审批管理 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:chuHuoShenPi()" title="出货审批" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>出货审批</a></li>
                            <li class="home"><a href="javascript:chuHuoJiLu()" title="出货记录" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>出货记录</a></li>
                        </ul>
                    </li>

                    <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i></i><span
                            class="menu-text"> 数据统计 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:tongJiTu()" title="统计图" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>统计图</a></li>
                        </ul>
                    </li>
</c:if>
<c:if test="${user.username!='admin'}">
                    <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i></i><span
                            class="menu-text"> 申请出货 </span><b class="arrow icon-angle-down"></b></a>
                        <ul class="submenu">
                            <li class="home"><a href="javascript:shenQingChuHuo()" title="申请出货" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>申请出货</a></li>
                            <li class="home"><a href="javascript:shenQingJiLu2()" title="申请记录" class="iframeurl"><i
                                    class="icon-double-angle-right"></i>申请记录</a></li>
                        </ul>
                    </li>
</c:if>
                </ul>
            </div>
        </div>

        <div class="main-content">
            <div id="breadcrumbs" style="width: 1500px">
                <ul id="aa" class="nav nav-tabs breadcrumb" role="tablist" style="z-index: 0;"></ul>
            </div>
            <div class="tab-content">
            </div>
        </div>

    </div>
</div>
</div>

</body>
</html>
