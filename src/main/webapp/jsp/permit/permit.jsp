<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>布局测试页</title>
    <script type="text/javascript" src="../../resources/js_sunxin/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../../resources/js_sunxin/jquery.serialize.js"></script>
    <script src="../../resources/js_sunxin/assets/js/core/bootstrap.min.js"></script>
    <link href="../../resources/js_sunxin/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="../../resources/js_sunxin/assets/css/now-ui-dashboard.css?v=1.0.1" rel="stylesheet"/>
    <link href="../../resources/js_sunxin/assets/demo/demo.css" rel="stylesheet"/>
</head>

<body style="height: 100%">
<div class="wrapper" style="height: 100%">
    <div class="sidebar" data-color="orange">
        <div class="logo">
            <a href="#" class="simple-text logo-mini">
                CT
            </a>
            <a href="#" class="simple-text logo-normal">
                Creative Tim
            </a>
        </div>
        <div class="sidebar-wrapper">
            <ul class="nav showthree">

            </ul>
        </div>
    </div>
    <div class="main-panel">
        <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute bg-primary fixed-top">
            <div class="container-fluid">
                <div class="navbar-wrapper">
                   <%-- <a class="navbar-brand" href="javascript:void(0)">左侧</a>--%>
                </div>
                <div class="collapse navbar-collapse justify-content-end" id="navigation">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void(0);" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="now-ui-icons users_single-02"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="javascript:void(0);">${username}</a>
                                <a class="dropdown-item Signout" href="javascript:void(0);" >退出登陆</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- End Navbar -->
        <div class="panel-header panel-header-sm">
        </div>
        <div class="content" style="height: 100%">
            <div class="row" style="height: 100%">
                <div class="col-md-12" style="height: 100%">
                    <div class="card">
                        <div class="card-body" style="height: 100%">
                            <div class="row"  style="height: 100%">
                                <iframe name="inde" frameborder="0" height="900px" width="100%" style="overflow: hidden"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                这是页脚
            </div>
        </footer>
    </div>
</div>
</body>
<script>
    $(".Signout").click(function () {
        if (confirm("确认登出？")){
        Signout();
        }
    });
       function Signout(){
           $.ajax({
               url:"/Signout.do",
               type:"post",
               dataType:'json'
           }).always(function () {
               window.location.reload();
           });
        }
    //左侧导航选中变色
    $(function(){
        $("body").on("click",".showthree li a",function () {
            $("li").removeClass("active");
            $(this).parent().addClass("active");
        });
    });
</script>
<script>
    //获取一级菜单
    $(function(){
        $.ajax({
            url:"/permitgetTree.do",
            type:"post",
            dataType:'json'
        }).done(function(data){
            var  tree = data.getTree;
            for (i=0;i<tree.length;i++){
                var stree = "<li>";
                stree+="<a href='javascript:void(0);' style='text-align: center;' id='"+tree[i].m_id+"' class='getTrees'>";
                stree+="<p style='font-size: 14px;'>";
                stree+=tree[i].m_Name;
                stree+="</p></a>";
                stree+="<ul class='nav showthrees"+tree[i].m_id+" showthreesremove'  style='display: block'>"+"</ul>";
                stree+="</li>";
                $(".showthree").append(stree);
            }
        }).fail(function (xhr,status) {
            alert(xhr.status);
            alert(status)
        });
    })
</script>
<script>
    //获取二级菜单
    $(function(){
        $("body").on("click",".getTrees",function () {
            var treeid = $(this).attr("id");
            $.post("/getTrees.do",{m_id:treeid}).done(function (data) {
                var trees = data.getTrees;
                $(".showthreesremove li").remove();
                for (i=0;i<trees.length;i++){
                    var strees = "<li>";
                    strees+="<a href='"+trees[i].m_url+"' target='inde' style='text-align:right;line-height: 10px;' >";
                    strees+="<p style='font-size: 12px;'>";
                    strees+=trees[i].m_Name;
                    strees+="</p></a>";
                    strees+="</li>";
                    $(".showthrees"+trees[i].m_level).append(strees);
                }
            }).fail(function (xhr,status) {
                alert(xhr.status);
                alert(status)
            });
        });
    });
</script>

<!--   Core JS Files   -->
<script src="../../resources/js_sunxin/assets/js/core/jquery.min.js"></script>
<script src="../../resources/js_sunxin/assets/js/core/popper.min.js"></script>
<script src="../../resources/js_sunxin/assets/js/core/bootstrap.min.js"></script>
<script src="../../resources/js_sunxin/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Chart JS -->
<script src="../../resources/js_sunxin/assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="../../resources/js_sunxin/assets/js/plugins/bootstrap-notify.js"></script>
<script src="../../resources/js_sunxin/assets/js/now-ui-dashboard.js?v=1.0.1"></script>
<script src="../../resources/js_sunxin/assets/demo/demo.js"></script>
</html>