<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/11 0011
  Time: 下午 4:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>

</head>
<script>
    $(function(){
        alert("进入查询")
        $.ajax({
            url:"/aNeed/selectName",
            data:"",
            type:"post",
            dataType:"json",
            success:function(data){
                $("#left_").html("");
                var a ="";
                for(lu=0;lu<data.length;lu++){
                    a+="<option value='"+data[lu].DeptId+"'>"+data[lu].DeptName+"</option>"
                }
                $("#left_").append(a);
            }
        })
    })
    function right_move()
    {
        var con_data=[];
        for(var i=0;i<$("left_").length;i++)
        {
            if($("left_").options[i].selected)
                con_data[con_data.length]=[$("left_").options[i].value,$("left_").options[i].text];

        }
        $("right_").length=$("right_").length;
        for(var i=0;i<con_data.length;i++)
        {
            var con_fla=true;
            for(var k=0;k<$("right_").length;k++)
            {
                if(con_data[i][0]==$("right_").options[k].value)
                    con_fla=false;
            }
            alert(con_data[i][1])
            if(con_fla)
                $("right_").options[$("right_").length]=new Option(con_data[i][1],con_data[i][0]);
        }
    }
    function del_right()
    {
        var index_data=[];
        for(var i=0;i<$("right_").length;i++)
        {
            if($("right_").options[i].selected)
                index_data[index_data.length]=[i];
        }
        for(var i=index_data.length-1;i>=0;i--)
        {
            $("right_").removeChild($("right_").options[index_data[i]]);
            alert(("#right_").html())
        }
    }
    function $(id){return document.getElementById(id);}



</script>
<body>
<!-- 人员选择模态框（Modal） -->
<div class="modal fade" id="myModa5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">
                    选择
                </h4>
            </div><form method="post">
<table width="355" height="192" border="1">
    <tr>
        <td width="128" align="center" valign="middle">
            <select name="left_"  multiple="multiple" id="left_" style="width:100px;">
            <%--<option value="辽宁省">辽宁省</option>
            <option value="吉林省">吉林省</option>
            <option value="黑龙江省">黑龙江省</option>
            <option value="陕西省">陕西省</option>
            <option value="江苏省">江苏省</option>
            <option value="广东省">广东省</option>--%>
        </select></td>
        <td width="101" align="center" valign="middle"><input type="button" id="" name="Submit" value=" 右移>> " onclick="right_move()"/>
            <br />
            <br />
            <input type="button" name="Submit2" value=" 删 除 " onclick="del_right();" /></td>
        <td width="128" align="center" valign="middle">
            <select name="right_"  multiple="multiple" id="right_" style="width:100px;">
            </select>
        </td>

    </tr>
    <tr> <td>
    <<input type="submit" name="" id="righting" onclick="righting()" value="确认">
    </td></tr>
</table>
        </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<table>
    <tr>
        <td class="td1">姓名：</td>
        <td class="td2"><input type="text" class="form-control tbPersoninfoQuery persName" id="personName" name="personName" ></td>
        <td style="font-size: 10px;width: 40px"><a data-toggle='modal' data-target='#myModa5' style="cursor:pointer;" >+选择</a></td>

    </tr>
</table>
</body>
</html>
