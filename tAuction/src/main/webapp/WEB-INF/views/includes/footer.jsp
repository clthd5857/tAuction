<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>

       
       W{
      		color : black;
      		position:absolute;
      		top: -120px;
      		left: 190px;
      		font-size: medium;
      	 }
      	 
      	W2{
      		color : black;
      		position:absolute;
      		top: -120px;
      		right: 350px;
      		font-size: medium;
      	 }
      	 
      	
      	w3{
      		color : black;
      		position:absolute;
      		top: -120px;
      		right: 200px;
      		font-size: medium;
      	 }
      	 
      	J{
      		color : black;
      
      	} 
</style>




    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="${contextPath}/resources/images/home/under.png" class="img-responsive inline" alt="">
                        <div style="flex-basis: 300px;" class="col-sm-12">
                    <div class="copyright-text text-left">
                        <address><W>
                        	<strong>TripleA 정보</strong><br><br>
                        	대표 : 오치송  <br> 
                                                 임원 : 설은미, 주현준, 정이슬, 김정후 <br>
                        	사업자등록번호:123-45-654789 <br> 
                        	주소 : 서울특별시 구로구 구트빌딩 3층 <br>
	                        E-mail : tAuction2021@gmail.com <br> 
	                        Phone : +1 (123) 456 7890 <br> 
	                        Fax : +1 (123) 456 7891 <br><br> 
	                        
                        </W></address> 
                     </div>
                     <div class="copyright-text text-center">
                        <address><W2>
	                       <strong>경매목록</strong><br><br>
	                        <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=A">활동</a> <br><br>
	                        <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=B">리빙</a> <br><br>	        
	                       	<a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=C">예술</a> <br><br>
	                       	<a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=D">미용</a> <br><br> 
	                       	<a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=E">기타</a> <br><br>  
                        </W2></address> 
                     </div>
                     <div class="copyright-text text-center">
                        <address><W3>
	                       <strong>커뮤니티</strong><br><br>
	                        <a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=10&category=후기">경매후기</a> <br><br>
	                       	<a href="${contextPath}/cmBoard/cmBoardGetList?pageNum=1&amount=10&category=QnA">QnA</a> <br><br>
                        </W3></address> 
                     </div>
                    </div>
                     <div class="copyright-text text-center">
                       <J><p>TripleA는 경매 중개자이며, 경매의 당사자가 아닙니다. 경매에 대한 모든 의무와 책임은 판매회원에게 있습니다.</p></J>
                    </div>
                
                </div>
            
            </div>
        </div>
    </footer>
    <!--/#footer-->


 
</body>
</html>