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
<style>
	.tabWrap { width: 900px; height: 500px; }
	.tab_Menu { margin: 0px; padding: 0px; list-style: none; }
	.tabMenu { width: 150px; margin: 0px; text-align: center; 
			   padding-top: 10px; padding-bottom: 10px; float: left; }
		.tabMenu a { color: #000000; font-weight: bold; text-decoration: none; }
	.current { background-color: #FFFFFF; 
			   border: 1px solid blue; border-bottom:hidden; }
	.tabPage { width: 900px; height: 470px; float: left; 
			   border: 1px solid blue; 
            overflow: scroll;}

</style>
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
       <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu waves-effect waves-dark" href="index"><i class="fa fa-dashboard"></i> Sales</a>
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
                           Order
                        </h1>
									
		</div>
            <div id="page-inner"> 
			
			  <div class="row">
                    
                    <div class="col-md-12"> 
                    <div class="card">
                        <div class="tabWrap">
                            <ul class="tab_Menu">
                                <li class="tabMenu current" id="waitorder">
                                    <a href="#tabContent01"></a> >주문 대기중</a>
                                </li>
                                <li class="tabMenu" id="waitorder2">
                                    <a href="#tabContent02" >조리 중</a>
                                </li>
                                <li class="tabMenu" id="waitorder3">
                                    <a href="#tabContent03" >조리 완료</a>
                                </li>
                                <li class="tabMenu" id="waitorder4">
                                    <a href="#tabContent04" >주문 취소</a>
                                </li>
                            </ul>
                            <div class="tab_Content_Wrap">
                                <div id="tabContent01" class="tabPage">
                                    <div class="flex_bbox">
                                    <div id="orderr">
                                    <img src="/img/wait.png" id="imgbox"/>
                                    <div>
                                    <p>주문번호</p>
                                    <p>{list.no}</p>
                                    <p>주문일시</p>
                                    <p>{list.date}</p>
                                    </div>
                                    <div>
                                    <table>
                                    <thead>
                                    <p>상세 주문내역</p>
                                    <tr>
                                    <th>메뉴</th>
                                    <th>수량</th>
                                    <th>가격</th>
                                    </tr>
                                    </thead>
                                    <tbody border="10">
                                    <tr>
                                    <td>{list.menu}</td>
                                    <td>{list.asd}</td>
                                    <td>{list.prices}</td>
                                    </tr>
                                    </tbody>
                                    </table>
                                    </div>
                                    <input type="button" value="주문 접수" onclick="submit">
                                    <input type="button" value="주문취소" onclick="confirm(`정말 취소하시겠습니까`)">  
                                </div>
                                    </div>
                           
                                </div>
                                <div id="tabContent02" class="tabPage">
                                    Tab2 Content
                                </div>
                                <div id="tabContent03" class="tabPage">
                                    Tab3 Content
                                </div>
                                <div id="tabContent04" class="tabPage">
                                    Tab4 Content
                                </div>
                            </div>
                        </div>
                         <div class="card-content"> 
            
			
			</div>
						 
                           <div class="clearBoth"><br/></div>
						    
						 </div>
						 </div>
									
				 
				</div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets/js/jquery-1.10.2.js"></script>
	
	<!-- Bootstrap Js -->
    <script src="assets/js/bootstrap.min.js"></script>
	
	<script src="assets/materialize/js/materialize.min.js"></script>
	
    <!-- Metis Menu Js -->
		<script src="assets/js/jquery.metisMenu.js"></script> 
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script> 
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js" ></script>
    <script type="text/javascript">
        function tabSetting() {
            // 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
            $('.tabPage').hide();
            $($('.current').find('a').attr('href')).show();
    
            // Tab 메뉴 클릭 이벤트 생성
            $('.tabMenu').click(function (event) {
                var tagName = event.target.tagName; // 현재 선택된 태그네임
                var selectedLiTag = (tagName.toString() == 'A') ? $(event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
                var currentLiTag = $('li[class~=current]'); // 현재 current 클래그를 가진 탭
                var isCurrent = false;  
                
                // 현재 클릭된 탭이 current를 가졌는지 확인
                isCurrent = $(selectedLiTag).hasClass('current');
                
                // current를 가지지 않았을 경우만 실행
                if (!isCurrent) {
                    $($(currentLiTag).find('a').attr('href')).hide();
                    $(currentLiTag).removeClass('current');
    
                    $(selectedLiTag).addClass('current');
                    $($(selectedLiTag).find('a').attr('href')).show();
                }
    
                return false;
            });
        }
    
        $(function () {
            // 탭 초기화 및 설정
            tabSetting();
        });
    </script>
    <script>
            $("#waitorder").on("click", function(){
                console.log("aasdasd");
                $.ajax({
                    url:"order",
                    type:"post",
                    data:{order:$("#order").val()},
                    success: function(data){
                       console.log(data);
                        var html="";
                        html += '';
                        console.log("위치1");
                        
                        html += '<div class="flex_bbox">';
                        for(let list of Object.keys(data)){
                            var capital = data[list];
                            console.log("size>"+list.length);
                            console.log("list>"+JSON.stringify(data[list]));
                            console.log("list.mname1:"+capital.MNAME1);
                        html += '<div id="orderr">';
                        
                        if(capital.ostate==1){
                        html += '<form name="receipt" action="receipt?oseq='+capital.oseq+'" method ="post">';
                        html += '<img src="/img/wait.png" id="imgbox"/>';
                        html += '<div>';
                        html +=      '<p>주문번호</p>';
                        html +=      '<p>'+capital.oseq+'</p>';
                        html +=      '<p>주문일시</p>';
                        html +=      '<p>'+capital.oldate+'</p>';
                        html +=      '</div>';
                        html +=       '<div>';
                        html +=      '<table>';
                        html +=          '<thead>';
                        html +=              '<p>상세 주문내역</p>';
                        html +=              '<tr>';
                        html +=              '<th>메뉴</th>';
                        html +=              '<th>수량</th>';
                        html +=               '<th>가격</th>';
                        html +=            '</tr>';
                        html +=         '</thead>';
                        html +=         '<tbody border="10">';
                        
                        if(capital.mname1!=null){
                                html +=             '<tr>';
                                html +=               '<td>'+capital.mname1+'</td>';
                                html +=               '<td>'+capital.olcount1+'</td>';
                                html +=                '<td>'+capital.mprice1+'</td>';
                                html +=             '</tr>';
                        }
                        if(capital.mname2!=null){
                            html +=             '<tr>';
                            html +=               '<td>'+capital.mname2+'</td>';
                            html +=               '<td>'+capital.olcount2+'</td>';
                            html +=                '<td>'+capital.mprice2+'</td>';
                            html +=             '</tr>';
                        }
                        if(capital.mname3!=null){
                            html +=             '<tr>';
                            html +=               '<td>'+capital.mname3+'</td>';
                            html +=               '<td>'+capital.olcount3+'</td>';
                            html +=                '<td>'+capital.mprice3+'</td>';
                            html +=             '</tr>';
                        }
                        if(capital.mname4!=null){
                            html +=             '<tr>';
                            html +=               '<td>'+capital.mname4+'</td>';
                            html +=               '<td>'+capital.olcount4+'</td>';
                            html +=                '<td>'+capital.mprice4+'</td>';
                            html +=             '</tr>';
                        }
                        if(capital.mname5!=null){
                            html +=             '<tr>';
                            html +=               '<td>'+capital.mname5+'</td>';
                            html +=               '<td>'+capital.olcount5+'</td>';
                            html +=                '<td>'+capital.mprice5+'</td>';
                            html +=             '</tr>';
                        }
                        html +=      '</tbody>';
                        html +=    '</table>';
                        html +=     '</div>';
                        html += '<input type="submit" value="주문 접수" >'
                        //html += '<input type="hidden" name="oseq" id="oseq" value="'+capital.oseq+'">'
                            
                        html += '</form>'
                        html += '<form name="del" action="cancel?oseq='+capital.oseq+'" method ="post">';
                        html += '<input type="submit" value="주문취소" onclick="confirm(`정말 취소하시겠습니까`)">'
                        html += '</form>'
                        }
                        
                        html +=   '</div>';
                        }
                        html += '</div>';
                   
                        $("#tabContent01").html(html);
                    }
                })
            })
    </script>
     <script>
        $("#waitorder2").on("click", function(){
            console.log("aasdasd");
            $.ajax({
                url:"order",
                type:"post",
                data:{order:$("#order").val()},
                success: function(data){
                    var html="";
                    html += '<div class="flex_bbox">';
                    for(let list of Object.keys(data)){
                        var capital = data[list];
                        console.log("조리중..."+list.length);
                    
                        html += '<div id="orderr">';
                        if(capital.ostate==2){
                            html += '<img src="/img/ing.png" id="imgbox"/>';
                            html += '<div>';
                            html +=      '<p>주문번호</p>';
                            html +=      '<p>{list.no}</p>';
                            html +=      '<p>주문일시</p>';
                            html +=      '<p>{list.date}</p>';
                            html +=      '</div>';
                            html +=       '<div>';
                            html +=      '<table>';
                            html +=          '<thead>';
                            html +=              '<p>상세 주문내역</p>';
                            html +=              '<tr>';
                            html +=              '<th>메뉴</th>';
                            html +=              '<th>수량</th>';
                            html +=               '<th>가격</th>';
                            html +=            '</tr>';
                            html +=         '</thead>';
                            html +=         '<tbody border="10">';
                                if(capital.mname1!=null){
                                    html +=             '<tr>';
                                    html +=               '<td>'+capital.mname1+'</td>';
                                    html +=               '<td>'+capital.olcount1+'</td>';
                                    html +=                '<td>'+capital.mprice1+'</td>';
                                    html +=             '</tr>';
                                }
                                if(capital.mname2!=null){
                                    html +=             '<tr>';
                                    html +=               '<td>'+capital.mname2+'</td>';
                                    html +=               '<td>'+capital.olcount2+'</td>';
                                    html +=                '<td>'+capital.mprice2+'</td>';
                                    html +=             '</tr>';
                                }
                                if(capital.mname3!=null){
                                    html +=             '<tr>';
                                    html +=               '<td>'+capital.mname3+'</td>';
                                    html +=               '<td>'+capital.olcount3+'</td>';
                                    html +=                '<td>'+capital.mprice3+'</td>';
                                    html +=             '</tr>';
                                }
                                if(capital.mname4!=null){
                                    html +=             '<tr>';
                                    html +=               '<td>'+capital.mname4+'</td>';
                                    html +=               '<td>'+capital.olcount4+'</td>';
                                    html +=                '<td>'+capital.mprice4+'</td>';
                                    html +=             '</tr>';
                                }
                                if(capital.mname5!=null){
                                    html +=             '<tr>';
                                    html +=               '<td>'+capital.mname5+'</td>';
                                    html +=               '<td>'+capital.olcount5+'</td>';
                                    html +=                '<td>'+capital.mprice5+'</td>';
                                    html +=             '</tr>';
                                }
                                if(capital.mname6!=null){
                                    html +=             '<tr>';
                                    html +=               '<td>'+capital.mname6+'</td>';
                                    html +=               '<td>'+capital.olcount6+'</td>';
                                    html +=                '<td>'+capital.mprice6+'</td>';
                                    html +=             '</tr>';
                                }
                            
                            html +=      '</tbody>';
                            html +=    '</table>';
                            html +=     '</div>';
                            html += '<input type="button" value="조리 완료" onclick="submit">'    
                        }
                        html +=   '</div>';
                    }
                    html += '</div>';
               
                    $("#tabContent02").html(html);
                }
            })
        })
</script>
<script>
    $("#waitorder3").on("click", function(){
        console.log("aasdasd");
        $.ajax({
            url:"order",
            type:"post",
            data:{order:$("#order").val()},
            success: function(data){
                var html="";
                html += '<div class="flex_bbox">';
                html += '<div id="orderr">';
                html += '<img src="/img/complet.png" id="imgbox"/>';
                html += '<div>';
                html +=      '<p>주문번호</p>';
                html +=      '<p>{list.no}</p>';
                html +=      '<p>주문일시</p>';
                html +=      '<p>{list.date}</p>';
                html +=      '</div>';
                html +=       '<div>';
                html +=      '<table>';
                html +=          '<thead>';
                html +=              '<p>상세 주문내역</p>';
                html +=              '<tr>';
                html +=              '<th>메뉴</th>';
                html +=              '<th>수량</th>';
                html +=               '<th>가격</th>';
                html +=            '</tr>';
                html +=         '</thead>';
                html +=         '<tbody border="10">';
                html +=             '<tr>';
                html +=               '<td>{list.menu}</td>';
                html +=               '<td>{list.asd}</td>';
                html +=                '<td>{list.prices}</td>';
                html +=             '</tr>';
                html +=      '</tbody>';
                html +=    '</table>';
                html +=     '</div>'; 
                html +=   '</div>';
                html += '</div>';
           
                $("#tabContent03").html(html);
            }
        })
    })
</script>
<script>
    $("#waitorder4").on("click", function(){
        console.log("aasdasd");
        $.ajax({
            url:"order",
            type:"post",
            data:{order:$("#order").val()},
            success: function(data){
                var html="";
                html += '<div class="flex_bbox">';
                html += '<div id="orderr">';
                html += '<img src="/img/cancel.png" id="imgbox"/>';
                html += '<div>';
                html +=      '<p>주문번호</p>';
                html +=      '<p>{list.no}</p>';
                html +=      '<p>주문일시</p>';
                html +=      '<p>{list.date}</p>';
                html +=      '</div>';
                html +=       '<div>';
                html +=      '<table>';
                html +=          '<thead>';
                html +=              '<p>상세 주문내역</p>';
                html +=              '<tr>';
                html +=              '<th>메뉴</th>';
                html +=              '<th>수량</th>';
                html +=               '<th>가격</th>';
                html +=            '</tr>';
                html +=         '</thead>';
                html +=         '<tbody border="10">';
                html +=             '<tr>';
                html +=               '<td>{list.menu}</td>';
                html +=               '<td>{list.asd}</td>';
                html +=                '<td>{list.prices}</td>';
                html +=             '</tr>';
                html +=      '</tbody>';
                html +=    '</table>';
                html +=     '</div>';  
                html +=   '</div>';
                html += '</div>';
           
                $("#tabContent04").html(html);
            }
        })
    })
</script>


</body>

</html>
