<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<%@include file="../includes/header.jsp" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
 	.pagination {
	display: block;
	text-align: center;
	}
	
	.pagination > li > a {
	float: none;
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
                       
    <!-- 페이지 이동 form (페이징, 검색조건) -->
	<form id="actionForm" action="${contextPath}/member/myLikeList" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
		<input type="hidden" name="category" value="${pageMaker.cri.category}" />
		<input type="hidden" name="searchType" value="${pageMaker.cri.searchType}" />
		<input type="hidden" name="searchKeyword" value="${pageMaker.cri.searchKeyword}" />
	</form>
                
                <div class="col-md-9 col-sm-8">
    
	<!-- 검색 조건 -->
	<div class="row">
		<div class="col-sm-12">
			<!-- amount change -->
			<div class="pull-right">
           		<form id='searchForm' action="${contextPath}/member/myLikeList" method="get">
					<select class="form-control" name="category">
						<option value="" ${pageMaker.cri.category == null or empty pageMaker.cri.category ? "selected" : "" }>전체(카테고리)</option>
						<option value="A" ${pageMaker.cri.category eq 'A' and not empty pageMaker.cri.category ? "selected" : "" }>활동</option>
						<option value="B" ${pageMaker.cri.category eq 'B' and not empty pageMaker.cri.category ? "selected" : "" }>리빙</option>
						<option value="C" ${pageMaker.cri.category eq 'C' and not empty pageMaker.cri.category ? "selected" : "" }>예술</option>
						<option value="D" ${pageMaker.cri.category eq 'D' and not empty pageMaker.cri.category ? "selected" : "" }>미술</option>
						<option value="E" ${pageMaker.cri.category eq 'E' and not empty pageMaker.cri.category ? "selected" : "" }>기타</option>
					</select>
					<select class="form-control" name="searchType">
						<option value="TCW" >전체(검색목록)</option>
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
	               <!-- <th>카테고리</th> -->
	               <th>제목</th>
	               <th>작성자</th>
	               <th>작성일</th>
	           </tr>
	       </thead>
	
	       <tbody id="tableListBody"></tbody>
	
	   </table>			    
	</div>
	                    				
    <div id="tableListFoot" class="center">
	</div>
    </div>
       	 </div>
     </div>
    </section>

<script src="${contextPath}/resources/closer/myLikeToBoard.js"></script>
<script>
//csrf 공격 방지
$(document).ajaxSend(function(e, xhr, options) {
	  xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
	  });

//게시물 보기
//이름 바꿔주기
var actionForm = $("#actionForm");
var tableListBody = $("#tableListBody");
var tableListFoot = $("#tableListFoot");

var contextPath ="${contextPath}";

var pageNum = ${pageMaker.cri.pageNum};
var amount = 10;
//var amount = ${pageMaker.cri.amount};
var category = actionForm.find("input[name='category']").val() || "";
var searchType = actionForm.find("input[name='searchType']").val() || "";
var searchKeyword = actionForm.find("input[name='searchKeyword']").val() || "";

var memberId = '<sec:authentication property='principal.username'/>';

var pagingNumCnt = ${pageMaker.pagingNumCnt};
var totalPageCnt = ${pageMaker.totalPageCnt};

//console.log("test :" + totalPageCnt);


showList(pageNum, amount, category, searchType, searchKeyword, memberId);

function showList(pageNum, amount, category, searchType, searchKeyword, memberId){
	memBoardService.getList(
		{	pageNum : pageNum,
		 	amount : amount,
		 	category:category,
		 	searchType:searchType,
		 	searchKeyword:searchKeyword,
		 	memberId: memberId },
		function(list){
			var str = "";
			
			if(list==null || list.length==0){
				str +="<tr>"
					+ "		<td colspan='4' stlye='text-align:center;'>게시글이 없습니다. </td>"
					+ "</tr>";
				tableListBody.html(str);
				return;
			} 
			
			for(var i=0, len=list.length || 0; i<len; i++){
				str +="<tr>"
					+ "		<td>"+list[i].bno+"</td>"
					//+ "		<td>"+list[i].category+"</td>"
					+ "		<td><a class='move' href='"+list[i].bno+"'>"+list[i].title+"</a></td>"
					+ "		<td>"+list[i].memberId+"</td>"
					+ "		<td>"+memBoardService.showTime(list[i].regDate)+"</td>"
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
	actionForm.attr("action", contextPath+"/board/boardRead");
	
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

	showList(pageNum, amount, category, searchType, searchKeyword, memberId);
	
});


//검색창
var searchForm = $("#searchForm");

$("#searchForm button").on("click",function(e){

	e.preventDefault();

		pageNum = 1;
		amount=10;       		
		category = searchForm.find("select[name='category']").val();
		searchType = searchForm.find("select[name='searchType']").val();
		searchKeyword = searchForm.find("input[name='searchKeyword']").val();

		var board = {pageNum : pageNum, amount:amount, category:category,
					 searchType:searchType, searchKeyword:searchKeyword, memberId:memberId}
		memBoardService.getTotalPageCnt(
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
		//console.log("memberId : "+memberId);
		
		showList(pageNum,amount, category ,searchType, searchKeyword, memberId);
			
	});    	

</script>

  
<%@include file="../includes/footer.jsp" %>