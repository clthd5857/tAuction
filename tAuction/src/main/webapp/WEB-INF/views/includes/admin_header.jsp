<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Triple A Admin</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="/resources/admin/img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/admin/css/owl.theme.css">
    <link rel="stylesheet" href="/resources/admin/css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/meanmenu/meanmenu.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/normalize.css">
	<!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/wave/waves.min.css">
    <link rel="stylesheet" href="/resources/admin/css/wave/button.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/notika-custom-icon.css">
    <!-- Data Table JS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/jquery.dataTables.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/main.css">
    <!-- style CSS
		=============================/resources/admin===== -->
    <link rel="stylesheet" href="/resources/admin/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/admin/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="/resources/admin/js/vendor/modernizr-2.8.3.min.js"></script>
    
  
        <!-- jquery
		============================================ -->
    <script src="/resources/admin/js/vendor/jquery-1.12.4.min.js"></script>
      
   

    
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- Start Header Top Area -->
    <div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="logo-area">
                        <a href="/admin/adminMain"><img src="/resources/admin/img/logo/logo.png" alt="" style="width:150px" /></a>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <div class="header-top-menu">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Top Area -->
     <div class="mean-bar">
        <a href="#nav" class="meanmenu-reveal" style="background:;color:;right:0;left:auto;"><span></span><span></span><span></span></a>
        	<nav class="mean-nav">
                            <ul class="mobile-menu-nav" style="display: none;">
                                <li><a data-toggle="collapse" data-target="#Charts" href="#">관리자 홈</a>
                                    <ul class="collapse dropdown-header-top" style="display: none;">
                                        <li><a href="/admin/adminMain">관리자 홈</a></li>
                                       
                                    </ul>
                                <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                                <li><a data-toggle="collapse" data-target="#demoevent" href="#">사용자 관리</a>
                                    <ul id="demoevent" class="collapse dropdown-header-top" style="display: none;">
                                        <li><a href="/admin/adminMemberGetList">사용자 전체 목록 보기</a></li>
                                        <li><a href="/admin/adminMemberRemoveList">사용자 삭제/복구 요청 조회</a></li>
                                      
                                    </ul>
                                <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                                <li><a data-toggle="collapse" data-target="#democrou" href="#">게시판 관리</a>
                                    <ul id="democrou" class="collapse dropdown-header-top" style="display: none;">
                                        <li><a href="/admin/adminBoardGetList">게시판 전체 목록 보기</a></li>
                                        <li><a href="/admin/adminBoardRemoveList">사용자 삭제/복구 요청 조회</a></li>
                                        <li><a href="/admin/adminCmBoardGetList">커뮤니티 게시판 전체 목록 보기</a></li>
                                        <li><a href="/admin/adminCmBoardRemoveList">커뮤니티 게시판 삭제/복구 요청 조회</a></li>
                                    </ul>
                                <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                                <li><a data-toggle="collapse" data-target="#demolibra" href="#">공지사항 관리</a>
                                    <ul id="demolibra" class="collapse dropdown-header-top" style="display: none;">
                                        <li><a href="/admin/adminPostBoardInsert">공지사항 글 쓰기</a></li>
                                        <li><a href="/admin/adminPostBoardGetList">공지사항 전체 목록 보기</a></li>
                                    </ul>
                                <a class="mean-expand" href="#" style="font-size: 18px">+</a></li>
                                <li><a data-toggle="collapse" data-target="#demodepart" href="#">차트</a>
                                    <ul id="demodepart" class="collapse dropdown-header-top" style="display: none;">
                                        <li><a href="/admin/chartYear">년/월 차트</a></li>
                                        <li><a href="/admin/chartMonth">월/일</a></li>
                                    </ul>
                               </li>
                              </ul>
                        </nav>
                       </div>
    <div class="mobile-menu-area">
        <div class="container mean-container">
       
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mobile-menu">
                        <div class="mean-push"></div><nav id="dropdown" style="display: none;">
                            <ul class="mobile-menu-nav">
                                <li><a data-toggle="collapse" data-target="#Charts" href="#">관리자 홈</a>
                                    <ul class="collapse dropdown-header-top">
                                        <li><a href="/admin/adminMain">관리자 홈</a></li>
                                    </ul>
                                </li>
                                <li><a data-toggle="collapse" data-target="#demoevent" href="#">사용자 관리</a>
                                    <ul id="demoevent" class="collapse dropdown-header-top">
                                        <li><a href="/admin/adminMemberGetList">사용자 전체 목록 보기</a></li>
                                        <li><a href="/admin/adminMemberRemoveList">사용자 삭제/복구 요청 조회</a></li>
                                    </ul>
                                </li>
                                <li><a data-toggle="collapse" data-target="#democrou" href="#">게시물 관리</a>
                                    <ul id="democrou" class="collapse dropdown-header-top">
                                        <li><a href="/admin/adminBoardGetList">게시판 전체 목록 보기</a></li>
                                        <li><a href="/admin/adminBoardRemoveList">사용자 삭제/복구 요청 조회</a></li>
                                    </ul>
                                </li>
                                <li><a data-toggle="collapse" data-target="#demolibra" href="#">공지사항 관리</a>
                                    <ul id="demolibra" class="collapse dropdown-header-top">
                                        <li><a href="/admin/adminPostBoardInsert">공지사항 글 쓰기</a></li>
                                        <li><a href="/admin/adminPostBoardGetList">공지사항 전체 목록 보기</a></li>
                                    </ul>
                                </li>
                                <li><a data-toggle="collapse" data-target="#demodepart" href="#">차트</a>
                                    <ul id="demodepart" class="collapse dropdown-header-top">
                                        <li><a href="/admin/chartYear">년/월 차트</a></li>
                                        <li><a href="/admin/chartMonth">월/일</a></li>
                                    </ul>
                                </li>
                               
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="main-menu-area mg-tb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  			<ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li><a data-toggle="tab" href="#Home"><i class="notika-icon notika-house"></i>관리자 홈</a>
                        </li>
                        <li><a data-toggle="tab" href="#Members"><i class="notika-icon notika-mail"></i> 사용자 관리</a>
                        </li>
                         <li><a data-toggle="tab" href="#Boards"><i class="notika-icon notika-windows"></i> 게시판 관리</a>
                        </li>
                
                        <li><a data-toggle="tab" href="#PostBoard"><i class="notika-icon notika-app"></i>공지사항 관리</a>
                        </li>
                        <li><a data-toggle="tab" href="#Charts" aria-expanded="true"><i class="notika-icon notika-bar-chart"></i>차트</a>
                        </li>
                      
                    </ul>
                    <div class="tab-content custom-menu-content">
                        <div id="Home" class="tab-pane in notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="/admin/adminMain">관리자 홈</a>
                                </li>
                            </ul>
                        </div>
                        <div id="Members" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="/admin/adminMemberGetList">사용자 전체 정보 조회</a>
                                </li>
                                <li><a href="/admin/adminMemberRemoveList">사용자 삭제/복구 요청 조회</a>
                                </li>
                            </ul>
                        </div>
                        <div id="Boards" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="/admin/adminBoardGetList">전체 게시판 조회</a>
                                </li>
                                <li><a href="/admin/adminBoardRemoveList">게시판 삭제/복구 요청 조회</a>
                                </li>
                                <li><a href="/admin/adminCmBoardGetList">커뮤니티 게시판 전체 목록 보기</a></li>
                                <li><a href="/admin/adminCmBoardRemoveList">커뮤니티 게시판 삭제/복구 요청 조회</a></li>
                            </ul>
                        </div>
                        <div id="Charts" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="/admin/chartYear">년/월 차트</a>
                                </li>
                                <li><a href="/admin/chartMonth">일/월 차트</a>
                                </li>
                            </ul>
                        </div>
                        <div id="PostBoard" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="/admin/adminPostBoardGetList">공지사항 목록 조회</a>
                                </li>
                                <li><a href="/admin/adminPostBoardInsert">공지사항 글쓰기</a>
                                </li>
                            </ul>
                        </div>                
    				</div>
                   
                     
                    </div>
                </div>
            </div>
  </div>

    <!-- Main Menu area start-->
    <!-- <div class="main-menu-area mg-tb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li class="active"><a href="/admin/adminMain"><i class="notika-icon notika-house"></i>관리자 홈</a></li>
                        <li><a data-toggle="tab" href="#Members"><i class="notika-icon notika-support"></i>회원 관리</a></li>
          				<li><a data-toggle="tab" href="#Tables"><i class="notika-icon notika-windows"></i>서비스 관리</a></li>
                        <li><a href="/admin/adminPostBoardGetList"><i class="notika-icon notika-form"></i>공지사항</a></li>
                        
                    </ul>
                   	<div class="tab-content custom-menu-content">
                        <div id="Members" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="/admin/adminMemberGetList">회원 목록</a>
                                </li>
                                <li><a href="/admin/memberRemoveList">회원 삭제</a>
                                </li>
                            </ul>
                        </div> 
                        
                        <div id="Tables" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="/admin/adminBoardGetList">게시물 목록</a>
                                </li>
                                <li><a href="/admin/boardRemoveList">게시물 삭제</a>
                                </li>
                            </ul>
                        </div>                      
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- Main Menu area End-->
