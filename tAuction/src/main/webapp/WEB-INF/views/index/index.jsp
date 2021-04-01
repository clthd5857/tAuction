<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>

	.single-features {
	  overflow: hidden;
	  padding-top: 50px;
	  padding-bottom: 40px;
	}
	
	.single-features img {
		width:500px;
		
	}

	#carousel-example-generic img {
      height:450px;
      width:100%;
      object-fit: fill;
   }

</style>

<!-- 메인 설명 -->
<%-- <section id="home-slider">
	<div class="container">
		<div class="row">
			<div class="main-slider animate-in">
				<div class="slide-text">
					<h1>All Ability Auction</h1>
					<p>당신의 아름다운 '가치'를 같이... <br>여러분의 파트너쉽 TripleA에서 당신의 재능을 경매하세요.</p>
					<a href="${contextPath}/member/memberInsert" class="btn btn-common">가입 하기</a>
				</div>
			</div>
		</div>
	</div>
</section>
     --%>
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators visible-xs">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                     <section id="home-slider">
                        <div class="container">
                           <div class="row">
                              <div class="main-slider animate-in">
                                 <div class="slide-text">
                                    <h1>All Ability Auction</h1>
                                    <p>당신의 아름다운 '가치'를 같이... <br>TripleA에서 당신의 재능을 경매하세요.</p>
                                    <a href="${contextPath}/board/boardGetList" class="btn btn-lg btn-primary">재능 보러가기</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </section>
                        </div>
                        <div class="item">
                            <img src="/resources/images/banner2.jpg" alt="">
                        </div>
                        <div class="item">
                            <img src="/resources/images/banner3.jpg" alt="">
                        </div>
                    </div>
                    <a class="left carousel-control hidden-xs" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control hidden-xs" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>





 
<!-- 메인설명 아래 감싸는 div -->
<div class="container">
   <div id="feature-container">
      <div class="row">
         <div class="col-md-12">
            <h2 class="page-header">Category</h2>
         </div>
         
         <div class="col-sm-2 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 900ms; animation-name: fadeInUp;">
            <a href="" style="color: black">
               <div class="feature-inner">
                  <div class="icon-wrapper">
                     <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9" style="color:white;"><i class="fas fa-2x fa-asterisk"></i></a>
                  </div>
                  <h4>ALL</h4>
               </div>
            </a>
         </div>
         
         <div class="col-sm-2 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="600ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: fadeInUp;">
            <a href="" style="color: black">
               <div class="feature-inner">
                  <div class="icon-wrapper">
                     <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=A" style="color:white;"><i class="fas fa-2x fa-bicycle"></i></a>
                  </div>
               <h4>활동</h4>
               <!-- <p>Ground round tenderloin flank shank ribeye. Hamkevin meatball swine.</p> -->
               </div>
            </a>
         </div>
         
         <div class="col-sm-2 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="900ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 600ms; animation-name: fadeInUp;">
            <a href="" style="color: black">
               <div class="feature-inner">
                  <div class="icon-wrapper">
                     <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=B" style="color:white;"><i class="fas fa-2x fa-home"></i></a>
                  </div>
               <h4>리빙</h4>
               </div>
            </a>
         </div>
         
   
         
         <div class="col-sm-2 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="1200ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 1200ms; animation-name: fadeInUp;">
            <a href="" style="color: black">
               <div class="feature-inner">
                  <div class="icon-wrapper">
                     <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=C" style="color:white;"><i class="fas fa-2x fa-guitar"></i></a>
                  </div>
                  <h4>예술</h4>
               </div>
            </a>
         </div>                        
         <div class="col-sm-2 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="1500ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 1200ms; animation-name: fadeInUp;">
            <a href="" style="color: black">
               <div class="feature-inner">
                  <div class="icon-wrapper">
                     <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=D" style="color:white;"><i class="fas fa-2x fa-heartbeat"></i></a>
                  </div>
                  <h4>미용</h4>
               </div>
            </a>
         </div>                        
         <div class="col-sm-2 wow fadeInUp animated" data-wow-duration="500ms" data-wow-delay="1800ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 1200ms; animation-name: fadeInUp;">
            <a href="" style="color: black">
               <div class="feature-inner">
                  <div class="icon-wrapper">
                     <a href="${contextPath}/board/boardGetList?pageNum=1&amount=9&category=E" style="color:white;"><i class="fas fa-2x fa-seedling"></i></a>
                  </div>
                  <h4>기타</h4>
               </div>
            </a>
         </div> 
         
      </div>
   </div>
