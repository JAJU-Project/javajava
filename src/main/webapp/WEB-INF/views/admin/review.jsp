
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/materialize/js/materialize.min.js"></script>
<!-- Metis Menu Js -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="assets/js/morris/morris.js"></script>
<script src="assets/js/easypiechart.js"></script>
<script src="assets/js/easypiechart-data.js"></script>
<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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
    <link href="/assets/css/style.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="/assets/js/Lightweight-Chart/cssCharts.css">
    
    <style>
        .card-inner{
            margin-left: 4rem;
        }

        .post-sub-heading {
            border-bottom: 1px solid #dedede;
            padding-bottom: 20px;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-size: 16px;
            margin-bottom: 20px;
        }

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
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            z-index: 10000;
        }
        #modal .modal-window {
            background: rgb(237 224 159 / 65%);
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 450px;
            height: 250px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: black;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: black;
        }
        
        #modal .content {
            margin-top: 50px;
            color: black;
        }
    </style>
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
                <a class="navbar-brand waves-effect waves-dark" href="index"><i class="large material-icons">track_changes</i> <strong>자주해요</strong></a>
            
      <div id="sideNav" href=""><i class="material-icons dp48">toc</i></div>
            </div>

            <ul class="nav navbar-top-links navbar-right"> 
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>            
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
            <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
              <li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i class="fa fa-user fa-fw"></i> <b>John Doe</b> <i class="material-icons right">arrow_drop_down</i></a></li>
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
               <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
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
               <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" style="width: 28%">
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
               <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
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
               <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
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
                        <h1 class="page-header" id = "subject">
                           REVIEW PAGE
                        </h1>         
        </div>
        <div id="page-inner"> 
            <div class="col-md-12" id = "bigboxbox">
                <div class="card" id = "bigbox">
<!--
        
           
                <div class="card" id = "bigbox">
                    <p class="card-content" id = "chatbox">
                        <div id = "fff">
                            <div class="alert alert-warning" id = "custo">
                            <strong id = "custo-psize">oops 여기 존맛이랑게!</strong> 
                                        <p id = "subcusto">사장님 맛있네여 리뷰 남길게여 엽떡에 분모자 추가 해주랑게여 
                                            그리고 이대조 뼈다귀 먹고 공차 타로 밀크티 한잔 때리면 아주 끝내주여 호호 헤이맘마 추자</p>
                            </div>
                        </div>
                        <div id = "fffb">
                            <div class="alert alert-danger" id = "boss">
                            <strong id = "boss-psize">Okey 고맙다 꼬마야!</strong>
                                        <p id = "subboss">빅보스송신</p>
                            </div>
                        </div>
                    </p>
                </div>         
            </div>
        
-->
                

                        <div class="post-comments">
                            <h3 class="post-sub-heading">${commentsNumber} Comments</h3>
                            <ul class="media-list comments-list m-bot-50 clearlist">
                                <!-- Comment Item start-->
                                <c:forEach var = "list" items="${maplist}">
                                        <li class="media">
                                            <a class="pull-left">
                                                <div id="detail_imgt_pop" style="display:none;" >
                                                    <span id="pop_close"><img class="srcTest" src="${list.RIMG}" width="500" height="500" /></span>
                                                </div>
                                                <img class="media-object comment-avatar" src="${list.RIMG}" alt="" width="50" height="50"
                                                onclick="detailView('${list.RIMG}');" id = "reviewImg">
                                            </a>

                                            <div class="media-body">
                                                <div class="comment-info">
                                                    <h4 class="comment-author">
                                                        <a href="#">${list.RTITLE}</a>
                                                        
                                                    </h4>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <c:choose>
                                                    
                                                        <c:when test="${empty clist}">
                                                            <a class="comment-button" onclick="replyClick(`${list.RSEQ}`)"><i class="tf-ion-chatbubbles"></i>Reply</a>
                                                        </c:when>
                                                        <c:when test ="${!empty clist}">
                                                            <c:forEach var="CommentVo" items="${clist}" end="0">
                                                                <c:choose>
                                                                    <c:when test="${CommentVo.rseq==list.RSEQ}">
                                                                        
                                                                    </c:when>
                                                                    <c:when test="${CommentVo.rseq!=list.RSEQ}">
                                                                        <a class="comment-button" onclick="replyClick(`${list.RSEQ}`)"><i class="tf-ion-chatbubbles"></i>Reply</a>
                                                                    </c:when>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                    </c:choose>
                                                </div>

                                                <p>
                                                ${list.RCONTENT}
                                                </p>

                                                <!--  second level Comment start-->
                                            <c:forEach var="acomment" items="${clist}">
                                                <c:if test="${acomment.rseq == list.RSEQ}">
                                                    <div class="media">
                
                                                        <a class="pull-left" href="#">
                                                            
                                                            <img class="media-object comment-avatar" src="storeimg\mosa7NPaR2_1634768188200.jpg" alt="" width="50" height="50">
                                                        </a>

                                                        <div class="media-body">

                                                            <div class="comment-info">
                                                                <h4 class="comment-author">
                                                                    <a href="#">${acomment.maid}</a>
                                                                </h4>
                                                                <time>July 02, 2015, at 11:34</time>
                                                                <!--<a class="comment-button" href="#"><i class="tf-ion-chatbubbles"></i>Reply</a>-->
                                                            </div>

                                                            <p>
                                                                ${acomment.cocontent}
                                                            </p>

                                                        </div>

                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                                <!-- second level Comment end -->
                                            
                                            </div>
                                            
                                        </li>
                                </c:forEach>
                                <!-- End Comment Item -->
                 
                            </ul>
                        </div>

                        
                    </div>
                </div>
            </div>

<!-- -->
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->

    <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <form id="contact-form" action ="comment_test" type="post" >
                <div class="col-md-6 col-sm-12">
                    <div class="block">
                        <div class="form-group-2">
                            <textarea name="cocontent" class="form-control" rows="3" placeholder="Your Message"></textarea>
                        </div>
                            <button class="btn btn-default" type="submit">Send Message</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

 

</body>
    <script>
    function detailView(src) {
        console.log("ㅎㅇ: "+src);
        var srcDate = $('.srcTest');
        srcDate.attr('src',src);
        //$("#srcTest").attr("srcTest",src );
        $("#detail_imgt_pop").show();
        $("#reviewImg").hide();
    }
    
    $(function(){
        $("#pop_close").click(function(){
            $("#detail_imgt_pop").hide();
            $("#reviewImg").show();
        });
    });

    function replyClick(sParm){
        console.log("seq:"+sParm);
        modal.style.display ='flex';
        seqData = {"rseq":sParm}
        
        $.ajax({
            url:"comment",
            type:"post",
            data:seqData,
    
        })
    }
    function reply(params) {
        
    }
    window.onclick =(event)=>{
                if(event.target == modal){
                  modal.style.display='none';
                }
    }
    </script>

</html>