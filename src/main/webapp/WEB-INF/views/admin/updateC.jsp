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


<body>
<style>
    .modal-wrapper{
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
       
    }
    .modal-inner{
        height: calc(100% - 450px);
        width: calc(100% - 600px);
        background-color: #485861;
        border-radius: 12px;
        padding: 24px;
        box-sizing: border-box;
        overflow: hidden;
    }
    .modal-inner .title{
        font-size: 17px;
        color: aliceblue;


    }
    .mybutton{
        padding: 10px 20px;
        font-size: 15px;
        border: 1px solid rgba(255,230,207, 0.28);
        border-radius: 4px;
        color: green;
      
       


    }
    

    .overlay{
        height: 100%;
        width: 100%;
        background-color: rgba(0,0,0, 0.7);
        position: fixed;
        top: 0;
        left: 0;

    }
 
</style>
<div class="overlay"></div>
<div class="modal-wrapper">
    <div class="modal-inner">
        <div class="thumb"></div>
        <div class="bottom-info">
            <div class="title">현재 카테고리 목록</div>
            <p lass="description">
                <form class="col s12" action="update_category" method="POST" name="update_category">
                    <div class="row">
                      <div class="input-field col s6">
                      <!-- Select Box -->
                      </div>
                    </div>
              
                    <div class="row">
                    <div class="input-field col s12">
                        <input placeholder="{list.category}" id="category" type="text" class="validate">
                      </div>      
                    </div>              
            </p>
            <div style="width : 100%; right:0; display:flex;justify-content: flex-end; justify-content: space-between; flex-direction: row;"> 
              <input class="mybutton" type="submit" value="수정" id="close">
            </form>
 
 <!--  ㅅㅂ 이거 왜안돼        <button class="mybutton" data-dismiss="modal">뒤로가기</button>-->
            </div>
        
        </div>
    </div>
</div>
</body>

</html>