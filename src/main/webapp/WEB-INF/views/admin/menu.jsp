﻿<%@ page contentType="text/html;charset=utf-8" %>
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

<body>
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
                        <a class="active-menu waves-effect waves-dark" href="index"><i class="fa fa-dashboard"></i>
                            Sales</a>
                    </li>
                    <li>
                        <a href="review" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>Review</a>
                    </li>
                    <li>
                        <a href="menu" class="waves-effect waves-dark"><i class="fa fa-table"></i>Menu</a>
                    </li>
                    <li>
                        <a href="empty" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i> Empty Page</a>
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

            </div>

            <div id="page-inner">

                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="card">
                            <div class="card-action" style="margin-left: 3px;">
                                ALL Menu
                            </div>
                            <span id="new_span">
                                <button onclick="window.open(url='insert')">add menu</button>
                            </span>
                            <div class="card-content">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover"
                                        id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>이미지</th>
                                                <th>메뉴명</th>
                                                <th>가격</th>
                                                <th>카테고리</th>
                                                <th>메뉴소개</th>
                                                <th>삭제</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${mlist}" var="menuVo">
                                                <tr class="odd gradeX">
                                                    <td>${menuVo.mimage}</td>
                                                    <td>${menuVo.mname}</td>
                                                    <td>${menuVo.mprice}</td>
                                                    <td class="center">${menuVo.cname}</td>
                                                    <td class="center">${menuVo.mintro}</td>
                                                    <td class="center"><input type="button" value="삭제" </td>
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
                <!-- /. ROW  -->
                <div class="row">
                    <div class="col-md-12">
                        <!--   Kitchen Sink -->
                        <div class="card">
                            <div class="card-action">
                                카테고리별
                                <div>
                                <!-- 
                                <select id="catgo" name="catgo">
                                    <option value="none">=== 선택 ===</option>
                                    <option value="korean">한국어</option>
                                    <option value="english">영어</option>
                                    <option value="chinese">중국어</option>
                                    <option value="spanish">스페인어</option>
                                </select> -->
                                <select id="catgo" name="catgo">
                                    <option value="none">=== 선택 ===</option>
                                        <c:forEach items="${list }" var="CategoryVo">
                                            <option value="${CategoryVo.cname }">${CategoryVo.cname }</option>
                                        </c:forEach>
                                </select>
                                 </div>
                                 <div id='container1'>
                                    <button onclick="window.open(url='insertC')">add catrgory</button>
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
                <!-- /. ROW  -->
                <!-- test-->


                <!-- /. PAGE INNER  -->
            </div>
        </div>
            <!-- /. PAGE WRAPPER  -->
            <!-- /. WRAPPER  -->
            <!-- JS Scripts-->


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
            <!-- Custom Js -->
            <script src="/assets/js/custom-scripts.js"></script>

            <script>
                $("#catgo").on("change", function () { //clilc = 밸류체인지
                    $.ajax({
                        url: "rest",
                        type: "post",
                        data: {catgo: $("#catgo").val()},
                        
                        success: function(data) {
                            /*
                            for(let menuVo of Object.keys(data)){
                                var capital = data[menuVo];
                                console.log(menuVo, capital);
                                console.log("mname 나오는지 확인"+capital.mname);
                                console.log("test1")
                            }*/
                            console.log("test")
                            alert(JSON.stringify(data));
                            var html="";
                           
                            html +="<table border='1' width='50%'>";
                            html +="<tr>";
                             
                            html +="<th>이미지</th>";
                            html +="<th>메뉴명</th>";
                            html +="<th>가격</th>";
                            html +="<th>메뉴소개</th>";
                            html +="<th>삭제</th>";            

                            html +="</tr>";
                            for(let menuVo of Object.keys(data)){
                                html +="<tr>";
                                var capital = data[menuVo];
                                console.log("test menuVo.mimage: "+capital.mimage)
                                
                                html +="<td align='center'>"+capital.mimage+"</td>";
                                html +="<td align='center'>"+capital.mname+"</td>";
                                html +="<td align='center'>"+capital.mprice+"</td>";
                                html +="<td align='center'>"+capital.mintro+"</td>";
                                html +="<td align='center'> <a href='content?mseq="+capital.mseq+"'>삭제</td>";
                            
                                html +="</tr>";
                            }
                            html +="";
                            html +="</table>";
                            $("#catgo").val("");   
                            $("#card-content").html(html);
                           

                        }
                    });
                });


            </script>
</body>

</html>