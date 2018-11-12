
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../js/jsCity/jquery.min.js"></script>
<script type="text/javascript" src="../js/jsCity/Popt.js"></script>
<script type="text/javascript" src="../js/jsCity/city.json.js"></script>
<script type="text/javascript" src="../js/jsCity/citySet.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<html>
<head>
    <title>Title</title>
    <style>
        .display_none{
            display: none;
        }
        .td1{
            padding: 10px;
            width: 190px;
            background-color: #f2f2f2;
            font-size: 10px;
        }
        .td2{
            padding: 4px;
            width: 200px;
            font-size: 10px;
        }

    </style>
    <style type="text/css">
        * { -ms-word-wrap: break-word; word-wrap: break-word; }
        html { -webkit-text-size-adjust: none; text-size-adjust: none; }
        html, body {height:99%;width:99%; }
        .wrap{width:464px;height:34px;margin:20px auto;border:0;position:relative;}
        .input{position:absolute;top:0;left:0;width:457px;margin:0;padding-left:5px;height:30px;line-height:30px;font-size:12px;border:1px solid #c9cacb;}
        s{position:absolute;top:1px;right:0;width:32px;height:32px;background:url("js/img/arrow.png") no-repeat;}
        ._citys { width: 450px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative; }
        ._citys span { color: #05920a; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #05920a; cursor: pointer; }
        ._citys0 { width: 95%; height: 34px; line-height: 34px; display: inline-block; border-bottom: 2px solid #05920a; padding: 0px 5px; font-size:14px; font-weight:bold; margin-left:6px; }
        ._citys0 li { display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer; }
        ._citys1 { width: 100%; display: inline-block; padding: 10px 0; }
        ._citys1 a { width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 12px; border-radius: 5px; overflow: hidden; }
        ._citys1 a:hover { color: #fff; background-color: #05920a; }
        .AreaS { background-color: #05920a !important; color: #fff !important; }
    </style>
</head>

<body>
<script src="/demos/googlegg.js"></script>

<%--<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
    <p>来源：<a href="http://www.lanrenzhijia.com/" target="_blank">懒人</a></p>
</div>--%>
<table><tr><td class="td1">hah：</td>
    <td class="td2" >

    <div class="wrap">
        <input class="input" name="" id="city" type="text" placeholder="请选择" autocomplete="off" readonly="true">
        <s></s>

    </div>
</td></tr></table>

<div>
    <input type="text" value="123">
    <input type="text" value="123">
    <input type="text" value="123">
    <input type="text" value="123">
    <input type="text" value="123">
    <input type="text" value="123">
    <input type="text" value="123">
    <input type="text" value="123">
</div>
<p>2. 只能是汉字 </p>
<input type="text" onblur="isChinese(this.value)"  />
<p>2. 只能是shu字 </p>
<input type="text" onblur="CheckForm(obj)" />
<input type="text" onblur="CheckForm(obj1)" />
<p>2. 只能是shenfen </p>
<input type="text" onblur="validatemobile(this.value)"  />
<script language="javascript">
    function CheckForm(obj,obj1)
    {
        if (obj.length == 0) {
            alert("姓名0不能为空!");
            return false;
        }
        if (obj1.length == 0) {
            alert("姓名1不能为空!");
            return false;
        }
       /* return true;
        alert("姓名不能为空!");*/
    }
</script>
<script language="javascript">

    // 构造函数，变量为15位或者18位的身份证号码
    function validatemobile(mobile)
    {
        if(mobile.length==0)
        {
            alert('手机号码不能为空！');
            return false;
        }
        if(mobile.length!=11)
        {
            alert('请输入有效的手机号码，需是11位！');
            return false;
        }

        var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(!myreg.test(mobile))
        {
            alert('请输入有效的手机号码！');
            return false;
        }
    }</script>
    <script language="javascript">
    function isChinese(obj){
        var reg=/^[\u0391-\uFFE5]+$/;
        var  reg1=/^ +| +$/g;
        if(obj!=""&&!reg.test(obj)){
            alert('必须输入中文！');
            return false;
        }

    }

</script>
<script type="text/javascript">
    $("#city").click(function (e) {
        SelCity(this,e);
    });
    $("s").click(function (e) {
        SelCity(document.getElementById("city"),e);
    });
</script>
<script>
    window.onload = function(){
        function getDate(){
            debugger;
            var today = new Date();
            var date;
            date = (today.getFullYear()) +"-" + (today.getMonth() + 1 ) + "-" + today.getDate() ;
            return date;
        }
        window.setInterval(function(){
            document.getElementById("getBookTime").value=getDate();
        }, 1000);
    }
</script>



<input type="text"  name="getBookTime" id="getBookTime" value="">
</body>
</html>
