<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/admin_header.jsp" %>
<style>
	.btn-custom{
		border: none;
	    outline: none !important;
	    box-shadow: 0 2px 5px rgb(0 0 0 / 16%), 0 2px 10px rgb(0 0 0 / 12%);
	    
	    font-size: 14px;
	    color: #fff;
    }
</style>
<div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="breadcomb-wp">
									<div class="breadcomb-icon">
										<i class="notika-icon notika-bar-chart"></i>
									</div>
									<div class="breadcomb-ctn">
										<h2>Bar Charts</h2>
										<p>Welcome to Notika <span class="bread-ntd">Admin Template</span></p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
							<div class="breadcomb-report">
								 <select id="year" class="selectpicker" style="width:150px;height:32px;" tabindex="-98">
											<option value="">---------------</option>
										<%for(int i=2000;i<2022;i++){ %>
											<option value="<%=i%>"><%=i+"년" %></option>
										<%} %>
											
									</select>
									<select id="month" class="selectpicker" style="width:100px;height:32px;" tabindex="-98">
											<option value="">---------------</option>
										<%for(int i=1;i<=12;i++){ %>
											<option value="<%=i%>"><%=i+"월" %></option>
										<%} %>
											
									</select>
								
									<button class="btn btn-custom waves-effect" id="searchYear"><i class="notika-icon notika-search"></i></button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="bar-chart-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-6 col-sm-6 col-xs-12">
                    <div class="bar-chart-wp"><iframe class="chartjs-hidden-iframe" tabindex="-1" style="display: block; overflow: hidden; border: 0px; margin: 0px; inset: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;"></iframe>
                        <canvas height="400" width="515" id="allChartMonth" style="display: block; width: 515px; height: 400px;"></canvas>
                    </div>
                </div>
             </div>
        </div>
    </div>

           
   


  <script src="/resources/closer/admin.js"></script>      

<script>

	var bidList=[];
	var successbidList=[];
	var boardList=[];
	var visitorList=[];

	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
   
	
	var  thisDate = new Date();
	var year = thisDate.getFullYear();
	var month = thisDate.getMonth()+1;
	
	//console.log(month);
	var chartLabels=[];

	

	for(var i=0;i<31;i++)
	{
		chartLabels.push((i+1));
	}
	

	$(function() {
		allChartMonth(year,month);
		}); 


	
	
	var str="<p style='margin:auto;'>"+year+"/"+month+"</p>";
	$("#displayYear1").html(str);
	$("#displayYear2").html(str);
	
	function allChartMonth(year,month)
	{
		adminService.allChartMonth(year,month);
	}
	
	
	
	$("#searchYear").on("click",function(){
	
		bidList=[];
		successbidList=[];
		boardList=[];
		visitorList=[];
		    
		year=$("select[id=year]").val();
		month=$("select[id=month]").val();

		if(year==""||year.length==0)
		{
			year=thisDate.getFullYear();
		}
		
		if(month==""||month.length==0)
			{
				alert("다시 선택 하세요");
			}
		else{
			allChartMonth(year,month);
			str="<a style='margin:auto;'>"+year+"/"+month+"</a>";
			$("#displayYear1").html(str);
			$("#displayYear2").html(str);
		}
		
	})
	
	
		


	

</script>
 <script src="/resources/admin/js/charts/Chart.js"></script>
  


<%@include file="../includes/admin_footer.jsp" %>