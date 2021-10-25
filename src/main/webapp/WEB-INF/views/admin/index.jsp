<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Target Material Design Bootstrap Admin Template</title> 
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
</head>

    <body>
        <div id="wrapper">
            <nav class="navbar navbar-default top-navbar" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand waves-effect waves-dark" href="index"><i class="large material-icons">track_changes</i> <strong>자주해요</strong></a>
                </div>
                <ul class="nav navbar-top-links navbar-right"> 
                <li><a class="dropdown-button waves-effect waves-dark" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>관리자</b> <i class="material-icons right">arrow_drop_down</i></a></li>
                </ul>
            </nav>
            <ul id="dropdown1" class="dropdown-content">
                <li><a href="logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
            </ul>


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
                    <h1 class="page-header">Sales</h1>
                </div>
                <div id="page-inner">
                    <div class="dashboard-cards"> 
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3" id="salesByMenu">
                                <div class="card horizontal cardIcon waves-effect waves-dark">
                                    <div class="card-image red">
                                        <i class="material-icons dp48">import_export</i>
                                    </div>
                                    <div class="card-stacked red">
                                        <div class="card-content">
                                            <h3>상품별 매출</h3> 
                                        </div>
                                        <div class="card-action">
                                            <strong>Sales by product</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <div class="card horizontal cardIcon waves-effect waves-dark" id="dayCustomer">
                                    <div class="card-image blue">
                                        <i class="material-icons dp48">equalizer</i>
                                    </div>
                                    <div class="card-stacked blue">
                                        <div class="card-content">
                                            <h3>금일 고객수</h3> 
                                        </div>
                                        <div class="card-action">
                                            <strong>ONE DAY CUSTOMER</strong>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                            <!-- 
                            <div class="col-xs-12 col-sm-6 col-md-3">
                                <div class="card horizontal cardIcon waves-effect waves-dark" id="second">
                                    <div class="card-image orange">
                                        <i class="material-icons dp48">shopping_cart</i>
                                    </div>
                                    <div class="card-stacked orange">
                                        <div class="card-content">
                                            <h3>{list.sal}</h3> 
                                        </div>
                                        <div class="card-action">
                                            <strong>MONTHLY SALES</strong>
                                        </div>
                                    </div>
                                </div> 
                            </div>-->
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
                        <div class="card horizontal cardIcon waves-effect waves-dark" id="age">
                            <div class="card-image green">
                                <i class="material-icons dp48">supervisor_account</i>
                            </div>
                            <div class="card-stacked green">
                                <div class="card-content">
                                    <h3>나이별 고객수</h3> 
                                </div>
                                <div class="card-action">
                                    <strong>BY AGE</strong>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>

                <!-- /. ROW  --> 
            <div class="row" id= "board">         
                <div id="morris-donut-chart"></div>
                <div id="morris-line-chart"></div>
                <div id="morris-bar-chart"></div>
                <div id="morris-area-chart"></div>
            </div> <!-- 이거 지우면 인덱스 화면에 그래프 다 나옴 ㅡㅡ -->   
        </div>
        <!-- /. PAGE INNER  -->
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

        <script>
        $(function() {
            $('#salesByMenu').click(function() {
            $.ajax({
            type : 'POST',                 
            url : "salesByMenu", //todo: 재영쓰바꿔  
            data: {catgo: $("#catgo").val()},          
            success : function(data) {   
                var html="";
                
                html +="<table border='1' width='50%'>";
                html +="<tr>";
                html +="<div class='col-md-8 col-sm-12 col-xs-12'>";
                html +="<div class='card'>";
                html +="<div class='card-action'>";
                html +="<b>Sales by menu</b>";
                html +="</div>";
                html +="<div class='card-image'>";
                html +="<ul class='collection'>";
                for(let SalesVo of Object.keys(data)){
                    var capital = data[SalesVo];
                    html +="<li class='collection-item avatar'>";
                    html +="<i class='material-icons circle green'>track_changes</i>";
                    html +="<span class='title'>"+capital.mname+"</span>";
                    html +="<p>"+capital.sacoin+"원<br></p>";
                    html +="<a href='#!'' class='secondary-content'><i class='material-icons'>grade</i></a>";
                    html +="</li>";
                }
                html +="</ul>";
                html +="</div>";
                html +="</div>";
                html +="</div>";
                html +="</div>";
            
                $("#board").html(html);
            }});
            });    
        });
        </script>
    
        <script>
            $(function() {
                $('#dayCustomer').click(function() {
                var activeTab = $(this).attr('data-tab');
                $.ajax({
                    type : 'POST',                 
                    url : "dayCustomer",  
                    data: {catgo: $("#catgo").val()},          
                    success : function(data) {   
                        var html="";
                        
                        html +="<div class='row'>";
                        html +="<div class='col-xs-12 col-sm-12 col-md-7'>";
                        html +="<div class='cirStats'>";
                        html +="<div class='row'>";
                        html +="<div class='col-xs-12 col-sm-6 col-md-6'>";
                        html +="<div class='card-panel text-center'>";
                        html +="<h4>CUSTOMERS</h4>";
                        html +="<div class='easypiechart' id='easypiechart-blue' \
                        data-percent='"+data+"' > \
                        <span class='percent'>"+data+"</span>";
                        html +="</div>";
                        html +="</div>";
                        html +="</div>";
                        html +="</div>";
                        html +="</div>";
                        $("#board").html(html);
                        $("#board").trigger("create")
                        $('#easypiechart-blue').easyPieChart({
                            scaleColor: false,
                            barColor: '#30a5ff'
                        });
                    }});
                });    
            });
        </script>
    
        <script>
            $(function() {
                $('#age').click(function() {
                    var activeTab = $(this).attr('data-tab');
                    $.ajax({
                    type : 'POST',                 
                    url : "age", //재영쓰바꿔  
                    data: {catgo: $("#catgo").val()},          
                    success : function(data) {   
                        var html="";
                        html +="<div class='col-xs-12 col-sm-12 col-md-5'>";
                        html +="<div class='row'>";
                        html +="<div class='col-xs-12'>";
                        html +="<div class='card'>";
                        html +="<div class='card-image donutpad'>";
                        html +="<div id='morris-donut-chart'></div>";
                        html +="</div>";
                        html +="<div class='card-action'>";
                        html +="<b>BY AGE</b>"
                        html +="</div>";
                        html +="</div>";
                        html +="</div>";
                        html +="</div>";
                        html +="</div>";
                        $("#board").html(html);

                        Morris.Donut({
                            element: 'morris-donut-chart',
                            data: [{
                                label: "10대",
                                value: data.teenager
                            }, {
                                label: "20대",
                                value: data.twenties
                            },
                            {
                                label: "30대",
                                value: data.thirties
                            },
                            {
                                label: "40대",
                                value: data.forties
                            },
                            {
                                label: "50대",
                                value: data.fifties
                            },
                            {
                                label: "60대",
                                value: data.sixties
                            }, {
                                label: "그외",
                                value: data.etc
                            }],
                            colors: [
                                '#A6A6A6','#414e63',
                                '#e96562' 
                            ],
                            resize: true
                        });
                    }});
                });    
            });
        </script>
    </body>
</html>