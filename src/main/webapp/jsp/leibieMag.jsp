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
    <link href="${pageContext.request.contextPath}/static/ztree/css/metroStyle/metroStyle.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.core.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.excheck.js"></script>
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.exedit.js"></script>
    <script src="${pageContext.request.contextPath}/js/node.js"></script>
    <script>var path = "${pageContext.request.contextPath}";</script>
</head>
<body>
    <div>
        <ul id="treeDemo" class="ztree"></ul>
    </div>

<%--添加类别--%>
<div class="modal fade" id="addModal">
    <form id="addForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <span id="title">添加类别</span>
                    <button class="close" data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <label>类别名称</label>
                    <input type="text" class="form-control" id="lname" name="lname">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" onclick="addNode_()" value="确定">
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="返回">
                </div>
            </div>
        </div>
    </form>
</div>

<%--修改类别--%>
<div class="modal fade" id="updModal">
    <form id="updForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <span id="title2">添加类别</span>
                    <button class="close" data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <label>所属类别</label>
                    <input disabled type="text" id="shlb" class="form-control" name="lname">
                </div>
                <div class="modal-body">
                    <label>类别名称</label>
                    <input type="text" class="form-control" id="lbmc" name="lname">
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary" onclick="updNode_()" value="确定">
                    <input type="button" class="btn btn-primary" data-dismiss="modal" value="返回">
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
