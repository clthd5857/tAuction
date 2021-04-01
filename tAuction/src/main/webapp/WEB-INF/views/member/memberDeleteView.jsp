<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<%@include file="../includes/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<section id="projects" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4">
                    <div class="sidebar portfolio-sidebar">
                        <div class="sidebar-item categories">
                            <h3>마이 페이지</h3>
                            <ul class="nav navbar-stacked">
                                <li class="active"><a href="${contextPath}/member/myPage?memberId=<sec:authentication property='principal.username'/>">회원정보<span class="pull-right"></span></a></li>                       
                                <li class="active"><a href="${contextPath}/member/changePasswordView?memberId=<sec:authentication property='principal.username'/>">비밀번호 변경<span class="pull-right"></span></a></li>
                                <li class="active"><a href="${contextPath}/member/myBiddingList?memberId=<sec:authentication property='principal.username'/>">입찰/낙찰 내역<span class="pull-right"></span></a></li>
                                <li class="active"><a href="${contextPath}/member/myLikeList?memberId=<sec:authentication property='principal.username'/>">찜<span class="pull-right"></span></a></li>
                                <li class="active"><a href="${contextPath}/member/myBoardList?memberId=<sec:authentication property='principal.username'/>">내가 쓴 글<span class="pull-right"></span></a></li>                           
                                <li class="active"><a href="${contextPath}/member/memberDeleteView?memberId=<sec:authentication property='principal.username'/>">회원탈퇴<span class="pull-right"></span></a></li>
                            </ul>
                        </div>
                    </div>
        		</div>
                       
                <div class="col-md-9 col-sm-8">
                    <div class="row">
    <h3>회원탈퇴</h3>
    <hr>
    <div class="col-sm-1 col-md-1"></div>
   <div class="col-sm-8 col-md-8" >
	<form id="memberForm" name="memberForm" method="post" >
	 	<div class="container">
	  	 <div class="col-sm-15 col-md-5">
	  	 	<div class="col-md-30">
                        <ul id="tab1" class="nav nav-tabs">
                            <li class="active"><a href="#tab1-item1" data-toggle="tab">유의사항</a></li>                        
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="tab1-item1">
                               <div style="overflow:scroll; width:100%; height:150px;">
                                <p><strong>회원 탈퇴 전 유의사항 내용을 확인해주세요.</strong></p> 
                                <p>1)회원탈퇴 시 회원전용 서비스 이용은 불가합니다.</p>
                                <p>2)회원탈퇴 시 회원정보는 일괄 삭제됩니다.</p>
                                <p>3)탈퇴 후 3일동안은 재가입이 불가합니다.</p>
                                <p>4)회원탈퇴 후 서비스에 입력하신 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성한 본인을 확인할 수 없으므로 내용 수정 및 삭제가 불가합니다.</p>                              
                            	</div>
                            </div>
                         </div>
                        <a>회원탈퇴 시 유의사항 안내 확인 동의</a> <input type="checkbox" id="checkbox">
                    </div>
                </div>
  			</div> <hr>
	 		
			
	     
	       
	                     
	          <div class="form-group">비밀번호 :  
	              <input type="password" name="memberPassword" id="memberPassword" class="form-control" required="required" oninput="checkPassword()">
	           </div>
	          <div  class="alert alert-success" id="alert-successPassword">비밀 번호가 일치합니다.</div>
              <div  class="alert alert-danger" id="alert-dangerPassword">비밀번호가 일치하지 않습니다.</div>
	             
	          <div class="form-group">
	          <input type="hidden" name="memberId" id="memberId" class="form-control" value='<c:out value="${member.memberId}"/>'>
	          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="submit" style="margin-left:50px; width:200px; " name="submit" class="btn btn-submit" value="탈퇴하기"> &nbsp;&nbsp;&nbsp;&nbsp; 
	                <input type="reset"  style="  width:200px;" name="reset" class="btn btn-submit" onclick="location.href='myPage'" value="돌아가기">
	          </div>
	     
		 	</form>
	 	</div>
	 	<div class="col-sm-3 col-md-3"></div>
               </div>
			</div>
       	 </div>
     </div>
</section>
<script src="${contextPath}/resources/closer/member.js"></script>
<script>
$(document).ajaxSend(function(e, xhr, options) {
	  xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	  });
	  
var contextPath = "${contextPath}";
	  
$(function(){
	$("#alert-successPassword").hide();
	$("#alert-dangerPassword").hide();


});
var memberForm=$("#memberForm");
function checkPassword(){
	var memberId='<sec:authentication property="principal.username"/>';
	var memberPassword=$("#memberPassword").val();
	memberService.checkPassword({
		memberId:memberId,
		memberPassword:memberPassword
		},function(data){
		if(memberPassword.length>=8)
		{
				
			if(data=="true")
			{
				$("#submit").removeAttr("disabled"); 
				$("#alert-dangerPassword").hide();
				$("#alert-successPassword").show();
				$("#submit").on("click",function(){
					if($("#checkbox").is(":checked")==true)
					{
						memberForm.attr("action", contextPath+"/member/memberRemove").submit(); 
						
					}
					else
					{
						alert("약관 확인을 체크하시오");
						return false;
					}
				})
			}
			else
			{
				$("#alert-successPassword").hide();
				$("#alert-dangerPassword").show();
				$("#submit").attr("disabled","disabled");
			}
		}
		else{
			$("#alert-successPassword").hide();
			$("#alert-dangerPassword").hide();
		}
	});
	
}



</script>

  
<%@include file="../includes/footer.jsp" %>