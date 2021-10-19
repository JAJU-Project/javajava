<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Track Material Design Bootstrap Admin Template</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/assets/materialize/css/materialize.min.css" media="screen,projection" />
    <!-- Bootstrap Styles-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="/assets/js/Lightweight-Chart/cssCharts.css">
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
</head>
    <style>

    #categoryhide{
        display: none;
    }
    #menuhide{
        display: none;
    }
   
</style>
<body>
    <div class="modal-wrapper" id="modal-wrapper" style=" display: none;">
        <div class="modal-inner">
            
            <div class="bottom-info">
                
            </div>

        </div>
    
    </div>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand waves-effect waves-dark" href="index"><i
                        class="large material-icons">track_changes</i> <strong>자주해요</strong></a>

                <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i
                            class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a>
                </li>
                <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i
                            class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
                <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i
                            class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
                <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i
                            class="fa fa-user fa-fw"></i> <b>John Doe</b> <i
                            class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
        </nav>
        <!-- Dropdown Structure -->
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
            </li>
            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
            </li>
            <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
            </li>
        </ul>
        <ul id="dropdown2" class="dropdown-content w250">
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-comment fa-fw"></i> New Comment
                        <span class="pull-right text-muted small">4 min</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                        <span class="pull-right text-muted small">12 min</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-envelope fa-fw"></i> Message Sent
                        <span class="pull-right text-muted small">4 min</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-tasks fa-fw"></i> New Task
                        <span class="pull-right text-muted small">4 min</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                        <span class="pull-right text-muted small">4 min</span>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>See All Alerts</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        <ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 1</strong>
                            <span class="pull-right text-muted">60% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60"
                                aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                <span class="sr-only">60% Complete (success)</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 2</strong>
                            <span class="pull-right text-muted">28% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28"
                                aria-valuemin="0" aria-valuemax="100" style="width: 28%">
                                <span class="sr-only">28% Complete</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 3</strong>
                            <span class="pull-right text-muted">60% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                <span class="sr-only">60% Complete (warning)</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <p>
                            <strong>Task 4</strong>
                            <span class="pull-right text-muted">85% Complete</span>
                        </p>
                        <div class="progress progress-striped active">
                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85"
                                aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                <span class="sr-only">85% Complete (danger)</span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="divider"></li>
            <li>
        </ul>
        <ul id="dropdown4" class="dropdown-content dropdown-tasks w250 taskList">
            <li>
                <div>
                    <strong>John Doe</strong>
                    <span class="pull-right text-muted">
                        <em>Today</em>
                    </span>
                </div>
                <p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</p>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <div>
                    <strong>John Smith</strong>
                    <span class="pull-right text-muted">
                        <em>Yesterday</em>
                    </span>
                </div>
                <p>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</p>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="#">
                    <div>
                        <strong>John Smith</strong>
                        <span class="pull-right text-muted">
                            <em>Yesterday</em>
                        </span>
                    </div>
                    <p>Lorem Ipsum has been the industry's standard dummy text ever since the...</p>
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>Read All Messages</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
        </ul>
        <!--/. NAV TOP  -->
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <a class="waves-effect waves-dark" href="index"><i class="fa fa-dashboard"></i>Sales</a>
                    </li>
                    <li>
                        <a href="review" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>Review</a>
                    </li>
                    <li>
                        <a href="menu" class="waves-effect waves-dark"><i class="fa fa-table"></i>Menu</a>
                    </li>
                    <li>
                        <a href="empty" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i>Other</a>
                    </li>
                </ul>
    
            </div>
      </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div class="header">
                <h1 class="page-header">
                    Menu Page
                </h1> 
                <button onclick="showcategory()">category</button>
                <button onclick="showmenu()">menu</button>
            </div>
            

            <div id="page-inner">
                <div class="row" id="categoryhide" >
                    <div class="col-md-12">
                        <!--   Kitchen Sink -->
                        <div class="card">
                            <div class="card-action" >
                                카테고리별
                                <div>
                                <select id="catgo" name="catgo" onchange="changeCtego(this)">
                                    <option value="none">=== 선택 ===</option>
                                        <c:forEach items="${list }" var="CategoryVo">
                                            <option value="${CategoryVo.cname}">${CategoryVo.cname }</option>
                                        </c:forEach>
                                </select>
                                 </div>
                                 <div>
                                   <button style="color: black;" id="addcategory" onclick="addcatego()">카테고리 추가</button>
                                 </div>
                                 <div id="hidden">
                                
                                 </div>
                                 <div>
                                    <button style="color: black;" id="updatecategory" onclick="updatecategory()">카테고리 수정</button>
                                 </div>
                            </div>

                            <div class="card-content" id="card-content">
                                <div class="table-responsive">
                                </div>
                            </div>
                        </div>
                        <!-- End  Kitchen Sink -->
                    </div>
                </div>
                <div class="row" id="menuhide">
                    <div class="col-md-12" >
                        <!-- Advanced Tables -->
                        <div class="card">
                            <div class="card-action" style="margin-left: 3px;">
                                ALL Menu
                            </div>
                            <span id="new_span">
                               <button style="color: black;" onclick="addmenu()">메뉴 추가</button>
                              
                            </span>
                            
                            <div class="card-content">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover"
                                        id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th class="center">이미지</th>
                                                <th class="center">메뉴명</th>
                                                <th class="center">가격</th>
                                                <th class="center">카테고리</th>
                                                <th class="center">메뉴소개</th>
                                                <th class="center">품절여부</th>
                                                <th class="center">삭제</th>
                                                <th class="center">수정</th></a>
                                            </tr>
                                            
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${mlist}" var="menuVo">
                                                <tr class="odd gradeX">
                                                    <td class="center"><img src=${menuVo.mimage} id="new_img"></td>
                                                    <td class="center">${menuVo.mname}</td>
                                                    <td class="center">${menuVo.mprice}</td>
                                                    <td class="center">${menuVo.cname}</td>
                                                    <td class="center">${menuVo.mintro}</td>
                                                    <td class="center">check</td>
                                                    <td class="center"><a href="Menu_del?mseq=${menuVo.mseq}"><input type="button" value="삭제"></a></td>
                                                    <td class="center"><input type="button" id="updateM" onclick="updatemenu()" value="수정"></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--End Advanced Tables -->
                    </div>
                </div>
                <script>
                
                function changeCtego(obj) {
                    var catgo = obj.value;
                    var catgoDate = {"catgo":catgo};
                    console.log("catgo: "+catgo);
                    $.ajax({
                        url: "rest",
                        type: "post",
                        data: catgoDate,
                         success: function(data) {
                           
                            var html="";
                            var htmll="";
                           
                            html +="<table border='1' width='50%'>";
                            html +="<tr>";
                            html +="<thead>";
                            html +="<th>이미지</th>";
                            html +="<th>메뉴명</th>";
                            html +="<th>가격</th>";
                            html +="<th>메뉴소개</th>";
                            html +="<th>삭제</th>";            
                            html +="</tr>";
                            html +="</thead>" ;
                            for(let menuVo of Object.keys(data)){
                                var capital = data[menuVo];
                                console.log("test menuVo.mimage: "+capital.mimage)
                                html +="<tbody>";
                                html +="<tr>";
                                html +="<td align='center'><img src="+capital.mimage+" id='new_img'></td>";
                                html +="<td align='center'>"+capital.mname+"</td>";
                                html +="<td align='center'>"+capital.mprice+"</td>";
                                html +="<td align='center'>"+capital.mintro+"</td>";
                                htmll +='<input id="cname_seq" type="hidden" value="#"/>';
                                html +="<td align='center'> <a href='Menu_del?mseq="+capital.mseq+"'>삭제</td>";
                                html +="</tr>";
                                html +="</tbody>";
                            }
                            html +="";
                            html +="</table>";
                            $("#catgo").val("catego");   
                            $("#card-content").html(html);
                            $("#hidden").html(htmll);
                           

                        }
                    })
                }
                </script>
                <script>
                    var categohide = document.getElementById("categoryhide");
                    var menu = document.getElementById("menuhide");
                    var modal = document.getElementById("modal-wrapper")
                    
                    function showcategory(){ 
                        categohide.style.display = 'block';
                        menu.style.display = 'none';
                    }
                    function showmenu(){
                        menu.style.display = 'block';
                        categohide.style.display = 'none';
                    }
                    function addcatego(){
                        modal.style.display ='flex';
                        $.ajax({
                            success:function(data){
                                var html="";
                                html +='<div class="titlee">새로운 카테고리를 넣어주세요</div>';
                                html +='<form action="inset_catego" method="POST" name="insert_catego">';
                                html +='<div class="row">';
                                html +='<div class="input-field col s12">';
                                html +='<input style="color: aliceblue;" placeholder="카테고리 명" id="catego" name="catego" type="text">';
                                html +='</div>';
                                html +='<button>입력</button>';
                                html +='</fome>';
                                $(".bottom-info").html(html);    
                            }
                        })
                    }
                    function addmenu(){
                        modal.style.display = 'flex';
                        $.ajax({
                            success:function(data){
                                var html="";
                                html +='<div class="titlee" style="color: aliceblue;">메뉴를 추가 해주세요</div>';
                                html +='<form action="inset_menu" method="POST" name="insert_menu">';
                                html +='<div class="row">';
                                html +='<div class="input-field col s6">';
                                html +='<select id="cname" name="cname">';
                                html +='<option value="none">=== 카테고리 ===</option>';
                                html +='<c:forEach items="${list}" var="CategoryVo">';
                                html +='<option value="${CategoryVo.cname }">${CategoryVo.cname }</option>';
                                html +='</c:forEach>';
                                html +='</select>';
                                html +='</div>';
                                html +='</div>';
                                html +='<div class="row">';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="메뉴명" style="color: aliceblue;" id="mname" name="mname" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="가격" style="color: aliceblue;" id="mprice" name="mprice" type="text" class="validate">';
                                html +='</div>';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="메뉴 소개" style="color: aliceblue;" id="mintro" name="mintro" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="품절여부" style="color: aliceblue;" id="check" name="mintro" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="이미지 넣어야돼" style="color: aliceblue;" id="mimage" name="mimage" type="text" class="validate">';
                                html +='</div>';
                                html +='<input class="mybutton" type="submit" value="넣기" id="close">';
                                html +='</form>';
                                $(".bottom-info").html(html);
                            }
                        })
                    }
                    
                    function updatecategory(){
                        const cname = document.getElementById("cname_seq");
                        alert(cname);
                        modal.style.display='flex';
                        $.ajax({
                            url:"selectcategory",
                            type:"get",
                            data:{seq:$('seq').val()},
                            success:function(data){
                                var html="";
                                html +='<div class="titlee">현재 카테고리 목록</div>';
                                html +='<form action="update_category" method="POST" name="update_category">';
                                html +='<div class="row">';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="{list.category}" style="color: aliceblue;" id="category" type="text">';
                                html +='</div>';
                                html +='</div>';
                                html +='<input class="mybutton" type="submit" value="수정" id="close"/>';
                                html +='</form>';
                                $(".bottom-info").html(html);         
                            }
                        });
                    }
                    function updatemenu(){
                        modal.style.display='flex';
                        $.ajax({
                            url:"selectcategory",
                            type:"get",
                            data:{seq:$('seq').val()},
                            success:function(data){
                                var html="";
                                html +='<div class="titlee" style="color: aliceblue;">메뉴를 수정 해주세요</div>';
                                html +='<form action="update_menu" method="POST" name="insert_menu">';
                                html +='<div class="input-field col s6">';
                                html +='<select id="cname" name="cname">';
                                html +='<option value="none">=== 카테고리 ===</option>';
                                html +='<c:forEach items="${list}" var="CategoryVo">';
                                html +='<option value="${CategoryVo.cname }">${CategoryVo.cname }</option>';
                                html +='</c:forEach>';
                                html +='</select>';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="메뉴명" value="#" style="color: aliceblue;" id="mname" name="mname" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="가격" value="#" style="color: aliceblue;" id="mprice" name="mprice" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="메뉴 소개" value="#" style="color: aliceblue;" id="mintro" name="mintro" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="품절여부" value="#" style="color: aliceblue;" id="check" name="mintro" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="이미지 넣어야돼" value="#" style="color: aliceblue;" id="mimage" name="mimage" type="text" class="validate">';
                                html +='</div>';
                                html +='<input class="mybutton" type="submit" value="넣기" id="close">';
                                html +='</form>';
                                $(".bottom-info").html(html);
                            }
                        })
                    }
                    window.onclick =(event)=>{
                        if(event.target == modal){
                            modal.style.display='none';
                        }
                    }
                    /*
                    $("#catgo").on("change", function () { //clilc = 밸류체인지
                    $.ajax({
                        url: "rest",
                        type: "post",
                        data: {catgo: $("#catgo").val()},
                        
                        success: function(data) {
                           
                            var html="";
                            var htmll="";
                           
                            html +="<table border='1' width='50%'>";
                            html +="<tr>";
                            html +="<thead>";
                            html +="<th>이미지</th>";
                            html +="<th>메뉴명</th>";
                            html +="<th>가격</th>";
                            html +="<th>메뉴소개</th>";
                            html +="<th>삭제</th>";            
                            html +="</tr>";
                            html +="</thead>" ;
                            for(let menuVo of Object.keys(data)){
                                var capital = data[menuVo];
                                console.log("test menuVo.mimage: "+capital.mimage)
                                html +="<tbody>";
                                html +="<tr>";
                                html +="<td align='center'><img src="+capital.mimage+" id='new_img'></td>";
                                html +="<td align='center'>"+capital.mname+"</td>";
                                html +="<td align='center'>"+capital.mprice+"</td>";
                                html +="<td align='center'>"+capital.mintro+"</td>";
                                htmll +='<input id="cname_seq" type="hidden" value="#"/>';
                                html +="<td align='center'> <a href='content?mseq="+capital.mseq+"'>삭제</td>";
                                html +="</tr>";
                                html +="</tbody>";
                            }
                            html +="";
                            html +="</table>";
                            $("#catgo").val("");   
                            $("#card-content").html(html);
                            $("#hidden").html(htmll);
                           

                        }
                    });
                });*/


                    


                    
                
                </script>

            <!-- jQuery Js -->
            <script src="/assets/js/jquery-1.10.2.js"></script>

            <!-- Bootstrap Js -->
            <script src="/assets/js/bootstrap.min.js"></script>

            <script src="/assets/materialize/js/materialize.min.js"></script>

            <!-- Metis Menu Js -->
            <script src="/assets/js/jquery.metisMenu.js"></script>
            <!-- Morris Chart Js -->
            <script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
            <script src="/assets/js/morris/morris.js"></script>


            <script src="/assets/js/easypiechart.js"></script>
            <script src="/assets/js/easypiechart-data.js"></script>

            <script src="/assets/js/Lightweight-Chart/jquery.chart.js"></script>
            <!-- DATA TABLE SCRIPTS -->
            <script src="assets/js/dataTables/jquery.dataTables.js"></script>
            <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
            <script>
                $(document).ready(function () {
                    $('#dataTables-example').dataTable();
                });
            </script>
            <!-- Custom Js 
            <script src="/assets/js/custom-scripts.js"></script>-->
            
        
</body>

</html>