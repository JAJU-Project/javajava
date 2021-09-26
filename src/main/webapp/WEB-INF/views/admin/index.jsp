<!DOCTYPE html>
<script type="text/javascript">
		history.replaceState({}, null, location.pathname);
</script>	
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
                <button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse" data-target=".sidebar-collapse">
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
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
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
                                    <strong>JEONG KA YEON</strong>
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
                                    <strong>JEONG KA YEON</strong>
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
                                    <strong>JEONG KA YEON</strong>
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
                        <a class="active-menu waves-effect waves-dark" href="index"><i class="fa fa-dashboard"></i> SALES</a>
                    </li>
                    <li>
                        <a href="review" class="waves-effect waves-dark"><i class="fa fa-desktop"></i>REVIEW</a>
                    </li>
                    <li>
                        <a href="menu" class="waves-effect waves-dark"><i class="fa fa-table"></i>MENU</a>
                    </li>
                    <li>
                        <a href="empty" class="waves-effect waves-dark"><i class="fa fa-fw fa-file"></i> EMPTY PAGE</a>
                    </li>
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
      
      <div id="page-wrapper">
        <div class="header"> 
                        <h1 class="page-header">
                            Sales
                        </h1>
      </div>
            <div id="page-inner">
         <div class="dashboard-cards"> 
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3" id="first">
               
                  <div class="card horizontal cardIcon waves-effect waves-dark">
                  <div class="card-image red">
                  <i class="material-icons dp48">import_export</i>
                  </div>
                  <div class="card-stacked red">
                  <div class="card-content">
                  <h3>84,198</h3> 
                  </div>
                  <div class="card-action">
                  <strong>SALES BY MENU</strong>
                  </div>
                  </div>
                  </div>
                    </div>
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
                    </div>
				</div>
				<div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-3">
               
                     <div class="card horizontal cardIcon waves-effect waves-dark" id="third">
                  <div class="card-image blue">
                  <i class="material-icons dp48">equalizer</i>
                  </div>
                  <div class="card-stacked blue">
                  <div class="card-content">
                  <h3>24,225</h3> 
                  </div>
                  <div class="card-action">
                  <strong>ONE DAY CUSTOMER</strong>
                  </div>
                  </div>
                  </div> 
                   
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-3">
               
               <div class="card horizontal cardIcon waves-effect waves-dark" id="fourth">
                  <div class="card-image green">
                  <i class="material-icons dp48">supervisor_account</i>
                  </div>
                  <div class="card-stacked green">
                  <div class="card-content">
                  <h3>{list.age}</h3> 
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
                
           

      
                    
            <div class="fixed-action-btn horizontal click-to-toggle">
    <a class="btn-floating btn-large red">
      <i class="material-icons">menu</i>
    </a>
    <ul>
      <li><a class="btn-floating red"><i class="material-icons">track_changes</i></a></li>
      <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a></li>
      <li><a class="btn-floating green"><i class="material-icons">publish</i></a></li>
      <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a></li>
    </ul>
  </div>
      
            <footer><p>All right reserved. Template by: <a href="https://webthemez.com/admin-template/">WebThemez.com</a></p>
            
        
            </footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
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
   
    <!-- Custom Js -->
    <script src="assets/js/custom-scripts.js"></script> 

 

	
	<script>
		$(function() {
		  $('#first').click(function() {
  
			$.ajax({
			  type : 'rest',                 
			  url : "salesByMenu", //todo: 재영쓰바꿔  
			  data: {catgo: $("#catgo").val()},          
			  success : function(data) {   
                console.log(JSON.stringify(data))
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
				html +="<li class='collection-item avatar'>";
				html +="<i class='material-icons circle green'>track_changes</i>";
                
				html +="<span class='title'>아이스아메리카노</span>";
				html +="<p>243,094 원<br></p>";
				html +="<a href='#!'' class='secondary-content'><i class='material-icons'>grade</i></a>";
				html +="</li>";
				html +="<li class='collection-item avatar'>";
				html +="<i class='material-icons circle'>folder</i>";
				html +="<span class='title'>딸기레몬블렌디드</span>";
				html +="<p>823,330 원<br></p>";
				html +="<a href='#!' class='secondary-content'><i class='material-icons'>grade</i></a>";
				html +="</li>";
				html +="<li class='collection-item avatar'>";
				html +="<i class='material-icons circle green'>track_changes</i>";
				html +="<span class='title'>아이스바닐라라떼</span>";
				html +="<p>124,394 원<br></p>";
				html +="<a href='#!' class='secondary-content'><i class='material-icons'>grade</i></a>";
				html +="</li>";
				html +="<li class='collection-item avatar'>";
				html +="<i class='material-icons circle red'>play_arrow</i>";
				html +="<span class='title'>녹차프라푸치노</span>"
				html +="<p>334,321 원<br></p>";
				html +="<a href='#!'' class='secondary-content'><i class='material-icons'>grade</i></a>";
				html +="</li>";
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
	  $('#second').click(function() {
	   var activeTab = $(this).attr('data-tab');
	   $.ajax({
		 type : 'POST',                 
		 url : "test2", //재영쓰바꿔  
		 data: {catgo: $("#catgo").val()},          
		 success : function(data) {   
		  var html="";
		  html +="<div class='col-md-7'>";
		  html +="<div class='card'>";
		  html +="<div class='card-image'>";
		  html +="<div id='ms-bar-chart'></div>";
		  html +="</div>";
		  html +="<div class='card-action'>";
		  html +="<b> Monthly sales </b>";
		  html +="</div>";
		  html +="</div>";
		  html +="</div>";
		  html +="</div>";
		  $("#board").html(html);
		  Morris.Bar({
			element: 'ms-bar-chart',
			data: [{
				y: '1월',
				a: 100,
				b: 90
			}, {
				y: '2월',
				a: 75,
				b: 65
			}, {
				y: '3월',
				a: 50,
				b: 40
			}, {
				y: '4월',
				a: 75,
				b: 30
			}, {
				y: '5월',
				a: 50,
				b: 40
			},
			{
				y: '6월',
				a: 90,
				b: 90
			},
			{
				y: '7월',
				a: 10,
				b: 60
			},
			{
				y: '8월',
				a: 100,
				b: 90
			}, {
				y: '9월',
				a: 15,
				b: 65
			}, {
				y: '10월',
				a: 100,
				b: 90
			},{
				y: '11월',
				a: 10,
				b: 90
			},{
				y: '12월',
				a: 100,
				b: 20
			}],
			xkey: 'y',
			ykeys: ['a', 'b'],
			labels: ['Series A', 'Series B'],
	 barColors: [
'#e96562','#414e63',
'#A8E9DC' 
],
			hideHover: 'auto',
			resize: true
		});

		 }});
	  });    
	});
   </script>


  
	  <script>
		$(function() {
		  $('#third').click(function() {
			var activeTab = $(this).attr('data-tab');
			$.ajax({
			  type : 'POST',                 
			  url : "test3", //재영쓰바꿔  
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
				html +="<div class='easypiechart' id='easypiechart-blue' data-percent='82' ><span class='percent'>82</span>";
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
		  $('#fourth').click(function() {
			var activeTab = $(this).attr('data-tab');
			$.ajax({
			  type : 'POST',                 
			  url : "test4", //재영쓰바꿔  
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
                    value: 12
                }, {
                    label: "20대",
                    value: 30
                },
				{
                    label: "30대",
                    value: 30
                },
				{
                    label: "40대",
                    value: 30
                },
				{
                    label: "50대",
                    value: 30
                },
				{
                    label: "60대",
                    value: 30
                }, {
                    label: "70대",
                    value: 5
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