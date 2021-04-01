<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>

<sec:authentication property="principal" var="pinfo" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
                        <h1 class="title">커뮤니티</h1>
                        <p>여러분의 다양한 의견을 남겨주세요.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#page-breadcrumb-->

<section id="projects" class="padding-top">
    <div class="container">
        <div class="row">
        
			<div id="sidebarFix" class="col-md-3 col-sm-4">
                <div class="sidebar portfolio-sidebar">
                    <div class="sidebar-item categories">
                        <h3>Community Categories</h3>
                        <ul class="nav navbar-stacked">
                            <li class="${board.category == '후기' ? 'active' : '' }"><a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=9&category=후기">후기</a></li>
                            <li class="${board.category == 'QnA' ? 'active' : '' }"><a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=9&category=QnA">QnA</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            
            
            
<form id="operForm" action="${contextPath}/cmBoard/cmBoardModify" method="get">
	<input type="hidden" id='bno' name='bno' value='<c:out value="${cmBoard.bno}"/>'>
	<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type="hidden" name='category' value="${cri.category}"/>
	<input type="hidden" name="searchType" value="${cri.searchType}">
	<input type="hidden" name="searchKeyword" value="${cri.searchKeyword}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>


		<div class="container">
            <div class="row">
                <div class="col-sm-9">
                
					<!-- 원본 이미지 -->
					<div class="uploadImageWrapper" >
						<div class="uploadImage">
						
						</div>
					</div>
                         
					<!-- 섬네일 -->
					<div class="imgListWrapper">
						<div class="imgList" id="imgList">
						</div>
					</div>
                     
					<!-- 이미지 끝  -->

					<br>
                    
                    <div class="post-content overflow">
						<h2 class="post-title bold">${cmBoard.title}</h2>
						<h3 class="post-author">${cmBoard.memberId}</h3>
						<ul class="nav navbar-nav navbar-default">
							<li><a href="#"><i class="fa fa-clock-o"></i>${cmBoard.regDate }</a></li>
						</ul>
						<br><br>
						<p  style="white-space:pre-line;">${cmBoard.contents}</p>




					<!-- 첨부파일 표시 -->
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

                    
						<div class="post-bottom overflow">
							<ul class="nav navbar-nav post-nav">
								<li><i class="fa fa-heart"></i>조회수 : ${cmBoard.viewCount}</li>
							</ul><br>
							<span class="pull-right">
							<sec:authentication property="principal" var="pinfo" />
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq cmBoard.memberId}">
									<button type="button" data-oper='modify' class="btn btn-default">수정</button>
								</c:if>
							</sec:authorize>
								
												
								<button type="button" data-oper='list' class="btn btn-info">목록</button>
								<br><br>
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
	            <textarea name="message" id="cmReplyMessage" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
	        </div>   
	        <span class="form-group">
	            <input type="button" id="newCmReply" class="btn btn-submit" value="커뮤니티 댓글등록">
	        </span>
	</div>
	<!-- 댓글 작성창 끝 -->
</sec:authorize>
	              
	              <ul id="cmReplyList" class="media-list"> <!-- 댓글 전체 -->
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
	</div>
</section>
<!--/#projects-->



<script src="${contextPath}/resources/closer/cmReply.js"></script>

<script>
var replyer = "";

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


var operForm = $("#operForm");

$("button[data-oper='modify']").on("click",function(e){
	operForm.attr("action",contextPath+"/cmBoard/cmBoardModify").submit();
});

/* $("button[data-oper='delete']").on("click",function(e){
	operForm.attr("action","/board/cmBoardDelete").submit();
}); */

