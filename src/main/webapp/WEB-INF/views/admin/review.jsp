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
                    <a class="navbar-brand waves-effect waves-dark" href="index"><i class="large material-icons">track_changes</i> 
                        <strong>자주해요</strong>
                    </a>
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
                    <h1 class="page-header" id = "subject">REVIEW PAGE</h1>         
                </div>
                <div id="page-inner"> 
                    <div class="col-md-12" id = "bigboxbox">
                        <div class="card" id = "bigbox">
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
                                                                <img class="media-object comment-avatar" src="storeimg\logo2_1635093972904.jpg" alt="" width="50" height="50">
                                                            </a>
                                                            <div class="media-body">
                                                                <div class="comment-info">
                                                                    <h4 class="comment-author">
                                                                        <a href="#">${acomment.maid}</a>
                                                                    </h4>
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
            </div>

            <!-- /. PAGE WRAPPER  -->
        </div>
        <!-- /. WRAPPER  -->

        <div id="modal" class="modal-overlay">
            <div class="modal-window">
                <form id="contact-form" action ="commentReply" type="post" >
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