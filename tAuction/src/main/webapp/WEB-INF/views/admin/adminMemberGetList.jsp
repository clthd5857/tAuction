<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/admin_header.jsp" %>

<!-- Normal Table area Start-->
    <div class="normal-table-area">
        <div class="container">
           <div class="row">  
                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                    <div class="normal-table-list" id="boardListTitle">
                        <div class="basic-tb-hd">
                           <h2>회원 목록</h2>
                        </div>
         
         
         
         <!-- 리스트 -->
         <div class="table-responsive">
                <table id="data-table-basic" class="table table-striped" >
                    <thead>
                        <tr>
                            <th>번호</th>                  
                            <th>아이디</th>   
                            <th>이름</th>
                            <th>주소</th>
                            <th>이메일</th>
                            <th>휴대폰</th>
                            <th>가입일자</th>                       
                        </tr>
                    </thead>
            
                    <tbody id="tableListBody">
                       <c:forEach var="memberList" items="${memberList}" varStatus="i">
                          <tr>
                             <td>${i.count}</td>
                             <td id="memberId">${memberList.memberId}</td>
                             <td>${memberList.memberName}</td>
                             <td>${memberList.memberAddress}</td>
                             <td>${memberList.memberEmail}</td>
                             <td>${memberList.memberPhoneNumber}</td>
                             <td><fmt:formatDate value="${memberList.joinDate}" type="date" /></td>
                          </tr>
                       </c:forEach>
                    </tbody>
                  
                  <tfoot id="tableListFoot">
                  
                  </tfoot>
                </table>
                </div>              
            </div>           
              </div>
          </div>
      </div>
    </div>
    
    <!--  Normal Table area --> 
   <div class="modal fade" id="myModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document">
           <div class="modal-content">
         
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4>사용자 정보 창</h4>
                     </div>
                     <div id="modalBody" class="modal-body">
                      
                   </div>
                  <div class="modal-footer"> 
                    <button type="button" id="chat" class="btn btn-modal waves-effect">대화하기</button>
                    </div>
                 </div>
           
         </div>
   </div>
<script src="/resources/closer/member.js"></script>
<script>
$(document).ajaxSend(function(e, xhr, options) {
     xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
     });

var modalBody=$("#modalBody");
var tableListBody=$("#tableListBody");
var modalStr="";
var senderId="";

tableListBody.on("click","tr", function(e){
   e.preventDefault();

   var memberId=$(this).children().eq(1).text();

   memberService.memberInfo(memberId,function(member){
      //console.log(member);
      modalStr="<div class='form-group'>"
            +"  <label>아이디</label>"
            +"  <input class='form-control' value='"+member.memberId+"' readonly='readonly'>"
            +"</div>"
            +"<div class='form-group'>"
            +"  <label>이름</label>"
            +"  <input class='form-control' value='"+member.memberName+"' readonly='readonly'>"
            +"</div>"
            +"<div class='form-group'>"
            +"  <label>이메일</label>"
            +"  <input class='form-control' value='"+member.memberEmail+"' readonly='readonly'>"
            +"</div>"
            +"<div class='form-group'>"
            +"  <label>주소</label>"
            +"  <input class='form-control' value='"+member.memberAddressCode+" "+member.memberAddress+" "+member.memberAddressExtra+" "+member.memberAddressDetail+"' readonly='readonly'>"
            +"</div>"
            +"<div class='form-group'>"
            +"  <label>핸드폰</label>"
            +"  <input class='form-control' value='"+member.memberPhoneNumber+"' readonly='readonly'>"
            +"</div>"
            +"<div class='form-group'>"
            +"  <label>가입 날짜</label>"
            +"  <input class='form-control' value='"+memberService.showDate(member.joinDate)+"' readonly='readonly'>"
            +"</div>";
      modalBody.html(modalStr);
      senderId=member.memberId;
      $(".modal").modal("show");
   })
   
});

$("#chat").on("click",function(){
	
	var roomName = "안녕하세요 관리자입니다.";
	console.log(senderId);
   	var receiverId = 'admin';
   	
   	
   	window.open("/createRoom?roomName="+roomName+"&senderId="+senderId+"&receiverId="+receiverId,'',"width=600,height=650")
   
})
</script>
 

<%@include file="../includes/admin_footer.jsp" %>