<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<%@include file="../includes/header.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
.btn-custom{
      width:"30%";
      background-color: #4fcccd;
       color: #fff;
       font-size: 14px;
       font-weight: 300;
       letter-spacing: 5px;
          text-transform: uppercase;
       border-radius: 3px;
       border-bottom: 3px solid #2f9697;
         box-shadow: none;
       padding: 10px;
       
   }   
.form-custom{
      
       border: 1px solid #eaeaea;
       font-weight: 300;
       outline: none;
       box-shadow: none;
       height: 40px;
      width:"50%";
         padding: 6px 12px;
       font-size: 14px;
       line-height: 1.42857143;
       color: #555;
       background-color: #fff;
       background-image: none;
       border-radius: 4px;
       -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
       transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
   }   
</style>

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
               <h3>회원정보</h3>
               <hr>
               <div class="col-sm-1 col-md-1"></div>
               
               <div class="col-sm-8 col-md-8" >
                  <div class="form-group" id="checkPassword"> 
                         <input type="password" id="memberPassword" class="form-control" oninput="checkPassword()" placeholder="현재 비밀번호(8~12자 이내로 적으시오.)" >
                          <div  class="alert alert-success" id="alert-successNo">비밀번호 맞습니다.</div>
                          <div  class="alert alert-danger" id="alert-dangerNo">비밀번호가 틀립니다.</div>    
                          <button id="modifyBtn" type="button" class="btn btn-submit">수정하기</button>         
                      </div>
                  
                  
                  <div id="MemberModify">
                     <form id="memberForm" name="memberForm" method="post"  >   
                         <div class="form-group">아이디 : 
                                <input type="text" name="memberId" id="memberId" class="form-control" value='<c:out value="${member.memberId}"/>' readonly="readonly">
                                <p></p>
                            </div>
                              <div class="form-group">성명 : 
                                 <input type="text" id="memberName" name="memberName" class="form-control" value='<c:out value="${member.memberName}"/>' >
                                 </div>
                              <div class="form-group">휴대폰 번호 : 
                                 <input type="text" name="memberPhoneNumber" class="form-control" value='<c:out value="${member.memberPhoneNumber}"/>' >
                            </div>        
                              <div class="form-group">이메일 주소 : 
                                <input type="email" name="memberEmail" class="form-control" value='<c:out value="${member.memberEmail}"/>'  readonly="readonly" >
                            </div>
                             <div class="form-group">
                                우편 번호<br>
                                <input type="text" name="memberAddressCode" class="form-custom" id="sample6_postcode" value='<c:out value="${member.memberAddressCode}"/>' >
                                <input type="button" class="btn btn-custom" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
                            </div>
                             <div class="form-group">주소 정보
                                <input type="text" name="memberAddress" class="form-control" id="sample6_address"  value='<c:out value="${member.memberAddress}"/>' >
                            </div>
                              <div class="form-group">상세 주소
                                <input type="text" name="memberAddressDetail" id="sample6_detailAddress" class="form-control" value='<c:out value="${member.memberAddressDetail}"/>'  >
                            </div>
                             <div class="form-group">참고 항목
                                 <input type="text" class="form-control" id="sample6_extraAddress" value='<c:out value="${member.memberAddressExtra}"/>' placeholder="참고항목" >
                               </div>  
                        
                         
                            <div class="form-group">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                               <input type="submit" id="submit" style="margin-left:50px; width:200px; " name="submit" class="btn btn-submit" value="수정 반영하기"> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button"  id="cancle" style="  width:200px;"  class="btn btn-submit" value="취소">
                             </div>
                     </form>
                  </div>
                </div>
                
                <div class="col-sm-3 col-md-3"></div>
               </div>
         </div>
           </div>
     </div>
    </section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/closer/member.js"></script>
<script>
//csrf 공격 방지
$(document).ajaxSend(function(e, xhr, options) {
     xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
     });
     
var contextPath = "${contextPath}";


$("#MemberModify").hide();
$("#alert-successNo").hide();
$("#alert-dangerNo").hide();

function checkPassword(){
   var memberId='<c:out value="${member.memberId}"/>';
   var memberPassword=$("#memberPassword").val();
   
   memberService.checkPassword({memberId:memberId,memberPassword:memberPassword},function(data){
      if(data=="true")
      {
         $("#alert-dangerNo").hide();
         $("#alert-successNo").show();
         $("#modifyBtn").removeAttr("disabled");
      }
      else
      {
         $("#alert-dangerNo").show();
         $("#alert-successNo").hide();
         $("#modifyBtn").attr("disabled","disabled");
      }
   });
   
}

$("#modifyBtn").on("click",function(e){
   $("#checkPassword").hide();
   $("#MemberModify").show();
   $(this).hide();
   
})



     
//카카오 우편번호 API
function sample6_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }
                   // 조합된 참고항목을 해당 필드에 넣는다.
                   document.getElementById("sample6_extraAddress").value = extraAddr;
               
               } else {
                   document.getElementById("sample6_extraAddress").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode').value = data.zonecode;
               document.getElementById("sample6_address").value = addr;
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("sample6_detailAddress").focus();
           }
       }).open();
   } 


$("#submit").on("click",function(e){
   $("#memberId").removeAttr("readonly");
   $("#memberForm").attr("action",contextPath+"/member/memberModify").submit();
   
   
});



$("#cancle").on("click",function(e){
   self.location=contextPath+"/index/index";
})
</script>

  
<%@include file="../includes/footer.jsp" %>