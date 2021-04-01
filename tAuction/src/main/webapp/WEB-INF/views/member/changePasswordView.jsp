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
    <h3>비밀번호 변경</h3>
    <hr>
    <div class="col-sm-1 col-md-1"></div>
   <div class="col-sm-8 col-md-8">

	 <form id="memberForm" name="memberForm" method="post" action="${contextPath}/member/changePassword" >	
				<div class="form-group"> 
	                 <input type="password" id="memberPassword" class="form-control" oninput="checkPassword()" placeholder="현재 비밀번호(8~12자 이내로 적으시오.)" >
	                 <div  class="alert alert-success" id="alert-successNo">비밀번호 변경 가능합니다.</div>
                 	 <div  class="alert alert-danger" id="alert-dangerNo">기존의 비밀번호가 맞지 않습니다.</div>             
	             </div>	  
	             <div class="form-group">새 비밀번호 :  
	                 <input type="password" name="memberPassword" id="memberPassword_new" class="form-control" placeholder="비밀번호(8~12자 이내로 적으시오.)" disabled="disabled">
	             </div>         
	             <div class="form-group">비밀번호 확인 :  
	                 <input type="password" id="memberPassword_check" class="form-control"  placeholder="비밀번호 확인(8~12자 이내로 적으시오.)" disabled="disabled"/>
	             </div>
	             <div  class="alert alert-success" id="alert-successPassword">비밀 번호가 일치합니다.</div>
                 <div  class="alert alert-danger" id="alert-dangerPassword">비밀번호가 일치하지 않습니다.</div>
	          <div class="form-group">
	          		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	          		<input type="hidden" name="memberId" value='<c:out value="${member.memberId}"/>'>
	                &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="submit" style="margin-left:50px; width:200px; " name="submit" class="btn btn-submit" value="변경하기"> &nbsp;&nbsp;&nbsp;&nbsp; 
	                <input type="reset"  style="  width:200px;" name="reset" class="btn btn-submit" onclick="location.href='/member/myPage?memberId=user05'" value="돌아가기">
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
//csrf 공격 방지
$(document).ajaxSend(function(e, xhr, options) {
	  xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	  });
$(function(){
	$("#alert-successPassword").hide();
	$("#alert-dangerPassword").hide();
	$("#alert-successNo").hide();
	$("#alert-dangerNo").hide();

});
$("input").keyup(function(){
	var memberPassword_new=$("#memberPassword_new").val();
	var memberPassword_check=$("#memberPassword_check").val();
	//console.log(memberPassword_new.length);
	if(memberPassword_new.length>=8 && memberPassword_check.length>0)
	{
		
		//console.log(memberPassword_new);
		//console.log(memberPassword_check);
		
		if(memberPassword_new==memberPassword_check)
		{
			//console.log(memberPassword_new==memberPassword_check);
			$("#submit").removeAttr("disabled"); 
			$("#alert-dangerPassword").hide();
			$("#alert-successPassword").show();
				
		}
		else
		{
			$("#alert-successPassword").hide();
			$("#alert-dangerPassword").show();
			$("#submit").attr("disabled","disabled");
		}
	}
	else
	{
		$("#alert-successPassword").hide();
		$("#alert-dangerPassword").hide();
	}
});

var memberId='<c:out value="${member.memberId}"/>';


function checkPassword(){
	var memberPassword=$("#memberPassword").val();
	memberService.checkPassword({memberId:memberId,memberPassword:memberPassword},function(data){
		if(data=="true")
		{
			$("#alert-dangerNo").hide();
			$("#alert-successNo").show();
			$("#memberPassword_new").removeAttr("disabled"); 
			$("#memberPassword_check").removeAttr("disabled");
		}
		else
		{
			$("#alert-dangerNo").show();
			$("#alert-successNo").hide();
			$("#memberPassword_new").attr("disabled","disabled");
			$("#memberPassword_check").attr("disabled","disabled");
		}
	});
	
}


</script>
  
<%@include file="../includes/footer.jsp" %>