<!-- 카테고리 아이콘 -->    

<hr>

<!-- 인기글 -->
	<section id="features">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="page-header">Our Service</h2>
				</div>
			</div>
			<div class="row">
				<div class="single-features">
					<div class="col-sm-4 wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: fadeInLeft;">
						<img src="${contextPath}/resources/images/index/main1.png" class="img-responsive" alt="">
					</div>
					<div class="col-sm-6 wow fadeInRight animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: fadeInRight;">
						<h1 style="color:black">세상의 모든 재능을 경매하세요.</h1>
						<p><br>손재주가 있으신분? 운동을 잘하시는분? 어떤 재능이 당신의 가치를 경매할 수 있습니다.<br>
                     평소 배우고 싶었던 분야가 있으신가요? 다른 사람의 재능을 입찰할 수도 있습니다.<br>
                     세상의 모든 재능을 TripleA와 함께 당신의 가치를 같이 나누세요.<br>
                     TripleA가 여러분과 함께합니다...<br><br>
                     Does anyone have any dexterity? Who's good at sports? Any talent can auction your value.<br>
                     Is there anything you've always wanted to learn? You can also bid for someone else's talent.<br>
                     Share all the talents in the world with Triple A. Triple A is with you...</p>

	                </div>
	            </div>
	            
	            <div class="single-features">
	            	<div class="col-sm-6 wow fadeInRight animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: fadeInRight;">
	                    <h1 style="color:black;">경매는 이렇게 진행됩니다.</h1>
	                   <p><br>1. 경매 카테고리에서 희망하는 경매 게시글을 찾아서 경매에 참여합니다.<br>
                     2. 경매 마감 시 가능 높은 금액에 입찰한 사용자에게 낙찰됩니다.<br>
                     3. 낙찰이 완료되면 판매자와 채팅으로 거래하실 수 있습니다.<br>
                     4. 원하시는 경매를 작성해 직접 올리실 수도 있습니다.<br><br>
                     1. Find the desired auction in the auction category.<br>
                     2. At the close of the auction, the bid will be awarded to the users who bid at the highest possible price.<br>
                     3. Once the winning bid is completed, you can chat with the seller.<br>
                     4. You can also post the auction you want after selecting writing.</p>

	                </div>
	                <div class="col-sm-4 wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: fadeInLeft;">
	                    <img src="${contextPath}/resources/images/index/main2.jpg" class="img-responsive" alt="">
	                </div>
	            </div>
	            
				<div class="single-features">
					<div class="col-sm-4 wow fadeInLeft animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: fadeInLeft;">
						<img src="${contextPath}/resources/images/index/main3.png" class="img-responsive" alt="">
					</div>
					<div class="col-sm-6 wow fadeInRight animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: fadeInRight;">
						<h1 style="color:black">경매 마감 후 낙찰자와 만나보세요.</h1>
						<p><br>경매 게시자가 설정해 놓은 경매 마감시간이 되면 경매가 마감됩니다.<br>
                     최고가로 입찰한 입찰가에게 낙찰됩니다.<br>
                     경매가 낙찰이 되면 채팅을 통해 낙찰자와 1:1로 연결됩니다.<br><br>
                     The auction closes at the auction closing time set by the auction publisher.<br>
                     It is sold to the highest bid price.<br>
                     When the auction is sold, it connects 1:1 with the winning bidder through chatting.</p>
	                </div>
				</div>
	        </div>
	    </div>
	</section>
    <hr>

</div> <!-- 컨테이너 div끝 -->






<%@include file="../includes/footer.jsp" %>