<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@include file="../includes/header.jsp" %>

<style>
 	.portfolio-single {
		text-align : center;
		margin:20px 0px;
	}
	.portfolio-thumb {
		display:flex;
		align-items:center;
		height:270px;
		background-color:black;
	}
	.portfolio-thumb img {
		height:100%;
		width:100%;
		object-fit:scale-down;
	}
	
	
	   .portfolio-wrapper {
      background-color:#F7F7F7;
   }
   .portfolio-wrapper:hover {
      background-color:#e2e0e0;
   }
      
   .logos {
      height : 430px;
      margin : 15px 0px ;
   }
   
   #sidebarFix {
      position: sticky;
      top:200px;
   }
   
   a {
      color: #090909;
      text-decoration: none
   }
   
   a:focus, a:hover {
      color: #090909;
   }
	
	
	
</style>

<section id="page-breadcrumb">
    <div class="vertical-center sun">
         <div class="container">
            <div class="row">
                <div class="action">
                    <div class="col-sm-12">
                        <h1 id="boardListTitle" class="title">경매 장터</h1>
                        <p>당신의 재능을 경매하세요</p>
                        <span class="pull-right">
                        	<sec:authorize access="isAuthenticated()">
                        		<button id="insertBtn" class="btn btn-info">작성하기</button>
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
                        <h3>Categories</h3>
                        <ul class="nav navbar-stacked">
							<li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=A">활동</a></li>
                            <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=B">리빙</a></li>
                            <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=C">예술</a></li>
                            <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=D">미용</a></li>
                            <li><a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=E">기타</a></li>
                        </ul>
                    </div>
                </div>
                 <!-- 광고배너 -->
	            
	            <div>
	               <img src="/resources/images/listBanner.png" width="90%">
	            </div>
                
                
            </div>
            
            
            
            <!-- 페이지 이동 form -->
			<form id="actionForm" action="${contextPath}/board/boardGetList" method="get">
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
			           		<form id='searchForm' action="${contextPath}/board/boardGetList" method="get">
								<select class="form-control" name="category">
									<option value="" ${pageMaker.cri.category == null or empty pageMaker.cri.category ? "selected" : "" }>경매 게시판</option>
									<option value="A" ${pageMaker.cri.category eq 'A' and not empty pageMaker.cri.category ? "selected" : "" }>활동</option>
									<option value="B" ${pageMaker.cri.category eq 'B' and not empty pageMaker.cri.category ? "selected" : "" }>리빙</option>
									<option value="C" ${pageMaker.cri.category eq 'C' and not empty pageMaker.cri.category ? "selected" : "" }>예술</option>
									<option value="D" ${pageMaker.cri.category eq 'D' and not empty pageMaker.cri.category ? "selected" : "" }>미용</option>
									<option value="E" ${pageMaker.cri.category eq 'E' and not empty pageMaker.cri.category ? "selected" : "" }>기타</option>
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
					</div>
					<!-- /.col-sm-6 -->
				</div>
				<!-- /.row -->
				
				<div id="tableListBody" class="row">
					<!-- 글 목록 처리 -->
                    
				</div>
				
                <div class="portfolio-pagination">
					<ul id="tableListFoot" class="pagination">
						<!-- 페이징 처리 -->
					</ul>
				</div>
            </div>
        </div>
        <!-- /.row -->
        
    </div>