$("button[data-oper='list']").on("click",function(e){
	operForm.find("#cmBno").remove();
	operForm.attr("action",contextPath+"/cmBoard/cmBoardGetList");
	operForm.submit();			
});


	
	//댓글
  	var cmBnoValue = '<c:out value="${cmBoard.bno}" />';
  	var replyUL = $(".media-list");
  	
  	showReplyList(1);
  	
  	//댓글목록 표시
  	function showReplyList(page) {
  		cmReplyService.cmReplyGetList({bno:cmBnoValue, page:page || 1}, function(replyCnt, list) {
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
  					+ "		<div class='post-comment'>"
  				//  + "		<a class='pull-left' href='#'> <img class='media-object' src='resources/images/blogdetails/2.png' alt=''> </a>"
  					+ "		<div class='media-body'>"
  					+ "			<span><i class='fa fa-user'></i>Posted by <a href='#'>"+ list[i].memberId +"</a></span> "
  					
  					+ "			<button type='button' class='pull-right btn btn-xs btn-danger' name='cmReplyDeleteBtn' data-writer='"+list[i].memberId+"' data-rno='"+ list[i].rno +"' style='float: right; margin: 0px 3px;'>삭제</button>"
                    + "			<button type='button' class='pull-right btn btn-xs btn-info' name='cmReplyModifyBtn' data-writer='"+list[i].memberId+"' data-rno='"+ list[i].rno +"' style='float: right; margin: 0px 3px;'>수정</button>"
  					
  					+ "			<p data-rno='"+ list[i].rno + "' style='overflow:auto; white-space:pre-line;'>"+ list[i].replyContent +"</p>"
  					+ "         <ul data-rno='"+ list[i].rno + "' class='nav navbar-nav post-nav'>"
  					+ "			<li><a href='#'><i class='fa fa-clock-o'></i>"+ cmReplyService.cmReplyDisplayTime(list[i].updateDate) +"</a></li>"
  					+ "			</ul>"
  					+ "		</div>"
  					+ "		</div></li>"
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
                + "		<a class='page-link' href='"+(startNum-1)+"'>이전</a>"
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
                + "		<a class='page-link' href='"+(endNum+1)+"'>다음 </a>"
                + "</li>";
          } else {
			str +="<li class='page-item disabled'>"
                + " "
                + "</li>";
          }
			str += "</ul></div>";
      
      
      replyPageFooter.html(str);
    }
  	    
	//페이지 클릭시 해당 댓글 페이지로 이동
	replyPageFooter.on("click","li a", function(e){
	    e.preventDefault();
	    
	    var targetPageNum = $(this).attr("href");
	    //console.log("targetPageNum: " + targetPageNum);
	    pageNum = targetPageNum;
	    
	    showReplyList(pageNum);
	    
		var offset = $("#cmReplyMessage").offset();
		$("html").animate({scrollTop : offset.top},500);
	});     
  	  
      	
	//댓글등록 이벤트
  	$("#newCmReply").on("click",function(e) {
  		var reply = {
  				replyContent : $("#cmReplyMessage").val(),
  				memberId : replyer,
  				bno : cmBnoValue
  		};
  		
  		cmReplyService.cmReplyInsert(reply, function(result) {
  			alert("댓글등록 result : " + result);
  			
  			$("#cmReplyMessage").val("");
  			showReplyList(-1);
  		})
  	});        	
      
      	

  //수정버튼 클릭
    $("#cmReplyList").on("click","li button[name='cmReplyModifyBtn']", function(e){
      
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
    	
    	
    	
    	
       $("#cmReplyList button[data-rno='"+ rno +"'][name='cmReplyDeleteBtn']").hide();
       $("#cmReplyList p[data-rno='"+ rno +"']").hide();
       
       cmReplyService.cmReplyRead(rno, function(reply) {
    	   var str = "<textarea data-rno='"+reply.rno+"' name='modifyContent' rows='5' style='width:100%; overflow:auto; white-space:pre-line;'>" + reply.replyContent + "</textarea>";
          
    	  $("#cmReplyList button[data-rno='"+ rno +"'][name='cmReplyModifyBtn']").attr("data-mod","modifying");
          $("#cmReplyList ul[data-rno='"+ rno +"']").before(str);
       
          }); 
       });
    
    //수정 또 클릭
    $("#cmReplyList").on("click", "li button[data-mod='modifying']",function(e){
          var rno = $(this).data("rno");
          var replyContent = $("#cmReplyList textarea[name='modifyContent']").val();
          var reply = {rno:rno, replyContent:replyContent};
          
             
      cmReplyService.cmReplyModify(reply, function(result){
             showReplyList(pageNum);
          
       }); 
    });	
	
	
	
  	
  	
      	//댓글 삭제
       	$("#cmReplyList").on("click","li button[name='cmReplyDeleteBtn']", function(e){
	       	 if(!replyer){
	    		 alert("로그인 후 삭제가 가능합니다.");
	    		 return;
	    	 }
       		
  			var rno = $(this).data("rno");
  	      	var originalReplyer = $(this).data("writer");
  	      	
  	      	if(replyer != originalReplyer){
      		  alert("자신이 작성한 댓글만 삭제가 가능합니다.");
      	  		return;
       		}
  	      	
  			if(confirm("댓글을 삭제하시겠습니까?")) {
  			cmReplyService.cmReplyDelete(rno, originalReplyer, function(result) {
  				
//			if(result == "success") {
//  				alert("삭제됨")
//  			}
  			
  				showReplyList(pageNum);
  				
  			});
  			}
      	}); 
      	
      	
	//첨부파일
	$.ajax({
		url: contextPath+'/cmBoard/getAttachList',
		data: {bno: cmBnoValue},
		dataType: 'json',
		type: 'GET',
		success: function(arr){
			var imgListStr="";
			var fileStr="";
			
			$(arr).each(function(i, attach) {
	            
	            
	            if(attach.fileType == 'I') {
	               var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
	               
	               imgListStr += "<span> <img src='"+contextPath+"/display?fileName=" + fileCallPath + "' > </span>";
	               $(".imgListWrapper div").html(imgListStr);
	               
	               $(".uploadImageWrapper div").html("<img src='"+contextPath+"/display?fileName=" + fileCallPath + "' >");
	               
	            } else  {
	               fileStr +="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'"
	                       + "      data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' class='download'>"
	                       + "      <div>"
	                       +          "▶ <span> "+ attach.fileName+"</span><br>"
	                       + "      </div>"
	                       + "</li>";
	               
	               $(".uploadRead ul").html(fileStr);
	            }
	            //console.log("fileStr : "+ fileStr);
	           
	            
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
	
	
	
	// 첨부파일 목록 펼치기
	$('.fa-paperclip').on('click', function() {
	   $('.field-toggle-clip').fadeToggle(200);
	});
	
	
	// 첨부파일 다운로드
	$(".uploadRead").on("click", "li", function(e) {
	   var liObj = $(this);
	   var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));
	   
	   self.location = contextPath + "/download?fileName=" + path;
	});
	   
</script>

<%@include file="../includes/footer.jsp" %>