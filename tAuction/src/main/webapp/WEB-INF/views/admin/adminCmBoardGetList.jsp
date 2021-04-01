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
                        	<h2>커뮤니티 게시물 목록</h2>
                        </div>
			
			
			
			<!-- 리스트 -->
			<div class="table-responsive">
				    <table id="data-table-basic" class="table table-striped" >
				        <thead>
				            <tr>
				                <th>글번호</th>				      
				                <th>제목</th>	
				                <th>작성자</th>
				                <th>작성일</th>
				                <th>조회수</th>			              
				            </tr>
				        </thead>
				
				        <tbody id="tableListBody">
				        	<c:forEach var="boardList" items="${cmBoardList}">
					        	<tr>
					        		<td>${boardList.bno}</td>
					        		<td><a href="/cmBoard/cmBoardRead?bno=${boardList.bno}">${boardList.title}</a></td>
					        		<td>${boardList.memberId}</td>
					        		<td><fmt:formatDate value="${boardList.regDate}" type="date" /></td>
					        		<td>${boardList.viewCount}</td>
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
 

<%@include file="../includes/admin_footer.jsp" %>
