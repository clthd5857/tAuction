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
                        	<h2>커뮤니티 삭제 요청 게시물 목록</h2>
                        <hr>
                            <button id="boardDelete" style="float: right;"class="btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect">삭제</button>&nbsp;&nbsp;
                            <button id="boardRestore" style="float: right;"class="btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect">복구</button>
                        </div>
			
			<!-- 리스트 -->
			<div class="table-responsive">
				    <table id="data-table-basic" class="table table-striped" >
				        <thead>
				            <tr>
				                <th>번호</th>				      
				                <th>제목</th>	
				                <th>작성자</th>
				                <th>작성일</th>
				                <th>삭제여부</th>			              
				            </tr>
				        </thead>
				
				        <tbody id="tableListBody">
				        	<c:forEach var="boardList" items="${cmBoardRemoveList}">
					        	<tr>
					        		<td>${boardList.bno}</td>
					        		<td><a href="/cmBoard/cmBoardRead?bno=${boardList.bno}">${boardList.title}</a></td>
					        		<td>${boardList.memberId}</td>
					        		<td><fmt:formatDate value="${boardList.regDate}" type="date" /></td>
					        		<td style="text-align:center;"><input type='checkbox' name='boardChkBxRow' value='${boardList.bno}'></td>
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


$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
});


var strModal="";
var modalBody=$("#modalBody");


$("#boardDelete").on("click",function(){
	var chkLength=$('input[name=boardChkBxRow]:checked').length
	
	if(chkLength>0)
	{
		$('input[name=boardChkBxRow]:checked').each(function(){
			boardDelete($(this).val());
			strModal="<p>삭제 처리 되었습니다.</p>";
			modalBody.html(strModal);
			$(".modal").modal("show");
			
		});
	}
	else
	{
		strModal="<p>선택된 삭제할 게시판이 없습니다.</p>";
		modalBody.html(strModal);
		$(".modal").modal("show");
	}

});

$("#boardRestore").on("click",function(){
	var chkLength=$('input[name=boardChkBxRow]:checked').length
	
	if(chkLength>0)
	{
		$('input[name=boardChkBxRow]:checked').each(function(){
			boardRestore($(this).val());
			strModal="<p>복구 처리 되었습니다.</p>";
			modalBody.html(strModal);
			$(".modal").modal("show");
			
		});
	}
	else
	{
		strModal="<p>복구할 삭제 게시판이 없습니다.</p>";
		modalBody.html(strModal);
		$(".modal").modal("show");
	}

});

function boardDelete(bno)
{

	adminService.cmBoardDelete(bno);
	
}

function boardRestore(bno)
{
	adminService.cmBoardRestore(bno);
	
}

$("#closeBtn").on("click",function(){
	
		$(".modal").modal("show");
		self.location="/admin/adminCmBoardRemoveList";
	
})




</script>





<%@include file="../includes/admin_footer.jsp" %>
