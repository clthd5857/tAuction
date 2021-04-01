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
                        	<h2>사용자 삭제 요청</h2>
                        	<hr>
                            <button id="memberDelete" style="float: right;"class="btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect">삭제</button>&nbsp;&nbsp;
                            <button id="memberRestore" style="float: right;"class="btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect">복구</button>
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
				                <th>삭제여부</th>			              
				            </tr>
				        </thead>
				
				        <tbody id="tableListBody">
				        	<c:forEach var="memberList" items="${memberRemoveList}" varStatus="i">
					        	<tr>
					        		<td>${i.count}</td>
					        		<td>${memberList.memberId}</td>
					        		<td>${memberList.memberName}</td>
					        		<td>${memberList.memberAddress}</td>
					        		<td>${memberList.memberEmail}</td>
					        		<td>${memberList.memberPhoneNumber}</td>
					        		<td><fmt:formatDate value="${memberList.joinDate}" type="date" /></td>
					        		<td style='text-align:center'><input type='checkbox' name='memberChkBxRow' value='${memberList.memberId}'></td>
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
               				<h4>확인 창</h4>
               		</div>
               		<div id="modalBody" class="modal-body">
                		<p>삭제 처리 되었습니다.</p>
                	</div>
            		<div class="modal-footer"> 
        				<button type="button" id="closeBtn" class="btn btn-modal waves-effect">Close</button>
           			</div>
           		</div>
     		
      	</div>
	</div>
	
	<script src="/resources/closer/admin.js"></script>
	 
 	<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	
	//console.log("!!!!!!!");

	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});


	var strModal="";
	var modalBody=$("#modalBody");

	
	$("#memberDelete").on("click",function(){
		var chkLength=$('input[name=memberChkBxRow]:checked').length
		
		if(chkLength>0)
		{
			$('input[name=memberChkBxRow]:checked').each(function(){
				memberDelete($(this).val());
				strModal="<p>삭제 처리 되었습니다.</p>";
				modalBody.html(strModal);
				$(".modal").modal("show");
				
			});
		}
		else
		{
			strModal="<p>선택된 삭제 사용자가 없습니다.</p>";
			modalBody.html(strModal);
			$(".modal").modal("show");
		}

	});

	$("#memberRestore").on("click",function(){
		var chkLength=$('input[name=memberChkBxRow]:checked').length
		
		if(chkLength>0)
		{
			$('input[name=memberChkBxRow]:checked').each(function(){
				memberRestore($(this).val());
				strModal="<p>복구 처리 되었습니다.</p>";
				modalBody.html(strModal);
				$(".modal").modal("show");
				
			});
		}
		else
		{
			strModal="<p>선택된 삭제 사용자가 없습니다.</p>";
			modalBody.html(strModal);
			$(".modal").modal("show");
		}

	});
	function memberDelete(memberId)
	{
		//console.log(memberId);
		adminService.memberDelete(memberId);
	}

	function memberRestore(memberId)
	{
		//console.log(memberId);
		adminService.memberRestore(memberId);
	}

	$("#closeBtn").on("click",function(){
		
			$(".modal").modal("show");
			self.location="/admin/adminMemberRemoveList";
		
	})
	 	
	 	
 	</script>
 

<%@include file="../includes/admin_footer.jsp" %>
