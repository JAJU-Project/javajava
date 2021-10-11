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
	.tabWrap { width: 100%; height: 100%; }
	.tab_Menu { margin: 0px; padding: 0px; list-style: none; }
	.tabMenu { width: 150px; margin: 0px; text-align: center; 
			   padding-top: 10px; padding-bottom: 10px; float: left; }
		.tabMenu a { color: #000000; font-weight: bold; text-decoration: none; }
	.current { background-color: #FFFFFF; 
			   border: 1px solid blue; }
	.tabPage { width: 100%; height: 100%; float: left;  
            overflow-y: scroll;
        }
    #orderr{
        width: 300px;
    }
    .input-field{
        color: aliceblue;
    }
    .mother_father{
        display: flex;
    }
    .mother{
        display: flex;
        flex-basis: 70%;
    }
    .father{
        display: flex;
        flex-basis: 30%;
    }
    #mother_1{
        flex-basis: 40%;
    }
    .mother_side{
        display: flex;
    }
    #mother_2{
        flex-basis:70%;
    }
    #mother_3{
        margin-left: 30px;
        flex-basis: 10%;
    }
    .center{
        align-items: center;
    }
    .color{
        color: aliceblue;
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
                                    <div>
                                    <table>
                                    <thead style="border: 1cm;">
                                    <tr>
                                    <th class="center">주문 상태</th>
                                    <th class="center">주문 번호</th>
                                    <th class="center">주문 목록</th>
                                    <th class="center">가격</th>
                                    <th class="center">주문 상세</th>
                                    <th class="center">주문 접수</th>
                                    <th class="center">주문 취소</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${olist1}" var="list">
                                        <tr>
                                        <td class="center"><img src="/img/wait.png" style="width: 60px; height: 60px;"></td>
                                        <td class="center">${list.oseq}</td>
                                        <td class="center">${list.mname1} 등</td>
                                        <td class="center">${list.mprice1} </td>
                                        <td class="center"><button onclick="detail(`${list.oseq}`)">주문 상세</button></td>
                                        <td class="center">
                                            <input type="button" value="접수하기" onclick="">
                                        </td>
                                        <td class="center">
                                            <input type="button" value="주문취소" onclick="confirm(`정말 취소하시겠습니까`)">
                                        </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                    </table>
                                    </div>
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
    <script>
        var modal = document.getElementById("modal-wrapper")
        function detail(oseq){
            var seqData = {"oseq":oseq};
            $.ajax({
                url:"test4",
                type:"post",
                data:seqData,
                success:function(data){
                    var html="";
                   
                    html +='<div class=titlee>상세 주문내역</div>';
                    html +='<input class="input-field" value="주문번호:  " readonly></input>';
                    html +='<input class=input-field value="주문시간 : {시간}" readonly></input>';
                    html +='<input class=input-field value="주문 목록" readonly></input>';
                    html +='<div class="mother_father">';
                    html +='<div class="mother">';
                    html +='<div class="color" id="mother_1">메뉴</div>';
                    html +='<div class="mother_side">';
                    html +='<div class="mother_son">'
                    for (let i = 0; i < data.mname.length; i++) {
                        html +='<div class="menu_son">'+data.mname[i]+'</div>';
                    }
                    html +='</div>';
                    html +='<div mother_son>';
                    for (let i = 0; i < data.olcount.length; i++) {
                        html +='<div class="menu_son">'+data.olcount[i]+'</div>';
                    }
                    html +='</div>';
                    html +='</div>';
                    html +='</div>';
                    html +='<div class=mother_son>';
                    for (let i = 0; i < data.mprice.length; i++) {
                        html +='<div class="menu_son">'+data.mprice[i]+'</div>';
                    }
                    html +='</div>'
                    html +='</div>'                   
                    html +='<input class=input-field value="총가격  :'+data.totalPrice+'" readonly></input>';
                 
                    $(".bottom-info").html(html);
                }
            })
            modal.style.display = 'flex';
        }
        window.onclick =(event)=>{
            if(event.target == modal){
                modal.style.display='none';
               }
        }

    </script>

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
                var ostateDate = {"ostate":"1"}
                $.ajax({
                    url:"order",
                    type:"post",
                    data:ostateDate,
                    success: function(data){
                        var html="";
                        for(let list of Object.keys(data)){
                            var capital = data[list];
                            //console.log("size>"+list.length);
                            //console.log("list>"+JSON.stringify(data[list]));
                            console.log("list.mname1:"+capital.mname1);
                        }
                        html += '<div class="flex_bbox">';
                        html += '<div id="orderr">';
                        html += '<div>';
                        html += '<table>';
                        html += '<thead style="border: 1cm;">';
                        html += '<tr>';
                        html += '<th class="center">주문 상태</th>';
                        html += '<th class="center">주문 번호</th>';
                        html += '<th class="center">주문 목록</th>';
                        html += '<th class="center">가격</th>';
                        html += '<th class="center">주문 상세</th>';
                        html += '<th class="center">주문 접수</th>';
                        html += '<th class="center">주문 취소</th>';
                        html += '</tr>';
                        html += '</thead>';
                        html += '<tbody>';
                        for(let list of Object.keys(data)){
                            var capital = data[list];
                        html += '<tr>';
                        html += '<td class="center"><img src="/img/wait.png" style="width: 60px; height: 60px;"></td>';
                        html += '<td class="center">'+capital.oseq+'</td>';
                        html += '<td class="center">'+capital.mname1+' 등</td>';
                        html += '<td class="center">'+capital.mprice1+'</td>';
                        html += ' <td class="center"><button onclick="detail('+capital.oseq+')">주문 상세</button></td>';
                        html += '<td class="center">';
                        html += '<input type="button" value="접수하기" onclick="">';
                        html += '</td>';
                        html += ' <td class="center">';
                        html += '<input type="button" value="주문취소" onclick="confirm(`정말 취소하시겠습니까`)"/>'
                        html += '</td>';       
                        html += '</tr>';
                        }
                        html += '</tbody>';
                        html += '</table>';
                        html += '</div>';    
                        html += '</div>';
                        html += '</div>';
               
                    $("#tabContent01").html(html);
                }
            })
        })
    </script>
     <script>
        $("#waitorder2").on("click", function(){
            console.log("aasdasd");
            var ostateDate = {"ostate":"2"}
            $.ajax({
                url:"order",
                type:"post",
                data:ostateDate,
                success: function(data){
                    var html="";
                    html += '<div class="flex_bbox">';
                    html += '<div id="orderr">';
                    html += '<div>';
                    html += '<table>';
                    html += '<thead style="border: 1cm;">';
                    html += '<tr>';
                    html += '<th class="center">주문 상태</th>';
                    html += '<th class="center">주문 번호</th>';
                    html += '<th class="center">주문 목록</th>';
                    html += '<th class="center">가격</th>';
                    html += '<th class="center">주문 상세</th>';
                    html += '<th class="center">조리 완료</th>';
                    html += '</tr>'; 
                    html += '</thead>';
                    html += '<tbody>';
                    for(let list of Object.keys(data)){
                            var capital = data[list];
                        html += '<tr>';
                        html += '<td class="center"><img src="/img/wait.png" style="width: 60px; height: 60px;"></td>';
                        html += '<td class="center">'+capital.oseq+'</td>';
                        html += '<td class="center">'+capital.mname1+' 등</td>';
                        html += '<td class="center">'+capital.mprice1+'</td>';
                        html += ' <td class="center"><button onclick="detail('+capital.oseq+')">주문 상세</button></td>';
                        html += '<td class="center">';
                        html += '<input type="button" value="조리완료" onclick="">';
                        html += '</td>';
                        html += '</tr>';
                    }
                    html += '</tbody>';
                    html += '</table>';
                    html += '</div>';   
                    html += '</div>';
                    html += '</div>';
                    html += '</div>';
               
                    $("#tabContent02").html(html);
                }
            })
        })