</section>
<!--/#projects-->


    <script src="${contextPath}/resources/closer/board.js"></script>
    <script>
    	
    
    	var contextPath = "${contextPath}";
    	
    	var csrfHeaderName = "${_csrf.headerName}";
    	var csrfTokenValue = "${_csrf.token}";


    	$(document).ajaxSend(function(e, xhr, options){
    		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
    	});

    	
    	
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
    		} else if(result=='biddingEnd'){
    			$(".modal-body").html("즉시 입찰하셨습니다. 채팅방을 통해 판매자와 만나보세요!");
    		}
    		
    		$("#myModal").modal("show");
    	};
    	
    	$("#insertBtn").on("click",function(){
    		self.location= contextPath+"/board/boardInsert";
    	});
    	
    	
    	//게시물 보기
    	var actionForm = $("#actionForm");
    	var tableListBody = $("#tableListBody");
    	var tableListFoot = $("#tableListFoot");
    	
    	
    	
    	var pageNum = ${pageMaker.cri.pageNum};
    	var amount = 9;
    	//var amount = ${pageMaker.cri.amount};
    	var category = actionForm.find("input[name='category']").val() || "";
    	var searchType = actionForm.find("input[name='searchType']").val() || "";
    	var searchKeyword = actionForm.find("input[name='searchKeyword']").val() || "";
    	
    	var pagingNumCnt = ${pageMaker.pagingNumCnt};
    	var totalPageCnt = ${pageMaker.totalPageCnt};
    	
    	showList(pageNum, amount,category, searchType, searchKeyword);
    	
    	function showList(pageNum, amount, category,searchType, searchKeyword){
    		boardService.getList(
    			{
    			 	pageNum : pageNum,
    			 	amount : amount,
    			 	category:category,
    			 	searchType:searchType,
    			 	searchKeyword:searchKeyword
    			},
    			function(list){
    				var str = "";
    				var imgStr = "";
    				
    				if(list==null || list.length==0){
    					str +="<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>"
    						+ "		<h1 style='text-align:center'>게시글이 없습니다.<br><br>당신의 재능을 경매하세요.</h1>"
    						+ "</div>";
    					tableListBody.html(str);
    					return;
    				} 
    				
    				for(var i=0, len=list.length || 0; i<len;i++){
    					
   	                   str +="<div class='col-xs-6 col-sm-6 col-md-4 portfolio-item branded logos'>"
   	                       + "      <a href='"+list[i].bno+"'>"
   	                       + "       <div class='portfolio-wrapper'>"
   	                       + "            <div class='portfolio-single'>"
   	                       + "               <div class='portfolio-thumb'>";
   	                    
   	                    if(list[i].imageFileName){
   	                       //console.log(list[i].imageFileName);
   	                       var fileCallPath = encodeURIComponent(list[i].imageFileName);
   	                       str   +="               <img src='"+contextPath+"/display?fileName="+fileCallPath+"' class='img-responsive' style='margin:auto;' alt=''>";
   	                    } else {
   	                       str   +="               <img src='"+contextPath+"/resources/images/portfolio/1.jpg' class='img-responsive' style='margin:auto;' alt=''>";
   	                    }
   	                    str +="               </div>"
   	                       + "            </div>"
   	                       + "            <div class='portfolio-info'>"
   	                    //   + "               <p>("+list[i].bno+"), 카테고리 : "+list[i].category+"</p>"
   	                    //   + "               <p>조회수 : "+list[i].viewCount+" 입찰수 : "+list[i].bidCount+"</p>"
   	                       + "               <h2 style='color:#337ab7; font-weight:bold;'>"+list[i].title+"</h2>"
   	                       + "               <span class='pull-right' style='color:#727171;'> 작성자 : "+list[i].memberId+"</span>"
   	                       + "               <span class='pull-right' style='color:#ae2e2e;'>(마감일자 : "+boardService.showTime(list[i].dueDate)+")</span>"
   	                       + "               <p><span class='pull-left'>최저가 : "+boardService.price(list[i].minPrice)+"</span><span class='pull-right'> 최고가 : "+boardService.price(list[i].maxPrice)+"<br> 현재가격 : "+boardService.price(list[i].currentPrice)+"</span></p>"
   	                       + "            </div>"
   	                       + "         </div>"
   	                       + "      </a>"
   	                       + "</div>";
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
    		
    		next = (endPage * amount < PageCnt);
    		
    		//console.log("PageCnt : "+ PageCnt);
    		
    	/* 	if(endPage*amount < PageCnt){                                                             
    			next = true;
    		}  */
    		
    		var str = "";
    		
    		if(prev==true){
    			str +="	<li class='page-item'>"
    				+ "		<a class='page-link' href='"+(startPage-1)+"'>이전</a>"
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
    				+ "		<a class='page-link' href='"+(endPage+1)+"'>다음 </a>"
    				+ "	</li>";
    		} else {
    			str +="	<li class='page-item disabled'>"
    				+ "					"
    				+ "	</li>";
    		}
    		
    		tableListFoot.html(str);
    	}; // showBoardPage-end
    	
    	tableListFoot.on("click","li a", function(e){
    		e.preventDefault();
    		pageNum = $(this).attr("href");
    		showList(pageNum,amount,category,searchType,searchKeyword);
			
			var offset = $("#boardListTitle").offset();
			$("html").animate({scrollTop : offset.top},500);
    		
    	});
    	
    	
    	//페이지 이동처리
    	$("#regBtn").on("click",function(){
    		self.location="/board/boardInsert";
    	});
    	
    	
    	tableListBody.on("click","a", function(e){
    		e.preventDefault();
    		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
    		actionForm.attr("action","/board/boardRead");
    		
    		actionForm.find("input[name='pageNum']").val(pageNum);
    		actionForm.find("input[name='amount']").val(amount);
    		actionForm.find("input[name='category']").val(category);
    		actionForm.find("input[name='searchType']").val(searchType);
    		actionForm.find("input[name='searchKeyword']").val(searchKeyword);
    		
    		actionForm.submit();
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
       		amount=9;       		
       		category = searchForm.find("select[name='category']").val();
       		searchType = searchForm.find("select[name='searchType']").val();
       		searchKeyword = searchForm.find("input[name='searchKeyword']").val();
       		
       		var board = {pageNum : pageNum, amount:amount, category:category, searchType:searchType, searchKeyword:searchKeyword}
       		boardService.getTotalPageCnt(
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