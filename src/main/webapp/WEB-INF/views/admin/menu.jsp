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
                    <h1 class="page-header">Menu Page</h1> 
                    <button style="margin-left: 30px;" class="buttons" onclick="showcategory()">category</button>
                    <button  class="buttons" onclick="showmenu()">menu</button>
                </div>
                
                <div id="page-inner">
                    <div class="row" id="categoryhide" >
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-action" >
                                    카테고리별
                                        <div class="nameChange">
                                            <select style="margin:2% 0;" id="catgo" name="catgo" onchange="changeCtego(this)">
                                                <option value="none">=== 선택 ===</option>
                                                <c:forEach items="${list }" var="CategoryVo">
                                                    <option id="categoTest" name="categoTest" value="${CategoryVo.caseq}">${CategoryVo.cname }</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <button  class="buttons" id="addcategory" onclick="addcatego()">카테고리 추가</button>
                                        </div>
                                        <div id="hidden">
                                        </div>
                                        <div>
                                            <button style="margin-top: 10px;" class="buttons" id="updatecategory" onclick="updatecategory()">카테고리 수정</button>
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
                                <div class="card-action" style="margin-left: 3px;">ALL Menu</div>
                                <span id="new_span">
                                <button style="color:black;" class="buttons" onclick="addmenu()">메뉴 추가</button>
                                </span>
                                
                                <div class="card-content">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th class="center">이미지</th>
                                                    <th class="center">메뉴명</th>
                                                    <th class="center">가격</th>
                                                    <th class="center">카테고리</th>
                                                    <th class="center">메뉴소개</th>
                                                    <!--<th class="center">품절여부</th>-->
                                                    <th class="center">삭제</th>
                                                    <th class="center">수정</th></a>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${maplist}" var="list">
                                                    <tr class="odd gradeX">
                                                        <td class="center"><img src=${list.MIMG} id="new_img" style="width:80px; height:80px;"></td>
                                                        <td class="center">${list.MNAME}</td>
                                                        <td class="center">${list.MPRICE}</td>
                                                        <td class="center">${list.CNAME}</td>
                                                        <td class="center">${list.MINTRO}</td>
                                                        <!--<td class="center">check</td>-->
                                                        <td class="center"><a href="Menu_del?mseq=${list.MSEQ}"><input  class="buttons" type="button" value="삭제"></a></td>
                                                        <td class="center"><input type="button" class="buttons" id="updateM" onclick="updatemenu(`${list.MSEQ}`)" value="수정"></td>
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
                </div>
            </div>
            <div id="modal" class="modal-overlay">
        
            </div>

            <script>
                function changeCtego(obj) {
                    var catgo = obj.value;
                    var catgoDate = {"catgo":catgo};
                    console.log("catgo: "+catgo);
                    $.ajax({
                        url: "selectCname",
                        type:"post",
                        data:catgoDate,
                        success:function(data2){
                            console.log("data2: "+data2);
                            $.ajax({
                                url: "rest",
                                type: "post",
                                data: catgoDate,
                                success: function(data) {
                                    var html="";
                                    var htmll="";
                                    var htmlC="";
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
                                    for(let list of Object.keys(data)){
                                        var capital = data[list];
                                        console.log("test menuVo.mimage: "+capital.MIMG)
                                        html +="<tbody>";
                                        html +="<tr>";
                                        html +="<td align='center'><img src="+capital.MIMG+" id='new_img' style='width:100px; height:100px;'></td>";
                                        html +="<td align='center'>"+capital.MNAME+"</td>";
                                        html +="<td align='center'>"+capital.MPRICE+"</td>";
                                        html +="<td align='center'>"+capital.MINTRO+"</td>";
                                        html +="<td align='center'> <a href='Menu_del?mseq="+capital.MSEQ+"'>삭제</td>";
                                        html +="</tr>";
                                        html +="</tbody>";
                                    }
                                    htmll +='<input id="cname_seq" type="hidden" value="'+catgo+'"/>';
                                    html +="";
                                    html +="</table>";

                                    //$("#catgo").val("catego");   
                                    var categChange = document.getElementById('categoTest').setAttribute('value',catgo);
                                    $("#card-content").html(html);
                                    $("#hidden").html(htmll);
                                }
                            })
                            } 
                        })
                        
                    }
                </script>

                <style>
                    #modal.modal-overlay {
                        width: 100%;
                        height: 100%;
                        position: absolute;
                        left: 0;
                        top: 0;
                        display: none;
                        flex-direction: column;
                        align-items: center;
                        justify-content: center;
                        background: rgba(255, 255, 255, 0.8);
                        box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 1);
                        backdrop-filter: blur(1.5px);
                        -webkit-backdrop-filter: blur(1.5px);
                        border-radius: 10px;
                        border: 1px solid rgba(255, 255, 255, 0.9);
                        z-index: 10000;
                    }
                    #modal .modal-window {
                        background: rgb(237 224 159 / 65%);
                        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
                        backdrop-filter: blur( 13.5px );
                        -webkit-backdrop-filter: blur( 13.5px );
                        border-radius: 10px;
                        border: 1px solid rgba( 255, 255, 255, 0.18 );
                        width: 650px;
                        height: 550px;
                        position: relative;
                        top: -100px;
                        padding: 10px;
                    }
                    #modal .title {
                        padding-left: 10px;
                        display: inline;
                        color: black;
                    }
                    #modal .title h2 {
                        display: inline;
                        color: black;
                    }
                    #modal .close-area {
                        display: inline;
                        float: right;
                        padding-right: 10px;
                        cursor: pointer;
                        color: black;
                    }
                        
                    #modal .content {
                        margin-top: 50px;
                        color: black;
                    }

                    .foo {
                        display: block;
                        position: relative;
                        width: 300px;
                        margin: auto;
                        cursor: pointer;
                        border: 0;
                        height: 60px;
                        border-radius: 5px;
                        outline: 0;
                    }
                    .foo:hover:after {
                        background: #5978f8;
                    }
                    .foo:after {
                        transition: 200ms all ease;
                        border-bottom: 3px solid rgba(0,0,0,.2);
                        background: #3c5ff4;
                        text-shadow: 0 2px 0 rgba(0,0,0,.2);
                        color: #fff;
                        font-size: 20px;
                        text-align: center;
                        position: absolute;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        display: block;
                        content: '메뉴 이미지';
                        line-height: 60px;
                        border-radius: 5px;
                    }    
                </style>

                <script>
                    var categohide = document.getElementById("categoryhide");
                    var menu = document.getElementById("menuhide");
                    var modal = document.getElementById("modal")
                    var html="";
                    var htmll="";
                        
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
                                html += '<div class="modal-window">';
                                html +='<div class="titlee">새로운 카테고리를 넣어주세요</div>';
                                html +='<form action="inset_catego" method="POST" name="insert_catego">';
                                html +='<div class="row">';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="카테고리 명" id="catego" name="catego" type="text">';
                                html +='</div>';
                                html +='<button style="margin-left: 20px;" class="mybutton">입력</button>';
                                html +='</fome>';
                                html +='</div>';
                                $(".modal-overlay").html(html);   
                            }
                        })
                    }

                    function addmenu(){
                        modal.style.display = "flex";
                        $.ajax({
                            success:function(data){
                                var html="";
                                html += '<div class="modal-window">';
                                html +='<div class="titlee" style="color: black;">메뉴를 추가 해주세요</div>';
                                html +='<form action="inset_menu" method="POST" name="insert_menu" enctype="multipart/form-data">';
                                html +='<div class="row">';
                                html +='<div class="input-field col s6">';
                                html +='<select id="caseq" name="caseq">';
                                html +='<option value="none">=== 카테고리 ===</option>';
                                html +='<c:forEach items="${list}" var="CategoryVo">';
                                html +='<option value="${CategoryVo.caseq }">${CategoryVo.cname }</option>';
                                html +='</c:forEach>';
                                html +='</select>';
                                html +='</div>';
                                html +='</div>';
                                html +='<div class="row">';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="메뉴명" style="color: black;" id="mname" name="mname" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="가격" style="color: black;" id="mprice" name="mprice" type="text" class="validate">';
                                html +='</div>';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input placeholder="메뉴 소개" style="color: black;" id="mintro" name="mintro" type="text" class="validate">';
                                html +='</div>';
                                html +='<div class="input-field col s12">';
                                html +='<input style="color: aliceblue;" id="file" name="file" type="file" class="foo">';
                                html +='</div>';
                                html +='<button class="buttons" type="submit" id="close">메뉴추가</button>';
                                html +='</form>';
                                html +='</div>';
                                $(".modal-overlay").html(html);
                            }
                        })
                    }
                        
                    function updatecategory(){
                        var caseq = document.getElementById("cname_seq").value;
                        console.log("update: "+caseq);
                        var caseqData = {"caseq":caseq};
                        modal.style.display='flex';
                        $.ajax({
                            url:"categoClick",
                            type:"post",
                            data:caseqData,
                            success:function(data){
                                var html="";
                                html +='<div class="modal-window">';
                                html +='<div class="titlee">현재 카테고리 목록</div>';
                                html +='<form action="categoUpdate" method="POST" name="update_category">';
                                html +='<div class="row">';
                                html +='<div class="input-field col s12">';
                                html +='카테고리명 : <input placeholder="'+data.cname+'" style="color: red;font-size:30px;" type="text"  id="cname" name ="cname" class="validate">';
                                html +='</div>';
                                html += '<input type="hidden" name="caseq" value="'+data.caseq+'" >';
                                html +='</div>';
                                html +='<button class="buttons"  type="submit" id="close">수정</button>';
                                html +='</form>';
                                html +='</div>';
                                $(".modal-overlay").html(html);         
                            }
                        });
                    }

                    function updatemenu(mseq){
                        console.log("mseq: "+mseq);
                        var mseqDate = {"mseq":mseq};
                        modal.style.display='flex';
                        $.ajax({
                            url:"selectcategory",
                            type:"get",
                            data:mseqDate,
                            success:function(data){
                                var html="";
                                html +='<div class="modal-window">';
                                html +='<div class="titlee" style="color: black;">메뉴를 수정 해주세요</div>';
                                html +='<form action="update_menu" method="POST" name="insert_menu">';
                                html +='<div class="input-field col s6">';
                                html +='</div>';
                                for(let list of Object.keys(data)){
                                    var capital = data[list];
                                    html +='<div class="input-field col s12">';
                                    html +='메뉴명 : <input placeholder="메뉴명" value="'+capital.mname+'" style="color: black;" id="mname" name="mname" type="text" class="validate">';
                                    html +='</div>';
                                    html +='<div class="input-field col s12">';
                                    html +='가격 : <input placeholder="가격" value="'+capital.mprice+'" style="color: black;" id="mprice" name="mprice" type="text" class="validate">';
                                    html +='</div>';
                                    html +='<div class="input-field col s12">';
                                    html +='메뉴 소개 : <input placeholder="메뉴 소개" value="'+capital.mintro+'" style="color: black;" id="mintro" name="mintro" type="text" class="validate">';
                                    html +='</div>';
                                }
                                html += '<input type="hidden" name="mseq" value="'+capital.mseq+'" >';
                                html +='<input class="buttons" type="submit" value="수정" id="close">';
                                html +='</form>';
                                html +='</div>';
                                $(".modal-overlay").html(html);
                            }
                        })
                    }
                    window.onclick =(event)=>{
                        if(event.target == modal){
                            modal.style.display='none';
                        }
                    }
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
    </body>
</html>