</script>
<script>
    $("#waitorder3").on("click", function(){
        var ostateDate = {"ostate":"3"}
        $.ajax({
            url:"order",
            type:"post",
            data:ostateDate,
            success: function(data){
                var html="";
                html += '<div class="flex_bbox">';
                html += '<div id="orderr">';
                html += '<div>';
                html += '<table>';
                html += '<thead style="border: 1cm;">';
                html += '<tr>';
                html += '<th class="center">주문 상태</th>';
                html += '<th class="center">주문 번호</th>';
                html += '<th class="center">주문 목록</th>';
                html += '<th class="center">가격</th>';
                html += '<th class="center">주문 상세</th>';
                html += '</tr>';
                html += '</thead>';
                html += '<tbody>';
                for(let list of Object.keys(data)){
                            var capital = data[list];
                        html += '<tr>';
                        html += '<td class="center"><img src="/img/wait.png" style="width: 60px; height: 60px;"></td>';
                        html += '<td class="center">'+capital.oseq+'</td>';
                        html += '<td class="center">'+capital.mname1+' 등</td>';
                        html += '<td class="center">'+capital.mprice1+'</td>';
                        html += ' <td class="center"><button onclick="detail('+capital.oseq+')">주문 상세</button></td>';
                        html += '</tr>';
                }
                html += '</tbody>';
                html += '</table>';
                html += '</div>'; 
                html += '</div>';
                html += '</div>';
                $("#tabContent03").html(html);
            }
        })
    })
</script>
<script>
    $("#waitorder4").on("click", function(){
        var ostateDate = {"ostate":"4"}
        console.log("aasdasd");
        $.ajax({
            url:"order",
            type:"post",
            data:ostateDate,
            success: function(data){
                var html="";
                html += '<div class="flex_bbox">';
                html += '<div id="orderr">';
                html += '<div>';
                html += '<table>';
                html += '<thead style="border: 1cm;">';
                html += '<tr>';
                html += '<th class="center">주문 상태</th>';
                html += '<th class="center">주문 번호</th>';
                html += '<th class="center">주문 목록</th>';
                html += '<th class="center">가격</th>';
                html += '<th class="center">주문 상세</th>';
                html += '</tr>';
                html += '</thead>';
                html += '<tbody>';
                for(let list of Object.keys(data)){
                            var capital = data[list];
                        html += '<tr>';
                        html += '<td class="center"><img src="/img/wait.png" style="width: 60px; height: 60px;"></td>';
                        html += '<td class="center">'+capital.oseq+'</td>';
                        html += '<td class="center">'+capital.mname1+' 등</td>';
                        html += '<td class="center">'+capital.mprice1+'</td>';
                        html += ' <td class="center"><button onclick="detail('+capital.oseq+')">주문 상세</button></td>';
                        html += '</tr>';
                }
                html += '</tbody>';
                html += '</table>';
                html += '</div>'; 
                html += '</div>';
                html += '</div>';
                $("#tabContent04").html(html);
            }
        })
    })
</script>


</body>

</html>
