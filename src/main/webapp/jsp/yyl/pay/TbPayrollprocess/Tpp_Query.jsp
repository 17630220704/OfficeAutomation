<%--
  Created by IntelliJ IDEA.
  User: Bento
  Date: 2018/11/2
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>打印</title>
    <link rel="stylesheet" href="/resources/js_yyl/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="/resources/js_yyl/jquery-3.1.1.min.js"></script>
    <script src="/resources/js_yyl/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<style>
    td{
        padding: 3px;
        width:80px;
    }
</style>
<body>
<div id="tpsquery"></div>
</body>
<script>
    var Ohref=window.location.href;
    var arrhref=Ohref.split("?month=");
    var arrh = arrhref[1];
    $(TpSalarySheetQuery(arrh));
    function TpSalarySheetQuery(arrh){
        $.ajax({
            url: "/TpSalarySheetController/gzt_query.do",
            type: "post",
            data: {
                month: decodeURI(arrh)
            },
            dataType: "json",
            success: function (data) {
                var tps = data.TpSalarySheetlist;//工资条
                var tpp = data.TpPaymentlist;//薪酬项目
                var tpb = data.TbPersoninfoBaselist;//员工保险
                var a = "<form id='tpsadd'><table  cellspacing=\"0\"cellpadding=\"0\" border=\"1xp solid #9c9c9c;\">" +
                    "<tr style='font-weight:800;'><td>员工</td>";
                for (var i = 0; i < tpp.length; i++) {
                    a+="<td>"+tpp[i].paymentName+"</td>"
                }
                a+="<td>工资基数</td>"
                    +"<td>个人养老</td><td>单位养老</td><td>个人医疗</td><td>单位医疗</td><td>个人失业</td><td>单位失业</td>" +
                    "<td>个人住房</td><td>单位住房</td><td>单位工伤</td><td>单位生育</td><td>险后</td>";
                a+="</tr>";
                for (var i = 0; i < tps.length; i++) {
                        a+="<tr><td>"+tps[i].PersonName;
                        for(var j = 0;j < data.a ; j++){
                            a+="</td><td>"+eval("tps[i].sheet"+j)
                        }
                            a+="</td><td>"+tpb[i].basicSalary//工资基数
                            +"</td><td>"+tpb[i].yanglaoPerson
                            +"</td><td>"+tpb[i].yanglaoUnits
                            +"</td><td>"+tpb[i].yiliaoPerson
                            +"</td><td>"+tpb[i].yiliaoUnits
                            +"</td><td>"+tpb[i].shiyePerson
                            +"</td><td>"+tpb[i].shiyeUnits
                            +"</td><td>"+tpb[i].zhufangPerson
                            +"</td><td>"+tpb[i].zhufangUnits
                            +"</td><td>"+tpb[i].gongshangUnits
                            +"</td><td>"+tpb[i].shengyuUnits
                            +"</td><td>"+tpb[i].riskBack
                }
                $("#tpsquery").html(a+="</table></form>")
            }
        })
    }

</script>
</html>
