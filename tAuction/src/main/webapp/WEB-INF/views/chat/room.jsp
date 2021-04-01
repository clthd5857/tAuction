<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html>
<head>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
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


<meta charset="UTF-8">
	<title>Room</title>
	<style>
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.roomContainer{
			background-color: #F6F6F6;
			width: 500px;
			height: 500px;
			overflow: auto;

	</style>
</head>

<body>
	<div class="row">
		<div class="col-md-12">
			<div class="container">
				<ul id="tab1" class="nav nav-tabs">
					<li class="active"><a href="#tab1-item1" data-toggle="tab" aria-expanded="true">나=판매자</a></li>
					<li class=""><a href="#tab1-item2" data-toggle="tab" aria-expanded="false">나=구매자</a></li>
					<li class=""><a href="#tab1-item3" data-toggle="tab" aria-expanded="false">관리자 문의</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade active in" id="tab1-item1">
						<div id="roomContainer" class="roomContainer">
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<th class=>방 제목(나 = Sender)</th>
									<th class=>상대방<br>아이디</th>
									<th class=>입장</th>
								</tr>
								<c:forEach var="senderList" items="${senderList}">
									<c:if test="${senderList.receiverId!='admin'}">
										<tr>
											<td>${senderList.roomName}</td>
											<td>${senderList.receiverId}</td>
											<td>
												<button onClick='goRoom(${senderList.chatRoomNo},"${senderList.roomName}")'>
													<i class="fa fa-arrow-circle-right"></i>
												</button>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="tab1-item2">
						<div id="roomContainer" class="roomContainer">
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<th>방 제목(나 = Receiver)</th>
									<th>상대방<br>아이디</th>
									<th>입장</th>
								</tr>
								<c:forEach var="receiverList" items="${receiverList}">
									<tr>
										<td>${receiverList.roomName}</td>
										<td>${receiverList.senderId}</td>
										<td>
											<button onClick='goRoom(${receiverList.chatRoomNo})'>
												<i class="fa fa-arrow-circle-right"></i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					
					<div class="tab-pane fade" id="tab1-item3">
						<div id="roomContainer" class="roomContainer">
							<table class="table table-striped table-bordered table-hover">
								<tr>
									<th colspan="2">관리자 문의</th>
									
									<th>입장</th>
								</tr>
								<c:forEach var="senderList" items="${senderList}">
									<c:if test="${senderList.receiverId=='admin'}">
										<tr>
											<td colspan="2">${senderList.roomName}</td>
											
											<td>
												<button onClick='goRoom(${senderList.chatRoomNo},"${senderList.roomName}")'>
													<i class="fa fa-arrow-circle-right"></i>
												</button>
											</td>
										</tr>
									</c:if>
								</c:forEach>
								<tr>
									<td colspan="3"><br><br></td>
								<tr>
								<tr>
									<th colspan="3">관리자에게 문의하기</th>
								</tr>
								<tr>
									<td colspan="3">
										<form id="createRoom" role="form" method="get" action="${contextPath}/createRoom">
											<input type="hidden" name="senderId" value='<sec:authentication property="principal.username"/>'>
											<div class="form-group">
												<label>문의할 내용(=방제목)</label>
												<input type="text" name="roomName" class="form-control" placeholder="관리자에게 문의할 내용(제목)을 입력하세요.">
											</div>
											<input type="hidden" name="receiverId" value='admin'>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<button type="submit" class="form-control">방 만들기</button>
										</form>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					
				</div>
			</div>
		</div><!-- /.col-md-12-end -->
	</div><!-- /.row-end -->	

	<script type="text/javascript">
	var ws;

	function goRoom(number, name){
		location.href="/moveChating?chatRoomNo="+number;
	}
	
	
	
</script>
	
	
	
</body>
</html>