<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- ${contextPath} --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Triple A</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/animate.min.css" rel="stylesheet"> 
    <link href="${contextPath}/resources/css/lightbox.css" rel="stylesheet"> 
	<link href="${contextPath}/resources/css/main.css" rel="stylesheet">
	<link href="${contextPath}/resources/css/responsive.css" rel="stylesheet">



	
    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="${contextPath}/resources/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${contextPath}/resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${contextPath}/resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${contextPath}/resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${contextPath}/resources/images/ico/apple-touch-icon-57-precomposed.png">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" rel="stylesheet" />
    
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/lightbox.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/wow.min.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/main.js"></script>  
    
    
<style>
	#header {
		background-color: white;
		position: sticky;
		top: 0;
		left: 0;
		right: 0;
		z-index:999;
		padding: 30px 0 40px 0;
    }
    #topOfPage {
		position: fixed;
  		bottom: 50px;
  		right:50px;
  		width:50px;
  		height:auto;
  		z-index:999;
	}
	
	/*  ????????? */
	::-webkit-scrollbar { width: 7.2px; } /* ????????? ??? */
	::-webkit-scrollbar-track { background-color:#fff; } /* ????????? ??? ?????? ?????? */
	::-webkit-scrollbar-thumb { background: #ddd; border-radius: 10px; } /* ????????? ????????? ??? */
	::-webkit-scrollbar-thumb:hover { background: #404040; } /* ????????? ????????? ??? ?????? ???????????? ????????? ??? ??? */
	::-webkit-scrollbar-thumb:active { background: #808080; } /* ????????? ????????? ?????? ????????? ??? */
	::-webkit-scrollbar-button { display: none; } /* ????????? ??? ??? ?????? ?????? */
	
	#header .navbar-nav.navbar-right >li a {
		font-size: 15px;
		font-weight: 500;
	}
	
	 @font-face {
      font-family:"NotoSerifKR-Light";
      src:url(/resources/fonts/NotoSerifKR-Medium.otf) format("truetype");
      font-style:normal;
      font-weight:normal;
      }
      
      
   body{
   font-family:"NotoSerifKR-Light";
   
   }
   
      h1, h2, h3, h4, h5, h6 {
    font-family:"NotoSerifKR-Light";
    font-weight: 900;
   }
	
	
	
</style>

    
</head><!--/head-->

<body>
	<a href="#"><img src="${contextPath}/resources/images/topOfPage.png" id="topOfPage"></a>

	<header id="header">      
        <div class="container">
            <div class="row">
                <div class="col-sm-12 overflow">
                   <div class="social-icons pull-right">
                        <ul class="nav nav-pills">
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                            <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                            <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                    </div> 
                </div>
             </div>
        </div>
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="${contextPath}/index/index">
                    	<h1><img src="${contextPath}/resources/images/logo.png" alt="logo" style="width:210px"></h1>
                    </a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="${contextPath}/index/index">Home</a></li>
                        <li class="dropdown"><a href="${contextPath}/board/boardGetList">?????? <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=A">??????</a></li>
                                <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=B">??????</a></li>
                                <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=C">??????</a></li>
                                <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=D">??????</a></li>
                                <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=E">??????</a></li>
                            </ul>
                        </li>                    
                        <li class="dropdown"><a href="${contextPath}/cmBoard/cmBoardGetList">???????????? <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=9&category=??????">??????</a></li>
                                <li><a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=9&category=QnA">QnA</a></li>
                            </ul>
                        </li>
                      <!--   <li class="dropdown"><a href="#">???????????? <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="#">???????????????</a></li>
                                <li><a href="#">???????????????1</a></li>
                                <li><a href="#">???????????????2</a></li>
                            </ul>
                        </li>  -->                        
						<sec:authorize access="isAnonymous()">
							<li><a href="/customLogin">?????????</a></li>
						</sec:authorize> 
						<sec:authorize access="hasRole('ROLE_MEMBER')">
							<li class="dropdown"><a><sec:authentication property="principal.username"/><i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="/member/myPage?memberId=<sec:authentication property="principal.username"/>">???????????????</a></li>
									<li><a href="/customLogout">????????????</a></li>
	                            </ul>
	                        </li>
						</sec:authorize>
						 <sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="dropdown"><a><sec:authentication property="principal.username"/><i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="/admin/adminMain">????????? ?????????</a></li>
									<li><a href="/customLogout">????????????</a></li>
	                            </ul>
	                        </li>
						</sec:authorize> 
                    </ul>
                </div>
                
                <div class="search">
                    <form role="form">
                    	<sec:authorize access="isAuthenticated()">
                        	<sec:authentication property="principal" var="pinfo" />
                        	
                        	<%-- <a href="/room?memberId=${pinfo.username}"><i class="fa fa-comment fa-2x"></i></a> --%>
                        	<button type="button" style="border:0px; background-color:white;" class="btn" onClick="window.open('/room?memberId=${pinfo.username}','','width=600,height=650')"><i class="fa fa-comment fa-2x"></i></button>
                        	
                        </sec:authorize>
                    </form>
                </div>
                
            </div>
        </div>
    </header>
    <!--/#header-->