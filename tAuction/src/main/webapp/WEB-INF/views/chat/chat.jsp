<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>

    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/resources/admin/img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/owl.carousel.css">
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/owl.theme.css">
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/owl.transitions.css">

    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/normalize.css">
	<!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/wave/waves.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/wave/button.css">
    
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/scrollbar/jquery.mCustomScrollbar.min.css">
    
    
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/main.css">
    <!-- style CSS
		=============================/resources/admin===== -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="${contextPath}/resources/admin/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="/resources/admin/js/vendor/modernizr-2.8.3.min.js"></script>
	<script src="/resources/admin/js/vendor/jquery-1.12.4.min.js"></script>
	
	<style>
	#chat{
	    width: 500px;
	    height: 450px;
	}

	/*  스크롤 */
   ::-webkit-scrollbar { width: 7.2px; } /* 스크롤 바 */
   ::-webkit-scrollbar-track { background-color:#fff; } /* 스크롤 바 밑의 배경 */
   ::-webkit-scrollbar-thumb { background: #ddd; border-radius: 10px; } /* 실질적 스크롤 바 */
   ::-webkit-scrollbar-thumb:hover { background: #404040; } /* 실질적 스크롤 바 위에 마우스를 올려다 둘 때 */
   ::-webkit-scrollbar-thumb:active { background: #808080; } /* 실질적 스크롤 바를 클릭할 때 */
   ::-webkit-scrollbar-button { display: none; } /* 스크롤 바 상 하단 버튼 */
   
   .odd {
   position:relative;
   right:30px;
   }
   
</style>
	
	
	
</head>


<body>
	<sec:authentication property="principal" var="pinfo" />
		<!-- 세션 값 -->
		<input type="hidden" id="sessionId" value="">
		
		<!-- 방번호 -->
		<input type="hidden" id="roomNumber" value="${roomInfo.chatRoomNo}">


<div class="row" style="margin : 0 auto;">
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
	
	<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10">
		<div class="notika-chat-list notika-shadow mg-t-30">
			<div class="realtime-ctn">
				<div class="realtime-title">
					<h2>${roomInfo.chatRoomNo}, ${roomInfo.roomName}</h2><span class="pull-right"></span>
				</div>
				
			</div>
            <div class="pull-right">
				<c:if test="${pinfo.username!='admin'}">
					<button type="button" class="btn btn-md btn-primary pull-right" onClick="history.go(-1)">돌아가기</button>
				</c:if>
			</div>
			<div class="card-box">
				<div class="chat-conversation">
					<div id="chat" style="height: 400px; width:100%; overflow:auto; overflow-x:hidden;">
						<ul id="chating" class="conversation-list">
							<c:forEach var="message" items="${messageList}">
								<c:choose>
									<c:when test="${roomInfo.senderId==pinfo.username}">
										<c:if test="${message.senderId==pinfo.username}">
											<li class="clearfix odd">
												<div class="chat-avatar">
													<i class="fa fa-user fa-2x"></i>
													<i>${message.senderId}</i>
												</div>
												<div class="conversation-text">
													<div class="ctext-wrap">
														<p>${message.messageContent}</p>
														<small><fmt:formatDate value="${message.sendTime}" pattern="yyyy-MM-dd HH:mm" /></small>
													</div>
												</div>
												<div>
													
												</div>
											</li>
										</c:if>
										<c:if test="${message.senderId!=pinfo.username}">
											<li class="clearfix">
												<div class="chat-avatar">
													<i class="fa fa-user fa-2x"></i>
													<i>${message.senderId}</i>
													
												</div>
												<div class="conversation-text">
													<div class="ctext-wrap">
														<p>${message.messageContent}</p>
														<small><fmt:formatDate value="${message.sendTime}" pattern="yyyy-MM-dd HH:mm" /></small>
													</div>
												</div>
											</li>
										</c:if>
									</c:when>
									<c:when test="${roomInfo.receiverId == pinfo.username}">
										<c:if test="${message.senderId==pinfo.username}">
											<li class="clearfix odd">
												<div class="chat-avatar">
													<i class="fa fa-user fa-2x"></i>
													<i>${message.senderId}</i>
												</div>
												<div class="conversation-text">
													<div class="ctext-wrap">
														<p>${message.messageContent}</p>
														<small><fmt:formatDate value="${message.sendTime}" pattern="yyyy-MM-dd HH:mm" /></small>
													</div>
												</div>
											</li>
										</c:if>
										<c:if test="${message.senderId!=pinfo.username}">
											<li class="clearfix">
												<div class="chat-avatar">
													<i class="fa fa-user fa-2x"></i>
													<i>${message.senderId}</i>
												</div>
												<div class="conversation-text">
													<div class="ctext-wrap">
														<p>${message.messageContent}</p>
														<small><fmt:formatDate value="${message.sendTime}" pattern="yyyy-MM-dd HH:mm" /></small>
													</div>
												</div>
											</li>
										</c:if>
									</c:when>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
				</div>
					
					
				<div class="chat-widget-input">
					<div class="row">
						<div class="col-sm-12 col-md-12 col-sm-12 col-xs-12 chat-inputbar">
							<div class="form-group todo-flex">
								<div class="nk-int-st">
									<input id="chatting" type="text" class="form-control chat-input" placeholder="Enter your text">
								</div>
								<div>
									<button type="button" onclick="send()" id="sendBtn" class="btn btn-md btn-primary btn-block notika-chat-btn waves-effect">Send</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div><!-- /.card-box -->
		</div>
	</div>
	
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
</div>		
		
 
 
	<input type="hidden" name="userName" id="userName" value="${pinfo.username}">
	
	<script type="text/javascript">
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});
	
	var senderId = "${pinfo.username}";
	var receiverId = "";
	
	
	if(senderId=="${roomInfo.senderId}"){
		receiverId = "${roomInfo.receiverId}";
	} else {
		receiverId = "${roomInfo.senderId}";
	}
	
	//console.log("senderId : "+senderId);
	//console.log("receiverId : "+receiverId);
	
	
	var ws;
	//시작 시 구동
	$(document).ready(function() {
		wsOpen();
		
		$("#chat").scrollTop($("#chat")[0].scrollHeight);
	});
	
	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//리스트 나오게 Ajax
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			
			
			var currentTime = new Date();
			var yyyy = currentTime.getFullYear();
			var mm = (currentTime.getMonth()+1) > 9 ? currentTime.getMonth()+1 : '0'+(currentTime.getMonth()+1);
			var dd = currentTime.getDate() > 9 ? currentTime.getDate() : '0'+(currentTime.getDate());
			var hh = currentTime.getHours() > 9 ? currentTime.getHours() : '0'+(currentTime.getHours());
			var mi = currentTime.getMinutes() > 9 ? currentTime.getMinutes() : '0'+(currentTime.getMinutes());
			var strCurrentTime = yyyy+"-"+mm+"-"+dd+" "+hh+":"+mi;
			
			
			
			
			
			
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						var str = "<li class='clearfix odd'>"
								+ "		<div class='chat-avatar'>"
								+ "			<i class='fa fa-user fa-2x'></i>"
								+ "			<i>"+senderId+"</i>"
								+ "		</div>"
								+ "		<div class='conversation-text'>"
								+ "			<div class='ctext-wrap'>"
								+ "				<p>"+d.msg+"</p>"
								+ "				<small>"+strCurrentTime+"</small>"
								+ "			</div>"
								+ "		</div>"
								+ "</li>";
						$("#chating").append(str);	
						
						$("#chat").scrollTop($("#chat")[0].scrollHeight);
						
					}else{
						var str = "<li class='clearfix'>"
							+ "		<div class='chat-avatar'>"
							+ "			<i class='fa fa-user fa-2x'></i>"
							+ "			<i>"+receiverId+"</i>"
							+ "		</div>"
							+ "		<div class='conversation-text'>"
							+ "			<div class='ctext-wrap'>"
							+ "				<p>"+d.msg+"</p>"
							+ "				<small>"+strCurrentTime+"</small>"
							+ "			</div>"
							+ "		</div>"
							+ "</li>";
						$("#chating").append(str);
						
						$("#chat").scrollTop($("#chat")[0].scrollHeight);
						
					}
						
				}else{
					//console.warn("unknown type!")
				}
			}
		}
		
		//엔터치면 메세지 보내는거
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){
				send();
			}
		});
	}

	//시작 시 구동 끝
	
	
