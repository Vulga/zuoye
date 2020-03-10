var zTreeObj;
var treeNode_;
var isCancel_;
// 进行ztree树形菜单设置，开启简单json数据支持
var setting = {
    callback: {
        beforeRemove: zTreeBeforeRemove,//删除
        onRemove: zTreeOnRemove,
        beforeRename: zTreeBeforeRename,//重命名
        /*onRename: zTreeOnRename*/
    },
    edit: {
        enable: true,
        editNameSelectAll: true,
        removeTitle: '删除',
        renameTitle: '重命名'
    },
    view: {
        addHoverDom: addHoverDom,
        removeHoverDom: removeHoverDom
    },
    data: {
        key: {
            name: "lname"
        },
        keep: {
            parent: true  //zTree 的节点父节点属性锁，是否始终保持 isParent = true     true / false 分别表示 锁定 / 不锁定 父节点属性
        },
        simpleData: {
            enable: true,  //true 、 false 分别表示 使用 、 不使用 简单数据模式
            idKey: "lid",  //节点数据中保存唯一标识的属性名称
            pIdKey: "lpid",    //节点数据中保存其父节点唯一标识的属性名称
            rootPId: 0,  //用于修正根节点的父节点数据，即 pIdKey 指定的属性值
        },
    },
};

$(document).ready(function () {
    loadNode();
});

function loadNode() {
    $.ajax({
        type: "get",
        url: path + "/leibie/getNode",
        async: true,
        success: function (res) {
            zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, res); //初始化树
        }
    });
}

/*移上，显示图标*/
function addHoverDom(treeId, treeNode) {
    var pid = treeNode.lpid;
    var id = treeNode.lid;
    var aObj = $("#" + treeNode.tId + "_span"); // _span 意思是：html源代码中就是span标签
    if ($("#addBtn_" + treeNode.tId).length > 0 || treeNode.editNameFlag) return;
    /*editNameFlag:检测该节点是否处于编辑名称装态*/
    /*$("#addBtn_" + treeNode.tId).length > 0
     判断是否有加号‘+’，若有，则不添加‘加号’ < ‘加号’是添加的小图标 > */
    var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
        + "' title='添加' onfocus='this.blur()'> </span>" // 追加标签
    aObj.after(addStr);
    var btnAdd = $("#addBtn_" + treeNode.tId);
    if (btnAdd) btnAdd.bind("click", function () {
        if (treeNode.isParent) {
            setValueToDialog(treeNode);
        } else {
            alert("子类别不能添加子节点！")
        }
    })
};

/*移开，图标消失*/
function removeHoverDom(treeId, treeNode) {
    $("#addBtn_" + treeNode.tId).unbind().remove();
};

/*添加节点触发的函数*/
function setValueToDialog(treeNode) {
    //treeNode_ ： 在第2行定义的变量
    treeNode_ = treeNode;
    //清空表单内容
    document.getElementById("addForm").reset();
    /*$("#pName").val(treeNode.name);*/
    $("#addModal").modal('show');
}

/*添加的方法*/
function addNode_() {
    //获取当前节点的id,要添加的节点的pid
    var pid = treeNode_.lid;
    var leibie = {
        lpid: pid,
        lname: $("#lname").val()
    }
    $.ajax({
        url: path + "/leibie/add",
        type: "post",
        data: leibie,
        success: function (data) {
            if (data) {

                layer.msg("添加成功");
                $("#addModal").modal('hide');

                var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                var parentZNode = treeObj.getNodeByParam("lid", treeNode_.lid, null);

                if (treeNode_.lpid == 0) {//添加主类
                    var newNode = {lname: $("#lname").val(), lid: data, isParent: true, lpid: treeNode_.lid};
                    newNode = treeObj.addNodes(parentZNode, newNode);
                } else {//添加子类
                    var newNode = {lname: $("#lname").val(), lid: data, isParent: false, lpid: treeNode_.lid};
                    newNode = treeObj.addNodes(parentZNode, newNode);
                }

                /*重新加载节点*/
                /*loadNode();*/
            }
        }, error: function () {
            alert("error")
        }
    })
}

/*删除，省市节点不能删*/
function zTreeBeforeRemove(treeId, treeNode) {
    if (treeNode.isParent == true) {
        layer.msg("该节点不可删除！！")
        return false;
    } else {
        if (confirm("确定删除该节点么？？")) {
            // 获取被删节点的父节点
            /*delParentNode_=treeNode.getParentNode();*/
            return true;
        } else {
            return false;
        }
    }
}

function zTreeOnRemove(event, treeId, treeNode) {
    $.ajax({
        type: "POST",
        url: path + '/leibie/delete',
        data: {
            lid: treeNode.lid,//根据该id删除
        }, success: function (res) {
            /*delParentNode_.isParent = true;
            zTreeObj.updateNode(delParentNode_);*/
            layer.msg("删除成功~");
        }, error: function (res) {
            alert("error")
        }
    })
}

/*重命名*/
function zTreeBeforeRename(treeId, treeNode, newName, isCancel) {
    isCancel_=isCancel;
    treeNode_=treeNode;
    var pNode_ = treeNode_.getParentNode();
    $("#shlb").val(pNode_.lname);
    $("#lbmc").val(treeNode.lname);

    /*打开修改模态框*/
    $("#updModal").modal("show");

    /*if (confirm("确定修改名称？")) {
        return true;
    } else {
        var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        treeObj.refresh();
        return false;
    }*/
}
function updNode_() {
    var leibie = {
        lid:treeNode_.lid,
        lname:$("#lbmc").val()
    };
    var qwert = $("#lbmc").val();
    if(confirm("确定修改？？")){
        $.ajax({
            type: "POST",
            url: path + '/leibie/update',
            data:leibie,
            success: function (res) {
                //获取zTree树对象
                var treeObj2 = $.fn.zTree.getZTreeObj("treeDemo");
                //获取要修改的节点对象
                var thisNode = treeObj2.getNodeByParam("lid", treeNode_.lid, null);
                //修改节点名称
                thisNode.lname=qwert;
                treeObj2.updateNode(thisNode);
                $("#updModal").modal("hide");
                layer.msg("修改成功~~");
                /*var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                treeObj.refresh();*/

            }, error: function (res) {
                alert("error")
            }
        })
    }
}
