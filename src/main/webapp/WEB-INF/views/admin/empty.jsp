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
    #color{
        color: aliceblue;
    }
    table{
        width:100%;
        border:1px solid #444444;

    }
    th{
        border:1px solid #444444;
        padding: 10px;
        background-color: skyblue;
    }
    td{
        border:1px solid #444444;
        padding: 10px;
       min-width: 100px;
    }
    #orderbutton{
        border: 1px solid skyblue;
        border-radius: 10%;
        background-color: rgba(0,0,0,0);
        color: black;
        padding: 5px;
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
                <h1 class="page-header">Order</h1>						
		    </div>
            <div id="page-inner"> 
			  <div class="row">
                <div class="col-md-12"> 
                    <div class="card">
                        <div class="tabWrap">
                            <ul class="tab_Menu">
                                <li class="tabMenu current" id="waitorder">
                                    <a href="#tabContent01"></a>주문 대기중</a>
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
                                                            <td class="center"><button id="orderbutton" onclick="detail(`${list.oseq}`)">주문 상세</button></td>
                                                            <td class="center">
                                                                <input type="button" id="orderbutton" value="접수하기" onclick="location.href='receipt?oseq=${list.oseq}'">
                                                            </td>
                                                            <td class="center">
                                                                <input type="button" id="orderbutton" value="주문취소" onclick="cancel('${list.oseq}');">
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
                url:"orderDetail",
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
                    html +='<div id="color" class="mother_son">'
                    for (let i = 0; i < data.mname.length; i++) {
                        html +='<div class="menu_son">'+data.mname[i]+'</div>';
                    }
                    html +='</div>';
                    html +='<div id="color" class="mother_son" style="magin-left">';
                    for (let i = 0; i < data.olcount.length; i++) {
                        html +='<div class="menu_son">'+data.olcount[i]+'</div>';
                    }
                    html +='</div>';
                    html +='</div>';
                    html +='</div>';
                    html +='<div id="color" class=mother_son>';
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
                        html += '<td  class="center"><button class="buttons" onclick="detail('+capital.oseq+')">주문 상세</button></td>';
                        html += '<td class="center">';
                        html += '<input class="buttons" type="button" value="접수하기" onclick="location.href=receipt?oseq='+capital.oseq+'">';
                        html += '</td>';
                        html += ' <td class="center">';
                        html += '<input class="buttons" type="button" value="주문취소" onclick="cancel('+capital.oseq+')"/>'
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
                        html += '<td class="center"><img src="/img/ing.png" style="width: 60px; height: 60px;"></td>';
                        html += '<td class="center">'+capital.oseq+'</td>';
                        html += '<td class="center">'+capital.mname1+' 등</td>';
                        html += '<td class="center">'+capital.mprice1+'</td>';
                        html += ' <td class="center"><button id=orderbutton onclick="detail('+capital.oseq+')">주문 상세</button></td>';
                        html += '<td class="center">';
                        html += '<input type="button" value="조리완료" onclick="location.href=`completion?oseq='+capital.oseq+'`">';
                        html += '<input type="button" id=orderbutton value="조리완료" onclick="">';
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
                        html += '<td class="center"><img src="/img/complet.png" style="width: 60px; height: 60px;"></td>';
                        html += '<td class="center">'+capital.oseq+'</td>';
                        html += '<td class="center">'+capital.mname1+' 등</td>';
                        html += '<td class="center">'+capital.mprice1+'</td>';
                        html += ' <td class="center"><button id=orderbutton onclick="detail('+capital.oseq+')">주문 상세</button></td>';
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
                        html += '<td class="center"><img src="/img/cancel.png" style="width: 60px; height: 60px;"></td>';
                        html += '<td class="center">'+capital.oseq+'</td>';
                        html += '<td class="center">'+capital.mname1+' 등</td>';
                        html += '<td class="center">'+capital.mprice1+'</td>';
                        html += ' <td class="center"><button  id=orderbutton onclick="detail('+capital.oseq+')">주문 상세</button></td>';
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


    function cancel(oseq){
                var seqDate = {"oseq":oseq}
                   var ok = confirm("정말 취소하시겠습니까?");
                   if(ok){
                     $.ajax({
                         url:"cancel",
                         type:"post",
                         data: seqDate
                     })

                   }else{
                       alert("취소되었습니다.")
                   }
                   

                }
</script>


</body>

</html>
