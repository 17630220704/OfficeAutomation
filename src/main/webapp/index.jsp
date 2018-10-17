<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>测试页</title>
    <script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="resources/jquery.serialize.js"></script>
</head>
<body>
<p class="shujv"></p>
<form class="save">
    <input type="text" name="goodsName" placeholder="商品名称" />
    商品类型:<select name="typeId.typeId" class="goodtype"></select>
    <input type="text" name="goodsDesc" placeholder="商品说明" />
    <input type="number" name="goodsUnitPrice" placeholder="商品单价" />
    <input type="text" name="goodsImageName" placeholder="商品图片名" />
    <input type="number" name="sellCount" placeholder="商品库存" />
    <input type="date" name="goodsDate" placeholder="商品时间" />
</form>
<input type="button" value="添加" class="savebutton" />
</body>
<script type="text/javascript">
    $(function() {
        show();
        showtype();
        alert("开始");
    });
    $(function() {
        $(".savebutton").click(function(){
            savegoods();
        });
    });
    $(function(){
        $("body").on("click",".degoods",function(){
            degoods();
        });
    });
    function degoods(){
        if(confirm("确认删除吗")){
            alert("12");
            var goodsid = $(this).val();
            alert(goodsid);
        }
    }
    function savegoods(){
        var goods= $(".save").serialize();
        $.post("saveGoods.do",goods,function(data){
            alert(data.result);
            show();
        })
    };
    function showtype() {
        $.post("gtAll.do", function(data) {
            for (i = 0; i < data.gtlist.length; i++) {
                var op = "";
                op += "<option value='" + data.gtlist[i].typeId + "'>";
                op += data.gtlist[i].typeName;
                op += "</option>";
                $(".goodtype").append(op);
            }
        });
    }
    function show() {
        $.post("gAll.do", function(data) {
            $(".showlist").remove();
            var de = "<table class='showlist'";
            de += "<tr>";
            de += "<td>商品编号</td>";
            de += "<td>商品名称</td>";
            de += "<td>商品类型</td>";
            de += "<td>商品说明</td>";
            de += "<td>商品单价</td>";
            de += "<td>商品图片</td>";
            de += "<td>商品库存</td>";
            de += "<td>商品时间</td>";
            de += "</tr>";
            for (i = 0; i < data.glist.length; i++) {
                de += "<tr>";
                de += "<td>" + data.glist[i].goodsId + "</td>";
                de += "<td>" + data.glist[i].goodsName + "</td>";
                de += "<td>" + data.glist[i].typeId.typeName + "</td>";
                de += "<td>" + data.glist[i].goodsDesc + "</td>";
                de += "<td>" + data.glist[i].goodsUnitPrice + "</td>";
                de += "<td>" + data.glist[i].goodsImageName + "</td>";
                de += "<td>" + data.glist[i].sellCount + "</td>";
                de += "<td>" + data.glist[i].goodsDate + "</td>";
                de += "<td><button class='degoods' value='" + data.glist[i].goodsDate + "'>";
                de += "删除</button></td>";
                de += "</tr>";
            }
            de += "</table>";
            $(".shujv").append(de);
        });
    }
</script>
</html>
