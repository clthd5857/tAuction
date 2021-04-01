<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<style>
/* .pagination {
    padding-left: 20%;
    } */

    
 	.pagination {
	display: block;
	text-align: center;
	}
	
	.pagination > li > a {
	float: none;
	} 
	
	#sidebarFix {
      position: sticky;
      top:200px;
   }
	
	
	
/* 	.pagination {
	margin: 10%;
	} */
	
/* 	.pagination {
   justify-content: center;
	} */
</style>

<section id="page-breadcrumb">
    <div class="vertical-center sun">
         <div class="container">
            <div class="row">
                <div class="action">
                    <div class="col-sm-12">
                        <h1 id="boardListTitle" class="title">커뮤니티</h1>
                        <p>여러분의 다양한 의견을 남겨주세요.</p>
                        <span class="pull-right">
                        	
                        	
                        	<sec:authorize access="isAuthenticated()">
                        		<button id="insertBtn" class="btn btn-info">작성 하기</button>
                        	</sec:authorize>
                        	
                        	
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--/#page-breadcrumb-->

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

<section id="projects" class="padding-top">
    <div class="container">
        <div class="row">
            <div id="sidebarFix" class="col-md-3 col-sm-4">
                <div class="sidebar portfolio-sidebar">
                    <div class="sidebar-item categories">
                        <h3>Community Categories</h3>
                        <ul class="nav navbar-stacked">
							<%-- <li><a href="${contextPath}/cmBoard/cmBoardGetList">커뮤니티 게시판 목록<span class="pull-right"></span></a></li> --%>
                            <li><a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=10&category=후기">후기<span class="pull-right"></span></a></li>
                            <li><a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=10&category=QnA">QnA<span class="pull-right"></span></a></li>
                        </ul>
                    </div>
                </div>
                
                <div>
	               <img src="/resources/images/listBanner.png" width="90%">
	            </div>
                
                
            </div>
            
            
            
            <!-- 페이지 이동 form (페이징, 검색조건) -->
			<form id="actionForm" action="${contextPath}/cmBoard/cmBoardGetList" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
				<input type="hidden" name="category" value="${pageMaker.cri.category}" />
				<input type="hidden" name="searchType" value="${pageMaker.cri.searchType}" />
				<input type="hidden" name="searchKeyword" value="${pageMaker.cri.searchKeyword}" />
			</form>

            
            <!-- 리스트 -->
			<div class="col-md-9 col-sm-8">

			<!-- 검색 조건 -->
			<div class="row">
				<div class="col-sm-12">
					<!-- amount change -->
					<div class="pull-right">
		           		<form id='searchForm' action="${contextPath}/cmBoard/cmBoardGetList" method="get">
							<select class="form-control" name="category">
								<option value="" ${pageMaker.cri.category == null or empty pageMaker.cri.category ? "selected" : "" }>커뮤니티 게시판</option>
								<option value="후기" ${pageMaker.cri.category eq 'Reviews' and not empty pageMaker.cri.category ? "selected" : "" }>후기</option>
								<option value="QnA" ${pageMaker.cri.category eq 'QnA' and not empty pageMaker.cri.category ? "selected" : "" }>QnA</option>
							</select>
							<select class="form-control" name="searchType">
								<option value="TCW" >모든 조건</option>
								<option value="T" ${pageMaker.cri.searchType eq 'T' and not empty pageMaker.cri.searchKeyword ? "selected" : ""}>제목</option>
								<option value="C" ${pageMaker.cri.searchType eq 'C' and not empty pageMaker.cri.searchKeyword ? "selected" : ""}>내용</option>
								<option value="W" ${pageMaker.cri.searchType eq 'W' and not empty pageMaker.cri.searchKeyword ? "selected" : ""}>작성자</option>
								<option value="TC" ${pageMaker.cri.searchType eq 'TC' and not empty pageMaker.cri.searchKeyword ? "selected" : ""}>제목 or 내용</option>
								<option value="TW" ${pageMaker.cri.searchType eq 'TW' and not empty pageMaker.cri.searchKeyword ? "selected" : ""}>제목 or 작성자</option>
								<option value="CW" ${pageMaker.cri.searchType eq 'CW' and not empty pageMaker.cri.searchKeyword ? "selected" : ""}>내용 or 작성자</option>
								<%-- <option value="TCW" ${pageMaker.cri.searchType eq 'TCW' and not empty pageMaker.cri.searchKeyword ? "selected" : ""}>제목 or 내용 or 작성자</option> --%>
							</select>
							<div class="form-group input-group">
								<input class="form-control" type='text' name="searchKeyword" value="${pageMaker.cri.searchKeyword}">
								<span class="input-group-btn">	
									<button type="submit" class="btn btn-default">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>	
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" >
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}" >
		           		</form>
		           	</div><!-- /.pull-right input-sm -->
				</div><!-- /.col-sm-6 -->
			</div><!-- /.row -->    
			
				<div class="table-responsive">
				    <table id="data-table-basic" class="table table-striped" >
				        <thead>
				            <tr>
				                <th>글 번호</th>
				                <th>카테고리</th>
				                <th>제목</th>
				                <th>작성자</th>
				                <th>작성일</th>
				            </tr>
				   		</thead>
				   		<c:forEach var="postBoard" items="${postBoard}">
				   			<tr style="background-color:lightblue;">
				   				<td>*</td>
				   				<td>공지사항</td>
				   				<td><a href="/postBoard/postBoardRead?bno=${postBoard.bno}">${postBoard.title}</a></td>
				   				<td>관리자</td>
				   				<td><fmt:formatDate value="${postBoard.regDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
				   				
				   				</td>
				   			</tr>
				   		</c:forEach>
				        <tbody id="tableListBody"></tbody>

				    </table>			    
				</div>
                        				
                <div id="tableListFoot" class="center">
				</div>
				
				<div style="text-align: center;">
					<ul class="pagination">
					</ul>
				</div>
            </div>
        </div><!-- /.row -->
        
    </div>
