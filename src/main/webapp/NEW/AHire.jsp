<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/27 0027
  Time: 上午 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../js/jsCity/jquery.min.js"></script>
<script type="text/javascript" src="../js/jsCity/Popt.js"></script>
<script type="text/javascript" src="../js/jsCity/city.json.js"></script>
<script type="text/javascript" src="../js/jsCity/citySet.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
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
    .wrap{width:200px;height:34px;margin:20px auto;border:0;position:relative;}
    .input{position:absolute;top:0;left:0;width:200px;margin:0;padding-left:5px;height:30px;line-height:30px;font-size:12px;border:1px solid #c9cacb;}
    s{position:absolute;top:1px;right:0;width:32px;height:32px;background:url("../js/img/arrow.png") no-repeat;}
    ._citys { width: 200px; display: inline-block; border: 2px solid #eee; padding: 5px; position: relative; }
    ._citys span { color: #05920a; height: 15px; width: 15px; line-height: 15px; text-align: center; border-radius: 3px; position: absolute; right: 10px; top: 10px; border: 1px solid #05920a; cursor: pointer; }
    ._citys0 { width: 95%; height: 34px; line-height: 34px; display: inline-block; border-bottom: 2px solid #05920a; padding: 0px 5px; font-size:14px; font-weight:bold; margin-left:6px; }
    ._citys0 li { display: inline-block; line-height: 34px; font-size: 15px; color: #888; width: 80px; text-align: center; cursor: pointer; }
    ._citys1 { width: 100%; display: inline-block; padding: 10px 0; }
    ._citys1 a { width: 83px; height: 35px; display: inline-block; background-color: #f5f5f5; color: #666; margin-left: 6px; margin-top: 3px; line-height: 35px; text-align: center; cursor: pointer; font-size: 12px; border-radius: 5px; overflow: hidden; }
    ._citys1 a:hover { color: #fff; background-color: #05920a; }
    .AreaS { background-color: #05920a !important; color: #4D4D4D !important; }
</style>
<head>
    <title>Title</title>
</head>
<body>
<a href="../Html.jsp">首页</a>
<input type="text" id="myuser" value="小路">
<%--<script src="/demos/googlegg.js"></script>--%>
<legend><center>人才库操作</center></legend>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                    详情信息
                </h4>
            </div>
            <div class="modal-body">
                <div style="border: 1px solid #9c9c9c;">
                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">编号</td>
                            <td class="td2 xq0"></td>
                            <td class="td1">姓名</td>
                            <td class="td2 xq1"></td>
                        </tr><tr>
                        <td class="td1">性别</td>
                        <td class="td2 xq5"></td>
                        <td class="td1">出生日期</td>
                        <td class="td2 xq6"></td>
                    </tr>
                       <tr>
                        <td class="td1">籍贯</td>
                        <td class="td2 xq7"></td>
                        <td class="td1">民族</td>
                        <td class="td2 xq8"></td>
                        </tr><tr>
                        <td class="td1">政治面貌</td>
                        <td class="td2 xq9"></td>
                        <td class="td1">身份证</td>
                        <td class="td2 xq10"></td>
                    </tr>
                        <tr>
                        <td class="td1">手机号</td>
                        <td class="td2 xq11"></td>
                        <td class="td1">毕业学校</td>
                        <td class="td2 xq12"></td>
                        </tr><tr>
                        <td class="td1">专业</td>
                        <td class="td2 xq13"></td>
                        <td class="td1">学历</td>
                        <td class="td2 xq14"></td>
                    </tr>
                        <tr>
                        <td class="td1">毕业日期</td>
                        <td class="td2 xq15"></td>
                        <td class="td1">家庭住址</td>
                        <td class="td2 xq16"></td>
                        </tr><tr>
                        <td class="td1">邮编</td>
                        <td class="td2 xq17"></td>
                        <td class="td1">应聘岗位</td>
                        <td class="td2 xq18"></td>
                    </tr><tr>

                        <td class="td1">期望从事行业</td>
                        <td class="td2 xq19"></td>
                        <td class="td1">期望从事职业</td>
                        <td class="td2 xq20"></td>
                        </tr><tr>
                        <td class="td1">期望工作城市</td>
                        <td class="td2 xq21"></td>
                        <td class="td1">期望薪水（税前）</td>
                        <td class="td2 xq22"></td>
                    </tr><tr>
                        <td class="td1">到岗时间</td>
                        <td class="td2 xq23"></td>
                        <td class="td1">招聘渠道</td>
                        <td class="td2 xq24"></td>
                        </tr><tr>
                        <td class="td1">特长</td>
                        <td class="td2 xq25"></td>
                        <td class="td1">职业技能</td>
                        <td class="td2 xq26"></td>
                    </tr>
                        <tr>
                        <td class="td1">项目经验</td>
                        <td class="td2 xq27"></td>
                        <td class="td1">工作经验</td>
                        <td class="td2 xq28"></td>
                        </tr><tr>
                        <td class="td1">备注</td>
                        <td class="td2 xq29"></td>
                        <td class="td1">录入人</td>
                        <td class="td2 xq30"></td>
                    </tr>


                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<button class="btn btn-primary" data-toggle="modal" id="myuser1" data-target="#myModa2">人才库录入</button>
<form >
    <table cellspacing="0"cellpadding="0" style="margin:0 auto;">
        <tr>
            <td class="td1">姓名：</td>
            <td class="td2" ><input type="text" class="form-control  empName" id="empName" name="empName"  placeholder=""></td>
            <td class="td1">性别：</td>
            <td class="td2" >
                <select class="form-control enpSex" id="enpSex" name="enpSex">
                    <option value="">---请选择---</option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select></td>
            <td class="td1">民族：</td>
            <td class="td2" >
                <select class="form-control nation" id="nation" name="nation">
                    <option value="">---请选择---</option>
                    <option value="汉族">汉族</option>
                    <option value="回族">回族</option>
                    <option value="其他">其他</option>
                </select>
            </td>

            <td class="td1">专业：</td>
            <td class="td2" >
                <select class="form-control speciality" id="speciality" name="speciality">
                    <option value="">---请选择---</option>
                    <option value="计算机">计算机</option>
                    <option value="维修">维修</option>
                    <option value="开发">开发</option>
                </select>
            </td>
            <td class="td1">学历：</td>
            <td class="td2" >
                <select class="form-control scientificName" id="scientificName" name="scientificName">
                    <option value="">---请选择---</option>
                    <option value="本科">本科</option>
                    <option value="大专">大专</option>
                    <option value="研究生">研究生</option>
                    <option value="博士">博士</option>
                    <option value="硕士">硕士</option>
                </select>
            </td>
            <td class="td1">应聘岗位：</td>
            <td class="td2" >
                <select class="form-control ministration" id="ministration" name="ministration">
                    <option value="">---请选择---</option>
                    <option value="学徒工">学徒工</option>
                    <option value="普通工">普通工</option>
                    <option value="技工">技工</option>
                    <option value="技师">技师</option>
                </select>
            </td>

       <%-- </tr>
    <tr>
        <td class="td1">籍贯：</td>
        <td class="td2" > <div class="wrap"><input class="input" name="" id="city" type="text" placeholder="请选择" autocomplete="off" readonly="true">
            <s></s></div></td>--%>
        <td ><button class="btn btn-primary" style="cursor:pointer;" type="button" onclick="TdStaffQuery()">查询</button></td>

    </tr>
    </table>
</form>
<script type="text/javascript">
    $("#city").click(function (e) {
        SelCity(this,e);
    });
    $("s").click(function (e) {
        SelCity(document.getElementById("city"),e);
    });
</script>
<%--<form id="tj_tdquery"><input type="text" name="persoId"><button onclick="TdStaffQuery()">查询</button></form>--%>
<%--查询合同--%>
<div id="tdquery"></div>
<%--新建合同--%>
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="test_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                       人才库录入
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">姓名：</td>
                            <td class="td2"><input type="text" class="form-control" name="empName" placeholder="请输入名称" onblur="isChinese(this.value)" ></td>

                        <tr>
                            <td class="td1">性别：</td>
                            <td class="td2">
                                <label class="radio-inline">
                                    <input type="radio"  value="男" name="enpSex"> 男性
                                </label>
                                <label class="radio-inline">
                                    <input type="radio"  value="女" name="enpSex"> 女性
                                </label>
                            </td>
                            <td class="td1">出生日期：</td>
                            <td class="td2"><input type="date" class="form-control" name="birthTime" ></td>
                        </tr>
                        <tr>
                            <td class="td1">籍贯：</td>
                            <td class="td2" > <%--<div class="wrap"><input class="input"  class="form-control"  name="homePlase" id="city" type="text" placeholder="请选择" autocomplete="off" readonly="true">
                                <s></s></div>--%>
                                <input type="text" class="form-control" name="homePlase" placeholder="请输入户口所在地" onblur="CheckFormhome(this.value)">
                            </td>
                            <td class="td1">民族：</td>
                            <td class="td2">
                                <select class="form-control " name="nation">
                                    <option value="">---请选择---</option>
                                    <option value="汉族">汉族</option>
                                    <option value="回族">回族</option>
                                    <option value="其他">其他</option>
                                </select>
                               </td>
                        </tr>
                        <tr>
                            <td class="td1">政治面貌：</td>
                            <td class="td2">
                                <select class="form-control " name="politics">
                                    <option value="">---请选择---</option>
                                    <option value="党员">党员</option>
                                    <option value="团员">团员</option>
                                    <option value="群众">群众</option>
                                </select>
                            </td>
                            <td class="td1">身份证：</td>
                            <td class="td2"><input type="text" class="form-control" name="nodyId" placeholder="请输入身份证号码" onblur="CheckFormnoid(this.value)"></td>
                        </tr>
                        <tr>
                            <td class="td1">手机号：</td>
                            <td class="td2"> <input type="text" class="form-control" name="telephone" placeholder="请输入手机号" onblur="CheckFormtelphone(this.value)"></td>
                            <td class="td1">毕业学校：</td>
                            <td class="td2"><input type="text" class="form-control" name="graduateSchool" placeholder="请输入学校名称" onblur="CheckFormschool(this.value)"></td>
                        </tr>
                        <tr>
                            <td class="td1">专业：</td>
                            <td class="td2">
                                <select class="form-control "  name="speciality">
                                    <option value="">---请选择---</option>
                                    <option value="计算机">计算机</option>
                                    <option value="维修">维修</option>
                                    <option value="开发">开发</option>
                                </select>
                            </td>
                            <td class="td1">学历：</td>
                            <td class="td2">
                                <select class="form-control "  name="scientificName">
                                    <option value="">---请选择---</option>
                                    <option value="本科">本科</option>
                                    <option value="大专">大专</option>
                                    <option value="研究生">研究生</option>
                                    <option value="博士">博士</option>
                                    <option value="硕士">硕士</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">毕业日期：</td>
                            <td class="td2"> <input type="date" class="form-control" name="graduateTime" ></td>
                            <td class="td1">家庭住址：</td>
                            <td class="td2"><input type="text" class="form-control" name="homeAddress" placeholder="请输入家庭住址" onblur="CheckFormhomes(this.value)"></td>
                        </tr>
                        <tr>
                            <td class="td1">邮编：</td>
                            <td class="td2"><input type="text" class="form-control" name="post" placeholder="请输入邮编"></td>
                            <td class="td1">应聘岗位：</td>
                            <td class="td2">
                                <select class="form-control " name="ministration">
                                    <option value="">---请选择---</option>
                                    <option value="学徒工">学徒工</option>
                                    <option value="普通工">普通工</option>
                                    <option value="技工">技工</option>
                                    <option value="技师">技师</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">期望从事行业：</td>
                            <td class="td2"> <input type="text" class="form-control" name="expectedIndustry" placeholder="请输入"></td>
                            <td class="td1">期望从事职业：</td>
                            <td class="td2"><input type="text" class="form-control" name="expectedOccupation" placeholder="请输入"></td>
                        </tr>
                        <tr>
                            <td class="td1">期望工作城市：</td>
                            <td class="td2"><input type="text" class="form-control" name="expectedCity" placeholder="请输入"></td>
                            <td class="td1">期望薪水（税前）：</td>
                            <td class="td2"><input type="text" class="form-control" name="expectedSalary" placeholder="请输入"></td>
                        </tr>
                        <tr>
                            <td class="td1">到岗时间：</td>
                            <td class="td2"> <input type="date" class="form-control" name="workTime" ></td>
                            <td class="td1">招聘渠道：</td>
                            <td class="td2"><input type="text" class="form-control" name="recruitment" placeholder="请输入"></td>
                        </tr>
                        <tr>
                            <td class="td1">特长：</td>
                            <td class="td2" colspan="3">
                                <textarea class="form-control" name="specialty"  rows="3"></textarea>
                            </td>
                        </tr><tr>
                            <td class="td1">职业技能：</td>
                            <td class="td2" colspan="3">
                                <textarea class="form-control" name="skill"  rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">项目经验：</td>
                            <td class="td2" colspan="3">
                                <textarea class="form-control" name="projectExperience"  rows="3"></textarea>
                            </td>
                        </tr><tr>
                            <td class="td1">工作经验：</td>
                            <td class="td2" colspan="3">
                                <textarea class="form-control" name="workExperience" rows="3"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">备注：</td>
                            <td class="td2" colspan="3">
                                <textarea class="form-control" name="remark" rows="3"></textarea>
                            </td>
                        </tr><tr>
                            <td class="td1">录入人：</td>
                            <td class="td2"><input type="text" id="myuser2" class="form-control" name="hireName" placeholder="录入人"></td>
                        </tr>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TSetaffAdd()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="myModa3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width: 700px;">
        <form id="xiugai_from">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                       修改人才库
                    </h4>
                </div>
                <div class="modal-body">

                    <table cellspacing="0"cellpadding="0" border="1xp solid #9c9c9c;">
                        <tr>
                            <td class="td1">编号：</td>
                            <td class="td2"><input type="text" class="form-control xg0" name="empId" placeholder="请输入公司名"></td>
                            <td class="td1">姓名：</td>
                            <td class="td2"><input type="text" class="form-control xg1" name="empName" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">性别：</td>
                            <td class="td2"><input type="text" class="form-control xg5" name="enpSex" placeholder="请输入公司名"></td>
                            <td class="td1">出生日期：</td>
                            <td class="td2"><input type="date" class="form-control xg6" name="birthTime" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">籍贯：</td>
                            <td class="td2"><input type="text" class="form-control xg7" name="homePlase" placeholder="请输入公司名"></td>
                            <td class="td1">名族：</td>
                            <td class="td2"><input type="text" class="form-control xg8" name="nation" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">政治面貌：</td>
                            <td class="td2"><input type="text" class="form-control xg9" name="politics" placeholder="请输入公司名"></td>
                            <td class="td1">身份证：</td>
                            <td class="td2"><input type="text" class="form-control xg10" name="nodyId" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">手机号：</td>
                            <td class="td2"><input type="text" class="form-control xg11" name="telephone" placeholder="请输入公司名"></td>
                            <td class="td1">毕业学校：</td>
                            <td class="td2"><input type="text" class="form-control xg12" name="graduateSchool" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">专业：</td>
                            <td class="td2"><input type="text" class="form-control xg13" name="speciality" placeholder="请输入公司名"></td>
                            <td class="td1">学历：</td>
                            <td class="td2"><input type="text" class="form-control xg14" name="scientificName" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">毕业日期：</td>
                            <td class="td2"><input type="date" class="form-control xg15" name="graduateTime" placeholder="请输入公司名"></td>
                            <td class="td1">家庭住址：</td>
                            <td class="td2"><input type="text" class="form-control xg16" name="homeAddress" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">邮编：</td>
                            <td class="td2"><input type="text" class="form-control xg17" name="post" placeholder="请输入公司名"></td>
                            <td class="td1">应聘岗位：</td>
                            <td class="td2"><input type="text" class="form-control xg18" name="ministration" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">期待从事行业：</td>
                            <td class="td2"><input type="text" class="form-control xg19" name="expectedIndustry" placeholder="请输入公司名"></td>
                            <td class="td1">期待从事职业：</td>
                            <td class="td2"><input type="text" class="form-control xg20" name="expectedOccupation" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">期待工作城市：</td>
                            <td class="td2"><input type="text" class="form-control xg21" name="expectedCity" placeholder="请输入公司名"></td>
                            <td class="td1">期待薪资：</td>
                            <td class="td2"><input type="text" class="form-control xg22" name="expectedSalary" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">到岗时间：</td>
                            <td class="td2"><input type="date" class="form-control xg23" name="workTime" placeholder="请输入公司名"></td>
                            <td class="td1">招聘渠道：</td>
                            <td class="td2"><input type="text" class="form-control xg24" name="recruitment" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">特长：</td>
                            <td class="td2"><input type="text" class="form-control xg25" name="specialty" placeholder="请输入公司名"></td>
                            <td class="td1">职业技能：</td>
                            <td class="td2"><input type="text" class="form-control xg26" name="skill" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">职业经验：</td>
                            <td class="td2"><input type="text" class="form-control xg27" name="projectExperience" placeholder="请输入公司名"></td>
                            <td class="td1">工作经验：</td>
                            <td class="td2"><input type="text" class="form-control xg28" name="workExperience" placeholder="合同类型"></td>
                        </tr>
                        <tr>
                            <td class="td1">备注：</td>
                            <td class="td2"><input type="text" class="form-control xg29" name="remark" placeholder="请输入公司名"></td>
                            <td class="td1">录入人：</td>
                            <td class="td2"><input type="text" class="form-control xg30" name="hireName" placeholder="合同类型"></td>
                        </tr>

                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="TSetaffUpdate()">保存
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
</body>
<script>
    $(TdStaffQuery())
    function TdStaffQuery(){
        $.ajax({
            url:"/ahire/selectAll",
           data:{
                empName:$("#empName").val(),
               enpSex:$("#enpSex").val(),
               nation:$("#nation").val(),
               speciality:$("#speciality").val(),
               scientificName:$("#scientificName").val(),
               ministration:$("#ministration").val()


            },
            type:"post",
            dataType:"json",
            success:function(data){
                var a = "<table  class='table table-striped' style='text-align: center;font-size: 12px'>" +
                    "<tr style='font-weight:800;'>" +
                    "<td>编号</td>" +
                    "<td>姓名</td>" +
                    "<td colspan='3'>操作</td>"+
                    "<td>性别</td>" +
                    "<td>出生日期</td>" +
                    "<td>籍贯</td>" +
                    "<td>民族</td>" +
                    "<td>政治面貌</td>" +
                    "<td>身份证</td>" +
                    "<td>手机号</td>" +
                    "<td>毕业学校</td>" +
                    "<td>专业</td>" +
                    "<td>学历</td>" +
                    "<td>毕业日期</td>" +
                    "<td>家庭住址</td>" +
                    "<td>邮编</td>" +
                    "<td>应聘岗位</td>" +
                    "<td>期望从事行业</td>" +
                    "<td>期望从事职业</td>" +
                    "<td>期望工作城市</td>" +
                    "<td>期望薪水（税前）</td>" +
                    "<td>到岗时间</td>" +
                    "<td>招聘渠道</td>" +
                    "<td>特长</td>" +
                    "<td>职业技能</td>" +
                    "<td>项目经验</td>" +
                    "<td>工作经验</td>" +
                    "<td>备注</td>" +
                    "<td>录入人</td></tr>"


                for (i = 0; i < data.list.length ; i++) {
                    a+="<tr ><td>"+data.list[i].empID//编号
                        +"</td><td>"+data.list[i].empName//姓名
                        +"</td><td style='text-align: right'><button data-target='#myModal' data-toggle='modal' class='btn btn-primary xiangqing' value='"+i+"'  >详细信息</buuton>"
                        +"</td><td><button class='btn btn-primary xiugai' value='"+i+"' data-toggle='modal' data-target='#myModa3'>修改</buuton>"
                        +"</td><td style='text-align: left'><button onclick='tdConfigDelete(this)'class='btn btn-primary' type='button' value='"+data.list[i].empID+"'>删除</button>"
                        +"</td><td>"+data.list[i].enpSex//性别
                        +"</td><td>"+data.list[i].birthTime//出生日期
                        +"</td><td>"+data.list[i].homePlase//籍贯
                        +"</td><td>"+data.list[i].Nation//民族
                        +"</td><td>"+data.list[i].politics//政治面貌
                        +"</td><td>"+data.list[i].nodyId//身份证
                        +"</td><td>"+data.list[i].telephone//手机号
                        +"</td><td>"+data.list[i].graduateSchool//毕业学校
                        +"</td><td>"+data.list[i].speciality//专业
                        +"</td><td>"+data.list[i].scientificName//学历
                        +"</td><td>"+data.list[i].graduateTime//毕业日期
                        +"</td><td>"+data.list[i].homeAddress//家庭住址
                        +"</td><td>"+data.list[i].post//邮编
                        +"</td><td>"+data.list[i].ministration//应聘岗位
                        +"</td><td>"+data.list[i].ExpectedIndustry//期望从事行业
                        +"</td><td>"+data.list[i].ExpectedOccupation//期望从事职业
                        +"</td><td>"+data.list[i].ExpectedCity//期望工作城市
                        +"</td><td>"+data.list[i].ExpectedSalary//期望薪水（税前）
                        +"</td><td>"+data.list[i].WorkTime//到岗时间
                        +"</td><td>"+data.list[i].recruitment//招聘渠道
                        +"</td><td>"+data.list[i].specialty//特长
                        +"</td><td>"+data.list[i].Skill//职业技能
                        +"</td><td>"+data.list[i].ProjectExperience//项目经验
                        +"</td><td>"+data.list[i].WorkExperience//工作经验
                        +"</td><td>"+data.list[i].remark//备注
                        +"</td><td>"+data.list[i].hireName//录入人

                        +"</td></tr>"
                }
                $("#tdquery").html(a+="</table>")
            }
        })
    }
    $('body').on('click','.xiangqing',function () {
        /*  alert( $(this).parent().parent().children().eq(1).html())*/
        for(i=0;i<31;i++){
            $(".xq"+i).html($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }
    })
    $('body').on('click','.xiugai',function () {
        for(i=0;i<31;i++){
            $(".xg"+i).val($(this).parent().parent().parent().children().eq((parseInt($(this).val())+1)).children().eq(i).html());
        }

    })
    function tdConfigDelete(obj){
        if(confirm("确定删除数据")) {
            $.ajax({
                url: "/ahire/deleteHire",
                type: "post",
                data: {empId: $(obj).val()},
                dataType: "json"
            }).always(function () {
                TdStaffQuery();
            })
        }
    }
    function TSetaffAdd(){
        $.ajax({
            url:"/ahire/insertHire",
            type:"post",
            data:$("#test_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    function TSetaffUpdate(){
        alert($("#xiugai_from").serialize())
        $.ajax({
            url:"/ahire/updateHire",
            type:"post",
            data:$("#xiugai_from").serialize(),
            dataType:"json"
        }).always(function(){
            TdStaffQuery();
        })
    }
    $(function () {
        // 绑定单击事件
        $('#myuser1').click(function () {
            // 获取文本框的值
            var value = $('#myuser').val();
            // 设置文本框的值
            $('#myuser2').val(value);
        });
    });

</script>
<script language="javascript">
    function isChinese(obj){
        var reg=/^[\u0391-\uFFE5]+$/;
        var  reg1=/^ +| +$/g;
        if(obj!=""&&!reg.test(obj)){
            alert('必须输入中文！');
            return false;
        }  if (obj.length == 0) {
            alert("不能为空!");
            return false;
        }

    }
    function CheckFormhome(obj){
        var reg=/^[\u0391-\uFFE5]+$/;
        var  reg1=/^ +| +$/g;
        if(obj!=""&&!reg.test(obj)){
            alert('必须输入中文！');
            return false;
        }  if (obj.length == 0) {
            alert("姓名不能为空!");
            return false;
        }

    }
    function CheckFormschool(obj){
        var reg=/^[\u0391-\uFFE5]+$/;
        var  reg1=/^ +| +$/g;
        if(obj!=""&&!reg.test(obj)){
            alert('必须输入中文！');
            return false;
        }  if (obj.length == 0) {
            alert("住址不能为空!");
            return false;
        }

    }

    function CheckFormhomes(obj){
        var reg=/^[\u0391-\uFFE5]+$/;
        var  reg1=/^ +| +$/g;
        if(obj!=""&&!reg.test(obj)){
            alert('必须输入中文！');
            return false;
        }  if (obj.length == 0) {
            alert("籍贯不能为空!");
            return false;
        }

    }
    /*   */
    function CheckFormnoid(mobile)
    {
        if(mobile.length==0)
        {
            alert('身份证号码不能为空！');
            return false;
        }
        if(mobile.length!=18)
        {
            alert('请输入有效的身份号码，需是18位！');
            return false;
        }
    }
    function CheckFormtelphone(mobile)
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

       /* var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(!myreg.test(mobile))
        {
            alert('请输入有效的手机号码！');
            return false;
        }*/
    }
</script>
</html>