/* 	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	} */

	function send() {
		
		if($("#chatting").val()==''){
			alert("Message를 입력하세요.");
			return;
		}
		
		
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#userName").val(),
			msg : $("#chatting").val()
		}
		
		
		
		
	
		
		var chat = {
			senderId : senderId,
			receiverId : receiverId,
			messageContent : $("#chatting").val(),
			chatRoomNo : $("#roomNumber").val()
		}
		var url = "/InsertChatting"
		
		$.ajax({
			type : 'post',
			url : url,
			data : chat,
			success : function(result, status, xhr){
				//console.log(result);
			}
		});
		
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	
	
	
</script>
	
	
	
    <!-- bootstrap JS
		============================================ -->
    <script src="/resources/admin/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="/resources/admin/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="/resources/admin/js/jquery-price-slider.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="/resources/admin/js/owl.carousel.min.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="/resources/admin/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="/resources/admin/js/meanmenu/jquery.meanmenu.js"></script>
    <!-- counterup JS
		============================================ -->
    <script src="/resources/admin/js/counterup/jquery.counterup.min.js"></script>
    <script src="/resources/admin/js/counterup/waypoints.min.js"></script>
    <script src="/resources/admin/js/counterup/counterup-active.js"></script>
    
    
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="/resources/admin/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    
    
    <!-- sparkline JS
		============================================ -->
    <script src="/resources/admin/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="/resources/admin/js/sparkline/sparkline-active.js"></script>
    <!-- flot JS
		============================================ -->
    <script src="/resources/admin/js/flot/jquery.flot.js"></script>
    <script src="/resources/admin/js/flot/jquery.flot.resize.js"></script>
    <script src="/resources/admin/js/flot/flot-active.js"></script>
    <!-- knob JS
		============================================ -->
    <script src="/resources/admin/js/knob/jquery.knob.js"></script>
    <script src="/resources/admin/js/knob/jquery.appear.js"></script>
    <script src="/resources/admin/js/knob/knob-active.js"></script>
    
    
    
    <!--  todo JS
		============================================ -->
    <script src="/resources/admin/js/todo/jquery.todo.js"></script>
	<!--  wave JS
		============================================ -->
    <script src="/resources/admin/js/wave/waves.min.js"></script>
    <script src="/resources/admin/js/wave/wave-active.js"></script>
    
    <!-- main JS
		============================================ -->
    <script src="/resources/admin/js/main.js"></script>

	
</body>
</html>