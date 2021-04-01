<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/admin_header.jsp" %>
    <div class="normal-table-area">
        <div class="container">
        	<div class="row">  
                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                 	<div class="normal-table-list" id="boardRemoveList">
                        <div class="basic-tb-hd">
            				<h2 id="boardListTitle" class="title">공지사항</h2>
                       <!-- <button id="insertBtn" class="pull-right btn notika-btn-gray btn-reco-mg btn-button-mg waves-effect">글쓰기</button> -->
                        </div>
                        
                         <!-- 페이지 이동 form (페이징, 검색조건) -->
			<form id="actionForm" action="${contextPath}/admin/adminPostBoardGetList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
				<input type="hidden" name="searchType" value="${pageMaker.cri.searchType}" />
				<input type="hidden" name="searchKeyword" value="${pageMaker.cri.searchKeyword}" />
			</form>
          
			
			
				<div class="table-responsive">
				    <table id="data-table-basic" class="table table-striped" >
				        <thead>
				            <tr>
				                <th>글번호</th>				      
				                <th>제목</th>	
				                <th>내용</th>			    
				                <th>작성자</th>
				                <th>작성일</th>
				                <th>조회수</th>			              
				            </tr>
				        </thead>
				
				        <tbody id="tableListBody"></tbody>
						<!-- <tfoot id="tableListFoot" class="pagination">
						</tfoot> -->
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
                 
                 
                                               
    <script src="/resources/closer/postBoard.js"></script>
    <script>
    	//중복 방지, Modal
    	window.addEventListener('popstate',function(event){
    		history.pushState(null,null,location.href);
    	});
		
		$(document).ready(function(){
			//var result = '<c:out value="${result}" />';
			var result = "${result}";
			checkModal(result);
			history.pushState(null,null,location.href); 
		});
    	
    	
    	function checkModal(result){
    		if(result ==='' || history.state){
    			return;
    		}
    		if(parseInt(result)>0){
    			$(".modal-body").html("게시글"+parseInt(result)+"번이 등록되었습니다.");
    		} else if(result=='modify'){
    			$(".modal-body").html("게시글이 수정되었습니다.");
    		} else if(result=='remove'){
    			$(".modal-body").html("게시글이 삭제되었습니다.");
    		}
    		
    		$("#myModal").modal("show");
    	};
    	
    	$("#insertBtn").on("click",function(){
    		self.location="/admin/adminPostBoardInsert";
    	});
    	
    	//게시물 보기
    	
    	//이름 바꿔주기
    	var actionForm = $("#actionForm");
    	var tableListBody = $("#tableListBody");
    	var tableListFoot = $("#tableListFoot");
    	
    	
    	var pageNum = ${pageMaker.cri.pageNum};
    	var amount = 10;
    	//var amount = ${pageMaker.cri.amount};
    	var searchType = actionForm.find("input[name='searchType']").val() || "";
    	var searchKeyword = actionForm.find("input[name='searchKeyword']").val() || "";
    	
    	var pagingNumCnt = ${pageMaker.pagingNumCnt};
    	var totalPageCnt = ${pageMaker.totalPageCnt};
    	
    	showList(pageNum, amount, searchType, searchKeyword);
    	
    	function showList(pageNum, amount, searchType, searchKeyword){
    		postBoardService.postGetList(
    			{
    			 	pageNum : pageNum,
    			 	amount : amount,
    			 	searchType:searchType,
    			 	searchKeyword:searchKeyword
    			},
    			function(list){
    				var str = "";
    				
    				if(list==null || list.length==0){
    					str +="<tr>"
    						+ "		<td colspan='5'>게시글이 없습니다. </td>"
    						+ "</tr>";
    					tableListBody.html(str);
    					return;
    				} 
    				
    				for(var i=0, len=list.length || 0; i<len; i++){
    					str +="<tr>"
    						+ "		<td>"+(i+1)+"</td>"
    						+ "		<td><a class='move' href='"+list[i].bno+"'>"+list[i].title+"</a></td>"
    						+ "		<td><a class='move' href='"+list[i].bno+"'>"+list[i].contents+"</a></td>"
    						+ "		<td>관리자</td>"
    						+ "		<td>"+postBoardService.showTime(list[i].regDate)+"</td>" 
    						+ "		<td>"+list[i].viewCount+"</td>" 
    						+ "</tr>";
    				}//for-end
    				tableListBody.html(str);
    			
    			}
    		); //boardService.getList-end
    	}; //showList-end
    	
    	

    	
		tableListBody.on("click", "td a", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/admin/adminPostBoardRead");
			
			actionForm.find("input[name='pageNum']").val(pageNum);
			actionForm.find("input[name='amount']").val(amount);
    		actionForm.find("input[name='searchType']").val(searchType);
    		actionForm.find("input[name='searchKeyword']").val(searchKeyword);
			
			actionForm.submit();
		});
    	
    	tableListFoot.on("click","li a", function(e){
    		e.preventDefault();
    		pageNum = $(this).attr("href");
    		showList(pageNum,amount,searchType,searchKeyword);
			
			var offset = $("#boardListTitle").offset();
			//$("html").animate({scrollTop : offset.top},500);
    		
    	});
    	
    	
    	//페이지 이동처리
    	$("#regBtn").on("click",function(){
    		self.location="/admin/adminPostBoardInsert";
    	});
    	
    	
    	
    
    </script>	







<%@include file="../includes/admin_footer.jsp" %>