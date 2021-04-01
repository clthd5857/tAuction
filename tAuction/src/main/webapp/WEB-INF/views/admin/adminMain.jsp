<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/admin_header.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
       *{ padding: 0; margin: 0; }
       
       H{
         text-overflow:ellipsis; 
       white-space:nowrap;
       word-wrap:normal;
       width:100px;
       overflow:hidden;
           
         white-space: normal; 
         line-height: 1.2; 
         height: 1.1em;
         text-align: 
         left; word-wrap: 
         break-word; display: 
         -webkit-box; 
         -webkit-line-clamp: 1; 
         -webkit-box-orient: vertical;


       }
        </style>


 <!-- Breadcomb area Start-->
   <div class="breadcomb-area">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="breadcomb-list">
                  <div class="row">
                     <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="breadcomb-wp">
                           <div class="breadcomb-icon">
                              <i class="notika-icon notika-house"></i>
                           </div>
                           <div class="breadcomb-ctn">
                              <h2>Triple A</h2>
                              <p>관리자<span class="bread-ntd"> 페이지입니다.</span></p>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                        <div class="breadcomb-report">
                           <button class="btn" onClick="location.href='/index/index'"><i class="notika-icon notika-sent"></i></button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Breadcomb area End-->
    <!-- Server time start-->
    <div class="visitor-sv-tm-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-sm-6 col-xs-10">
                    <div class="visitor-sv-tm-int sm-res-mg-t-30">
                       <div class="line-chart-wp chart-display-nn"><iframe class="chartjs-hidden-iframe" tabindex="-1" style="display: block; overflow: hidden; border: 0px; margin: 0px; inset: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;"></iframe>
                        <canvas height="250" width="415" id="barLineChart" style="display: block; width: 415px; height: 322px;"></canvas>
                    </div>
                    </div>
                </div>
				<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
					<div  class="visitor-sv-tm-int sm-res-mg-t-30 tb-res-mg-t-30">
						<div class="past-day-statis">
							<h2>일간 상황표</h2>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								<div class="past-statistic-an">
								<div class="past-statistic-ctn"> 
									<p class="counter" style="font-size:50pt; text-align:center;">${mainChart.visitorCountView}</p>
									<p style="text-align:center;">방문자 수</p>
									
								</div>
							</div>
						</div>
						
						
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
		                        <div class="past-statistic-an">
		                            <div class="past-statistic-ctn">
		                                <h1 style="text-align:center;"><span class="counter">${mainChart.bidCount}</span></h1>
		                                <p style="text-align:center;">입찰 수</p>
		                            </div>
		                        </div>
		                    </div>
	                    
	                    	 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
	                     	
	                    	 </div>
	                    
		                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
		                        <div class="past-statistic-an">
		                            <div class="past-statistic-ctn">
		                                <h1 style="text-align:center;"><span class="counter">${mainChart.successbidCount}</span></h1>
		                                <p style="text-align:center;">낙찰 수</p>
		                              </div>
		                        </div>
	                        </div>
	                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                        	<div class="past-statistic-an">
	                    			<div class="past-statistic-ctn">
	                        			<h1 style="text-align:center;">
	                        				<span class="counter">${mainChart.boardCount}</span>
	                        			</h1>
										<p style="text-align:center;">게시물 수</p>
									</div>
								</div>	
	                        </div>
	                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                        
		                        <div class="past-statistic-an">
		                            <div class="past-statistic-ctn"> 
		                                <h1><span class="counter" style="text-align:center;">${mainChart.successbidPrice}</span></h1>
		                                <p style="text-align:center;">일 낙찰 총액</p>
		                              </div>
		                        </div>
	                        </div>
                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="past-statistic-an">
									<div class="past-statistic-ctn"> 
										<h1><span class="counter" style="text-align:center;">${mainChart.priceAvg}</span></h1>
										<p style="text-align:center;">낙찰 가격 평균</p>
									</div>
								</div>
							</div>

							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								
							</div>
                        </div>
                    </div>
                </div>
	        </div>
	    </div>
	</div>
	<div class="search-engine-area mg-t-30">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="recent-items-wp notika-shadow sm-res-mg-t-30">
                        <div class="rc-it-ltd">
                            <div class="recent-items-ctn">
                                <div class="recent-items-title">
                                    <h2>회원 관리</h2>
                                </div>
                            </div>
                            <div class="recent-items-inn">
                                <table class="table table-inner table-vmiddle">
                                    <thead>
                                        <tr>
                                            <th>회원</th>
                                            <th></th>
                                            <th style="width: 60px"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminMemberGetList'">사이트 회원 목록</td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr>
                                       <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminMemberRemoveList'">회원삭제 요청 목록</td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr>
                                    </tbody>
                                </table> <br><br><br><br><br><br>    
                                
                               
                                <div class="recent-items-title">
                                    <h2>경매 게시판 관리</h2>
                                </div>
                                
                                 <table class="table table-inner table-vmiddle">
                                    <thead>
                                        <tr>
                                            <th>경매 게시물</th>
                                            <th></th>
                                            <th style="width: 60px"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminBoardGetList'">경매 게시판 목록 </td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr>
                                       <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminBoardRemoveList'">경매 게시판 삭제 </td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  </div>
              </div>
                 <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                    <div class="recent-items-wp notika-shadow sm-res-mg-t-30">
                        <div class="rc-it-ltd">
                            <div class="recent-items-ctn">
                                <div class="recent-items-title">
                                    <h2>커뮤니티 게시판 관리</h2>
                                </div>
                            </div>
                            <div class="recent-items-inn">
                                <table class="table table-inner table-vmiddle">
                                    <thead>
                                        <tr>
                                            <th>커뮤니티 </th>
                                            <th></th>
                                            <th style="width: 60px"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminCmBoardGetList'">커뮤니티 전체 목록</td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr>
                                       <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminCmBoardRemoveList'">커뮤니티 삭제 요청</td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr> 
                                    </tbody>
                                </table><br><br><br><br><br><br>
                                
                                <div class="recent-items-title">
                                    <h2>공지사항 게시판 관리</h2>
                                </div>
                                
                                <table class="table table-inner table-vmiddle">
                                    <thead>
                                        <tr>
                                            <th>공지사항</th>
                                            <th></th>
                                            <th style="width: 60px"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminPostBoardGetList'">공지사항 목록 보기</td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr>
                                       <tr>
                                            <td class="f-500 c-cyan"><i class="notika-icon notika-right-arrow"></i></td>
                                            <td style="cursor:pointer;" onClick="location.href='/admin/adminPostBoardInsert'">공지사항 글쓰기</td>
                                            <td class="f-500 c-cyan"></td>
                                        </tr> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                  </div>
              </div>
		
		<div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" >
			<div class="recent-items-wp notika-shadow sm-res-mg-t-30" style="height:500px; overflow:auto;">
				<div class="rc-it-ltd">
					<div class="recent-items-ctn">
						<div class="realtime-title">
							<h2>건의 사항 목록</h2>
						</div>
					</div><br>
					<div class="recent-items-inn">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<!-- <th>내용</th> -->
									<th>보낸시간</th>
									<th>IN</th>
								</tr>
							</thead>
							<tbody id="roomTableBody">
								<c:forEach var="adminRoomList" items="${adminRoomList}">
									<tr>
										<c:choose>
											<c:when test="${adminRoomList.senderId=='admin'}">
												<td>${adminRoomList.receiverId}</td>
											</c:when>
											<c:otherwise>
												<td>${adminRoomList.senderId}</td>
											</c:otherwise>
										</c:choose>
										
										<%-- <td>${adminRoomList.messageContent}</td> --%>
										<td><fmt:formatDate value="${adminRoomList.sendTime}" pattern="yyyy-MM-dd HH:mm" /></td>
										<td>
											<button onClick="window.open('/moveChating?chatRoomNo=${adminRoomList.chatRoomNo}','','width=600,height=650')" style="border:0px; background-color:white;" >
												<i class="fa fa-arrow-circle-right fa-2x"></i>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					
					</div>
					
					<div class="card-box">
						<div class="chat-conversation">
							<div class="widgets-chat-scrollbar">
                                  
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
   </div>
</div>
</div>
    <!-- Search Engine End-->
    
       
                      
  
    
    <!-- 사용자 관리 -->
   <script src="/resources/closer/admin.js"></script>  
   <!-- 공지사항 관리 -->   
   <script src="/resources/closer/postBoard.js"></script>   
   <script src="/resources/admin/js/charts/Chart.js"></script>

    <script>
   var csrfHeaderName="${_csrf.headerName}";
   var csrfTokenValue="${_csrf.token}";
    /* bidboardCount */
 
   mainChart();
    
   function mainChart(){
      adminService.mainChart();
   }
   
   function goRoom(number){
		location.href="/moveChating?chatRoomNo="+number;
	}
   
   
   </script>
            

<%@include file="../includes/admin_footer.jsp" %>