</section>
<!--/#projects-->



    <script src="${contextPath}/resources/closer/cmBoard.js"></script>
    <script>
    	//중복 방지, Modal
    	window.addEventListener('popstate',function(event){
    		history.pushState(null,null,location.href);
    	});
    
		
		$(document).ready(function(){
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
    	
    	
    	var contextPath = "${contextPath}";
    	
    	var csrfHeaderName = "${_csrf.headerName}";
    	var csrfTokenValue = "${_csrf.token}";
    	
    	$(document).ajaxSend(function(e, xhr, options){
    		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
    	});
    	
    	
    	$("#insertBtn").on("click",function(){
    		self.location= contextPath+"/cmBoard/cmBoardInsert";
    	});
    	
    	//게시물 보기
    	
    	//이름 바꿔주기
    	var actionForm = $("#actionForm");
    	var tableListBody = $("#tableListBody");
    	var tableListFoot = $("#tableListFoot");
    	
    	
    	var pageNum = ${pageMaker.cri.pageNum};
    	var amount = 10;
    	//var amount = ${pageMaker.cri.amount};
    	var category = actionForm.find("input[name='category']").val() || "";
    	var searchType = actionForm.find("input[name='searchType']").val() || "";
    	var searchKeyword = actionForm.find("input[name='searchKeyword']").val() || "";
    	
    	var pagingNumCnt = ${pageMaker.pagingNumCnt};
    	var totalPageCnt = ${pageMaker.totalPageCnt};
    	
    	showList(pageNum, amount, category, searchType, searchKeyword);
    	
    	function showList(pageNum, amount, category, searchType, searchKeyword){
    		cmBoardService.getList(
    			{
    			 	pageNum : pageNum,
    			 	amount : amount,
    			 	category:category,
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
    						+ "		<td>"+list[i].bno+"</td>"
    						+ "		<td>"+list[i].category+"</td>"
    						+ "		<td><a class='move' href='"+list[i].bno+"'>"+list[i].title+"</a></td>"
    						+ "		<td>"+list[i].memberId+"</td>"
    						+ "		<td>"+cmBoardService.showTime(list[i].regDate)+"</td>"
    						/* + "		<td>"+cmBoardService.showTime(list[i].updateDate)+"</td>" */
    						+ "</tr>";
    				}//for-end
    				tableListBody.html(str);
    				showBoardPage(totalPageCnt);
    			}
    		); //boardService.getList-end
    	}; //showList-end
    	
    	
    	function showBoardPage(PageCnt){
    		var endPage = Math.ceil(pageNum/(pagingNumCnt*1.0))*pagingNumCnt;
    		var startPage = endPage - (pagingNumCnt - 1);
    		
    		var prev = (startPage!=1);
    		var next = false;
    		
    		if(endPage*amount >= PageCnt){
    			endPage = Math.ceil(PageCnt/(amount*1.0));
    		}
    		
    		
    		if(endPage*amount <PageCnt){                                                             
    			next = true;
    		}
    		
    		
    		
     		var str ="<ul class='pagination'>";
    		
    		
    		if(prev==true){
    			str +="	<li class='page-item'>"
    				+ "		<a class='page-link' href='"+(startPage-1)+"'></a>"
    				+ "	</li>";
    		} else {
    			str +="	<li class='page-item disabled'>"
    				+ "					"
    				+ "	</li>";
    		}
    		
    		
    		for(var i=startPage;i<=endPage;i++){
    			var active = (pageNum==i ? "active" : "");
    			
    			str +="	<li class='page-item "+active+" '>"
    				+ "		<a class='page-link' href='"+i+"'>"+i+"</a>"
    				+ "	</li>";
    		}//for-end
    		
    		if(next==true){
    			str +="	<li class='page-item'>"
    				+ "		<a class='page-link' href='"+(endPage+1)+"'> </a>"
    				+ "	</li>";
    		} else {
    			str +="	<li class='page-item disabled'>"
    				+ "					"
    				+ "	</li>";
    		}
			str +="			</ul>"
				+ "		</td>"
				+ "</tr>";
    		tableListFoot.html(str);
    	}; // showBoardPage-end
    	

    	
		tableListBody.on("click", "td a", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", contextPath+"/cmBoard/cmBoardRead");
			
			actionForm.find("input[name='pageNum']").val(pageNum);
			actionForm.find("input[name='amount']").val(amount);
    		actionForm.find("input[name='category']").val(category);
    		actionForm.find("input[name='searchType']").val(searchType);
    		actionForm.find("input[name='searchKeyword']").val(searchKeyword);
			
			actionForm.submit();
		});
    	
    	tableListFoot.on("click","li a", function(e){
    		e.preventDefault();
    		pageNum = $(this).attr("href");
    		showList(pageNum,amount,category,searchType,searchKeyword);
			
			var offset = $("#boardListTitle").offset();
			//$("html").animate({scrollTop : offset.top},500);
    		
    	});
    	
    	
    	//페이지 이동처리
    	$("#regBtn").on("click",function(){
    		self.location=contextPath+"/cmBoard/cmBoardInsert";
    	});
    	
    	
    	//검색창
       	var searchForm = $("#searchForm");

    	$("#searchForm button").on("click",function(e){
    		/* if(!searchForm.find("option:selected").val()){
    			alert("검색 종류를 선택하세요.");
    			return false;
    		} */
       			
       		e.preventDefault();
       		//searchForm.submit();
			pageNum = 1;
       		amount=10;       		
       		category = searchForm.find("select[name='category']").val();
       		searchType = searchForm.find("select[name='searchType']").val();
       		searchKeyword = searchForm.find("input[name='searchKeyword']").val();
       		
       		var board = {pageNum : pageNum, amount:amount, category:category, searchType:searchType, searchKeyword:searchKeyword}
       		cmBoardService.getTotalPageCnt(
     			board,
       			function(result){
     				totalPageCnt = result;
     				//console.log("totalPageCnt :" +totalPageCnt);
     			}
     		);
       		
       		//console.log("pageNum : "+pageNum);
       		//console.log("amount : "+amount);
       		//console.log("category : "+category);
       		//console.log("searchType : "+searchType);
       		//console.log("searchKeyword : "+searchKeyword);
       		
       		showList(pageNum,amount, category ,searchType, searchKeyword);
       			
       	});    	
    	
    </script>	







<%@include file="../includes/footer.jsp" %>