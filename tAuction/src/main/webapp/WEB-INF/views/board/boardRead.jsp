<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<sec:authentication property="principal" var="pinfo" />

<style>
   /* 원본 이미지 */
   .uploadImage {
      height:450px;
      width: 100%; 
      background-color:#efefed;
    }
    
   .uploadImage img {
      height:450px;
      width:100%;
      margin: 0px auto;
      display:block;
      object-fit: scale-down; 
   }
   
   /* 이미지 섬네일  */
   .imgListWrapper {
       overflow:auto;
      border : 5px solid #cececc;
      border-radius: 5px;
   }
   
   .imgList {
      height: 80px;
      width : 100%;
       text-align: center;
   }
   
   .imgList span {
      position: relative;
      white-space: nowrap;
      display:inline;
      align-items:center;
   }
   
   .imgList img {
      height:80px;
      width:100px;
      object-fit: scale-down; 
      border : 1px solid gray;
      margin:0 auto;
      display:inline;
   }
   
	.download:hover {
		cursor: pointer;
		color : #00aeef;
	}
   
   
   
/* 중복 : 하나만 옮기기 */   
   /* 섬네일 스크롤 */
   ::-webkit-scrollbar { width: 5.2px; } /* 스크롤 바 */
   ::-webkit-scrollbar-track { background-color:#fff; } /* 스크롤 바 밑의 배경 */
   ::-webkit-scrollbar-thumb { background: #ddd; border-radius: 10px; } /* 실질적 스크롤 바 */
   ::-webkit-scrollbar-thumb:hover { background: #404040; } /* 실질적 스크롤 바 위에 마우스를 올려다 둘 때 */
   ::-webkit-scrollbar-thumb:active { background: #808080; } /* 실질적 스크롤 바를 클릭할 때 */
   ::-webkit-scrollbar-button { display: none; } /* 스크롤 바 상 하단 버튼 */
/* 중복 : 하나만 옮기기 */      

   
   /* 찜 아이콘 */
   .likeIcon {
      width:25px;
   }
   
   /* 첨부 목록 */
   .attach{
      position: absolute;
      position: relative;
      top: -15px;
      right: 0;
      z-index: 1;
   }
   
   .attach i{
       color: black;
       cursor: pointer;
       position: absolute;
       right: 10px;
       top: -15px;
   }
   
   .uploadRead{
      position: absolute;
      border: 1px solid grey;
      border-radius: 5px;
      padding:10px 0px;
      margin:15px 0px;
      width:50%;
      right: 0px;
      background-color:white;
   }
   
   .download:hover {
      cursor: pointer;
      color : #00aeef;
   }
   
      /* 댓글간격 줄이기 */
	.post-comment {
		padding-top: 10px;
		padding-left: 15px;
	}
	.post-comment .media-body {
		padding-bottom: 10px;
	}
   
   	 #sidebarFix {
      position: sticky;
      top:200px;
   }
   
    
</style>


<section id="page-breadcrumb">
    <div class="vertical-center sun">
         <div class="container">
            <div class="row">
                <div class="action">
                    <div class="col-sm-12">
                        <h1 class="title">경매 장터</h1>
                        <p>당신의 재능을 경매하세요</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#page-breadcrumb-->

<form id="operForm" action="${contextPath}/board/boardModify" method="get">
	<input type="hidden" id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
	<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type="hidden" name='category' value="${cri.category}"/>
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="searchKeyword" value="${cri.searchKeyword}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<section id="blog-details" class="padding-top">
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-sm-7">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="single-blog blog-details two-column">


<!-- 원본 이미지  -->
<div class="uploadImageWrapper" >
   <div class="uploadImage">
   </div>
</div>
 
<!-- 썸네일 -->
<div class="imgListWrapper">
   <div class="imgList" id="imgList">
   </div>
</div>
<!-- 이미지 끝  --> 							
							
							<div class="post-content overflow">
								<h2 class="post-title bold">${board.title}</h2>
								<h3 class="post-author">${board.memberId}</h3>
								
		                        
<!-- 첨부파일 표시  210309-->
<div class="attach">
   <i class="fa fa-paperclip"> 첨부파일</i>
   <div class="field-toggle-clip" style="display: none;">
      <div class="uploadRead">
         <ul>
         </ul>
      </div>
   </div>
</div>
<!-- 첨부파일 끝-->		                        
								
								<p  style="white-space:pre-line;">${board.contents} </p>
								<div class="post-bottom overflow">
									<ul class="nav navbar-nav post-nav">
										<li><i class="fa fa-heart"></i>조회수 : ${board.viewCount}</li>
										<li><i class="fa fa-comments"></i>입찰 수 : ${board.bidCount}</li>

<!-- 좋아요 표시 -->
<li>
	<sec:authorize access="isAuthenticated()">
		<i><a href='javascript: like_func();'><img src='${contextPath}/resources/images/dislike.png' class='likeIcon' id='like_img'></a></i> 찜 :  
		<span id="likeCountByBno"></span>
	</sec:authorize>

	<sec:authorize access="isAnonymous()">
		<i><a href='javascript: login_need();'><img src='${contextPath}/resources/images/dislike.png' class='likeIcon'></a></i> 찜 : 
		<span id="likeCountByBno"></span>
	</sec:authorize>
</li>


<!-- 좋아요 표시 끝 -->
										
										
										
									</ul><br>
									<span class="pull-right">
									
										
										<sec:authorize access="isAuthenticated()">
											<c:if test="${pinfo.username eq board.memberId}">
												<c:choose>
													<c:when test="${board.flag=='E' and board.currentPrice>0}">
														<p>낙찰된 경매는 수정할 수 없습니다.</p>
													</c:when>
													<c:otherwise>
														<button type="button" data-oper='modify' class="btn btn-warning">수정</button>
													</c:otherwise>
												</c:choose>
											</c:if>
										</sec:authorize>
										
										
										
										<button type="button" data-oper='list' class="btn btn-info">목록</button>
									</span>
								</div>
							</div>
<!-- 댓글 -->
<div class="response-area">
	<h2 class="bold">Comments</h2>



<sec:authorize access="isAuthenticated()">

	<!-- 댓글작성창  -->
	<div class="contact-form bottom">
	    <h6>댓글작성</h6>
		<div class="form-group">
			<textarea name="message" id="replyMessage" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
		</div>                        
		<span class="form-group">
		    <input type="button" id="newReply" class="btn btn-submit" value="댓글등록">
		</span>
	</div>
	<!-- 댓글 작성창 끝 -->

</sec:authorize>
	
	
	
	<!-- 댓글 전체 -->    
	<ul id="replyList" class="media-list"> 
	   
	</ul>                   
</div><!--/Response-area-->
        
<!-- 댓글 - 페이지네이션 -->
<div class="reply-panel-footer">

</div>
<!-- 댓글 끝 -->


						</div>
					</div>
				</div>
			</div>
			<div id="sidebarFix" class="col-md-3 col-sm-5">
				<div class="sidebar blog-sidebar">
					<div class="sidebar-item  recent">
						<h3>경매 가격</h3>
						<div class="single-price price-three">
							<div class="table-heading">
								<p class="plan-name">현재 경매가</p>
								<p class="plan-price"><span class="price counter"><fmt:formatNumber type="number" value="${board.currentPrice}" /></span><span>원</span></p>
								
							</div>
						</div>
								
						<div class="sidebar-item  recent">
							<h5>최저가 : <span class="counter"><fmt:formatNumber type="number" value="${board.minPrice}" /></span>원</h5>
							<br>
							<c:choose>
								<c:when test="${board.maxPrice==null}">
									<h5>즉시 입찰가가 없습니다.</h5>
								</c:when>
								<c:otherwise>
									<h5>즉시 입찰가 : <span class="counter"><fmt:formatNumber type="number" value="${board.maxPrice}" /></span>원</h5>
								</c:otherwise>
							</c:choose>
						</div>
						
						<!-- 경매 입찰가 -->
						<sec:authorize access="isAuthenticated()">
							<div class="single-price price-three">
								<div class="table-heading">
								
									<div class="form-group">
										<input type="hidden" class="form-control" name="memberId" value="${pinfo.username}">
									</div>
									
									<c:if test="${pinfo.username!=board.memberId}">
										<div class="form-group">
											<input type="text" class="form-control" name="myPrice" inputmode="numeric" placeholder="입찰 값을 입력하세요."><br>
										</div>
										<span class="pull-left"><button type="button" data-oper='bidding' class="btn btn-circle btn-warning">입찰 하기</button></span>
										<span class="pull-right"><button type="button" data-oper='biddingDelete' class="btn btn-danger btn-circle">입찰 취소</button></span>
										<br>
									</c:if>
									
								</div>
							</div>
							
							<div id="myBidding">
								
							</div>
							
							
						</sec:authorize>
						
						
					</div>
				</div>
				<div class="sidebar-item categories">
					<h3>Categories</h3>
					<ul class="nav navbar-stacked">
						<li class="${board.category == 'A' ? 'active' : '' }"><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=A">활동</a></li>
                        <li class="${board.category == 'B' ? 'active' : '' }"><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=B">리빙</a></li>
                        <li class="${board.category == 'C' ? 'active' : '' }"><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=C">예술</a></li>
                        <li class="${board.category == 'D' ? 'active' : '' }"><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=D">미용</a></li>
                        <li class="${board.category == 'E' ? 'active' : '' }"><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=E">기타</a></li>
                    </ul>
				</div>
			</div>
		</div>
	</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
            	처리가 완료되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
	
	
	
</section>

<script src="${contextPath}/resources/closer/reply.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="/resources/js/jquery.counterup.min.js"></script>

<script>


// 폼 숫자 변환
$(document).on('keyup','input[inputmode="numeric"]',function(event){
	this.value = this.value.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
	this.value = this.value.replace(/,/g,'');          // ,값 공백처리
	this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 	
});

$(".counter").counterUp({
	delay : 10,
	time : 1000
})



var replyer = null;

//시큐리티
<sec:authorize access="isAuthenticated()">
	replyer='<sec:authentication property="principal.username"/>';
</sec:authorize>

var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";


$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
});

var contextPath = "${contextPath}";

//페이지 이동
var operForm = $("#operForm");

$("button[data-oper='modify']").on("click",function(e){
	operForm.attr("action", contextPath+"/board/boardModify").submit();
});

$("button[data-oper='list']").on("click",function(e){
	operForm.find("#bno").remove();
	operForm.attr("action", contextPath+"/board/boardGetList");
	operForm.submit();			
});

$("button[data-oper='bidding']").on("click",function(e){

	var minPrice = ${board.minPrice};
	var maxPrice = "${board.maxPrice}";
	var currentPrice = ${board.currentPrice};
	var biddingPrice = $("input[name='myPrice']").val().replace(/,/g,'');
	//console.log(biddingPrice);
	
	if(biddingPrice==""){
		alert("입찰 금액을 입력하세요.");
		return;
	}
	
	
	if(parseFloat(biddingPrice) < parseFloat(minPrice)){
		alert("최소 금액보단 큰 값을 입찰하셔야합니다.");
		return false;
	} else if (parseFloat(biddingPrice) <= parseFloat(currentPrice)){
		alert("입찰 금액은 현재 경매가보다 커야합니다.");
		return false;
	} else if (maxPrice!='' && parseFloat(biddingPrice) > parseFloat(maxPrice)){
		alert("입찰 금액은 최대 금액보다  클 수 없습니다.");
		return false;
	}
	
	
	operForm.attr("action",contextPath+"/board/bidding");
	operForm.attr("method","post");
	var memberId = $("input[name='memberId']");
	var myPrice = $("input[name='myPrice']");
	myPrice.val(myPrice.val().replace(/,/g,''));
	operForm.append(memberId);
	operForm.append(myPrice);
	
	operForm.submit();
})


$("button[data-oper='biddingDelete']").on("click",function(e){
	operForm.attr("action",contextPath+"/board/biddingDelete");
	operForm.attr("method","post");
	var memberId = $("input[name='memberId']");
	operForm.append(memberId);
	
	operForm.submit();
})



//댓글

   var bnoValue = '<c:out value="${board.bno}" />';
   var replyUL = $(".media-list");
   
   showReplyList(1);
   
   //댓글목록 표시
   function showReplyList(page) {
      replyService.replyGetList({bno:bnoValue, page:page || 1}, function(replyCnt, list) {
         if(page == -1) {
            pageNum = Math.ceil(replyCnt/10.0);
            showReplyList(pageNum);
            return;
         }
         
         var str="";
         
         if(list == null || list.length == 0){
            replyUL.html("");
            return;                    
         }
         // *** 수정, 삭제버튼 회원만 보이도록 고쳐야함
         for (var i = 0, len = list.length || 0; i < len; i++) {
            str += "<li class='media' data-rno='"+ list[i].rno + "'>"
               + "      <div class='post-comment'>"
               //+ "      <a class='pull-left' href='#'> <img class='media-object' src='resources/images/blogdetails/2.png' alt=''> </a>"
               + "      <div class='media-body'>"
               + "         <span><i class='fa fa-user'></i>Posted by <a href='#'>"+ list[i].memberId +"</a></span> "
               
               + "         <button type='button' class='pull-right btn btn-xs btn-danger' name='replyDeleteBtn' data-writer='"+list[i].memberId+"' data-rno='"+ list[i].rno +"' style='float: right; margin: 0px 3px;'>삭제</button>"
               + "         <button type='button' class='pull-right btn btn-xs btn-info' name='replyModifyBtn' data-writer='"+list[i].memberId+"' data-rno='"+ list[i].rno +"' style='float: right; margin: 0px 3px;'>수정</button>"
               
               + "         <p data-rno='"+ list[i].rno + "' style='overflow:auto; white-space:pre-line;'>"+ list[i].replyContent +"</p>"
               + "         <ul data-rno='"+ list[i].rno + "' class='nav navbar-nav post-nav'>"
               + "         <li><a href='#'><i class='fa fa-clock-o'></i>"+ replyService.replyDisplayTime(list[i].updateDate) +"</a></li>"
               + "         </ul>"
               + "      </div>"
               + "      </div></li>"
               + "</li>";
         }
         replyUL.html(str);
         showReplyPage(replyCnt);
      });
      
   }
   
      //댓글 페이지출력
   var pageNum = 1;
   var replyPageFooter = $(".reply-panel-footer");
   
   function showReplyPage(replyCnt){
     
     var endNum = Math.ceil(pageNum / 10.0) * 10;  
     var startNum = endNum - 9; 
     
     var prev = startNum != 1;
     var next = false;
     
     if(endNum * 10 >= replyCnt){
       endNum = Math.ceil(replyCnt/10.0);
     }
     
     if(endNum * 10 < replyCnt){
       next = true;
     }
     
     var str = "<ul class='pagination pull-right'>";
     
     if(prev){
            str +="<li class='page-item'>"
               + "      <a class='page-link' href='"+(startNum-1)+"'>이전</a>"
               + "</li>";
         } else {
            str +="<li class='page-item disabled'>"
               + " "
               + "</li>";
         }
     
     for(var i = startNum ; i <= endNum; i++){
       
       var active = pageNum == i? "active":"";
       
       str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
     }
     
     if(next){
            str +="<li class='page-item'>"
                + "      <a class='page-link' href='"+(endNum+1)+"'>다음 </a>"
                + "</li>";
         } else {
            str +="<li class='page-item disabled'>"
                + " "
                + "</li>";
         }
    		str +="</ul></div>";
     
     
     replyPageFooter.html(str);
   }
   
   //페이지 클릭시 해당 댓글 페이지로 이동
   replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       
       var targetPageNum = $(this).attr("href");
       pageNum = targetPageNum;
       
       showReplyList(pageNum);
       
       var offset = $("#replyMessage").offset();
      $("html").animate({scrollTop : offset.top},500);
       
     });     
   
   
   //댓글등록 이벤트
   $("#newReply").on("click",function(e) {
      var reply = {
            replyContent : $("#replyMessage").val(),
            memberId : replyer,
            bno : bnoValue
      };
      
      replyService.replyInsert(reply, function(result) {
         //alert("댓글등록 result : " + result);
         
         $("#replyMessage").val("");
         showReplyList(-1);
      })
   });           
   
   //댓글수정
   //수정버튼 클릭
 $("#replyList").on("click","li button[name='replyModifyBtn']", function(e){
    
	 if(!replyer){
			alert("로그인 후 수정이 가능합니다.");
			return;
		}
		
	var rno = $(this).data("rno");
	var originalReplyer = $(this).data("writer");
		
	if(replyer != originalReplyer){
		alert("자신이 작성한 댓글만 수정이 가능합니다.");
		return;
	}
	 
	 
    $("#replyList button[data-rno='"+ rno +"'][name='replyDeleteBtn']").hide();
    $("#replyList p[data-rno='"+ rno +"']").hide();
    
    replyService.replyRead(rno, function(reply) {
       var str = "<textarea data-rno='"+reply.rno+"' name='modifyContent' rows='5' style='width:100%; overflow:auto; white-space:pre-line;'>" + reply.replyContent + "</textarea>";
       $("#replyList button[data-rno='"+ rno +"'][name='replyModifyBtn']").attr("data-mod","modifying");
       $("#replyList ul[data-rno='"+ rno +"']").before(str);
    
       }); 
    });
 
 //수정 또 클릭
 $("#replyList").on("click", "li button[data-mod='modifying']",function(e){
       var rno = $(this).data("rno");
       var replyContent = $("#replyList textarea[name='modifyContent']").val();
       var reply = {rno:rno, replyContent:replyContent};
       
          
    replyService.replyModify(reply, function(result){
          showReplyList(pageNum);
       
    }); 
 });
   
   
   
   //댓글 삭제
	$("#replyList").on("click","li button[name='replyDeleteBtn']", function(e){
		if(!replyer){
			alert("로그인 후 삭제가 가능합니다.");
			return false;
		}
		
		var rno = $(this).data("rno");
		var originalReplyer = $(this).data("writer");
		
		if(replyer != originalReplyer){
			alert("자신이 작성한 댓글만 삭제가 가능합니다.");
			return false;
		}
      
      if(confirm("댓글을 삭제하시겠습니까?")) {
		replyService.replyDelete(rno,originalReplyer ,function(result) {
		showReplyList(pageNum);
         
		});
      }
	});


   /* ======================================첨부 파일 */
   
	// 첨부파일표시 (이미지표시 & 파일표시)
	$.ajax({
		url: contextPath+'/board/getAttachList',
		data: {bno: bnoValue},
		dataType: 'json',
		type: 'GET',
		success: function(arr) {
			//console.log(arr);         
			var imgListStr="";
			var fileStr="";
         
			$(arr).each(function(i, attach) {
				//console.log(arr.length);
				if(attach.fileType == 'I') {
	               var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
	                 
	               imgListStr += "<span> <img src='"+contextPath+"/display?fileName=" + fileCallPath + "' > </span>";
	               $(".imgListWrapper div").html(imgListStr);
	               
	               $(".uploadImageWrapper div").html("<img src='"+contextPath+"/display?fileName=" + fileCallPath + "' >");
	            
	            } else {
	               fileStr +="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'"
	                     + "    data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' class='download'>"
	                     + "      <div>"
	                     //+ "         <img src='"+contextPath+"/resources/images/attach.png'>"
	                     + "         <span> ▶ "+ attach.fileName+"</span><br>"
	                     + "      </div>"
	                     + "</li>";
	               $(".uploadRead ul").html(fileStr);
	            }
	            
	            
         	});
			
			if (fileStr == ""){
	               $(".attach").hide();
	               
	        }
	            
            if (imgListStr == "") {
               $(".uploadImageWrapper").hide();
               $(".imgListWrapper").hide();
            }
			
      } // end success
   });
   
	//이미지표시
	   $("#imgList").on("mouseover", "img" ,function () {
	      $(this).attr("class", "originImg")
	      $(this).css("background-color","#efefed");
	      
	      
	      $(".uploadImageWrapper div img").remove();
	      $(this).clone().appendTo($(".uploadImageWrapper div"));
	      
	      
	      $("#imgList").on("mouseleave", "img" ,function () {
	         $(this).css("background-color","white");
	      });
	   });
	   
   
   
	//210309 첨부파일 목록 펼치기
	$('.fa-paperclip').on('click', function() {
	   $('.field-toggle-clip').fadeToggle(200);
	});
   
   // 첨부파일 다운로드
   $(".uploadRead").on("click", "li", function(e) {
      var liObj = $(this);
      var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
      
      self.location = contextPath + "/download?fileName=" + path;
   });
   
   
   
   /* ================================================= 좋아요 */
   //var memberId = '<c:out value="${board.memberId}" />';
   
   var userId ="";
   <sec:authorize access="isAuthenticated()">
   		userId = "${pinfo.username}";
   </sec:authorize>
   
   var like_img = $("#like_img");

   $.ajax({
      url: contextPath+'/board/likeToCheck',
      data: {bno:bnoValue, memberId:userId},
      contentType : "text/plain; charset=utf-8",
      dataType: 'text',
      type:'get',
      success: function(result) {
         if(result == 'T') {
            
            like_img.removeAttr('src');
            like_img.attr('src', contextPath+"/resources/images/like.png");
         }
      }
   });

   //찜 카운트 (bno별 카운트)
   $.ajax({
      url: contextPath+'/board/likeCountByBno/' + bnoValue,
      dataType: 'text',
      type:'GET',
      success: function(result) {
         $("#likeCountByBno").html(result);
      }
   });

   //찜 버튼 클릭
   function like_func(){
      $.ajax({
         url: contextPath+'/board/clickLikeBtn',
         data: {bno:bnoValue, memberId:userId},
         contentType : "text/plain; charset=utf-8",
         dataType: 'text',
         type:'get',
         success: function(result) {
            var likeCount = $("#likeCountByBno").text();
            likeCount = parseInt(likeCount);
            //console.log(likeCount);
            
            if(result == 'T') {
               $("#likeCountByBno").html(likeCount+1);
               like_img.removeAttr('src');
               like_img.attr('src', contextPath+"/resources/images/like.png");
            } else {
               $("#likeCountByBno").html(likeCount-1);
               like_img.removeAttr('src');
               like_img.attr('src', contextPath+"/resources/images/dislike.png");
            }
         }
      });
   }

   var Modal = $(".modal");
   var modalContent = $(".modal-body");
   var modalLabel = $("#myModalLabel");
   
   //로그인 안되어있을시 알람창 (찜)
   function login_need(){
      modalContent.text("로그인이 필요한 서비스입니다.");
      modalLabel.text("알림");
      
      $(".modal").modal("show"); 
   }
   
   //*******************************************bidding
   
   
   
	$.ajax({
		type : 'get',
		url : '/board/biddingRead',
		data : {bno : bnoValue, memberId : userId},
		success : function(result){
			var myPrice = $(result).find("myPrice").text();
			var str ="";
			
			myPrice = myPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			//console.log("myPrice : "+myPrice)
			
			if(myPrice==null || myPrice==""){
				str = "<br><pre><h5>현재 나의 입찰 정보가 없습니다.</h5><br></pre>"; 				
			} else {
				str = "<br><pre><h5>현재 나의 입찰가<br><br> <span class='pull-right'>"+myPrice+" 원</span></h5></pre>";
			}
			
			$("#myBidding").append(str);
	   }
   })
   
   
   
   
   
</script>



<%@include file="../includes/footer.jsp" %>