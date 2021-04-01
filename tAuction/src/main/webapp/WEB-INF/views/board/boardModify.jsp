<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/header.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
   
/* header 옮기지말기 */
   /* 파일 x버튼 */   
   .btn-default {
      background-color: transparent;
      border: none;
   }
   
   .btn-default:hover {
      background-color: transparent;
   }
/* header 옮기지말기 */   
   
   
/* 중복 : 하나만 옮기기 ~~ */   
   /* 업로드 목록 */
   .upload {
      border: 1px solid #f4f4f4;
      height: 150px;
      overflow: auto;
   }
   .uploadResult {
      width: 100%;
   }
   
   /* 업로드목록 스크롤 */
   ::-webkit-scrollbar { width: 10px;} /* 스크롤 바 */
   ::-webkit-scrollbar-track { background-color: #fff;} /* 스크롤 바 밑의 배경 */
   ::-webkit-scrollbar-thumb {   background: #ddd;   border-radius: 10px;} /* 실질적 스크롤 바 */
   ::-webkit-scrollbar-thumb:hover {   background: #404040;} /* 실질적 스크롤 바 위에 마우스를 올려다 둘 때 */
   ::-webkit-scrollbar-thumb:active {   background: #808080;} /* 실질적 스크롤 바를 클릭할 때 */
   ::-webkit-scrollbar-button {   display: none;} /* 스크롤 바 상 하단 버튼 */
   
   /* 업로드 버튼 css */
   #ex_file_label {
      display: inline-block;
      padding: .5em .75em;
      color: #fff;
      background-color: #337ab7;
      font-size: inherit;
      line-height: normal;
      vertical-align: middle;
      cursor: pointer;
      border: 1px solid #2e6da4;
      border-bottom-color: #e2e2e2;
      border-radius: .25em;
   }
   
   #ex_file { /* 파일 필드 숨기기 */
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      border: 0;
   }
/* ~~ 중복 : 하나만 옮기기 */   

</style>



<div class="row">
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
	</div>
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
		<h2>경매 게시물 수정</h2>
		<hr>
		<form id="frmModify" role="form" method="post" action="${contextPath}/board/boardModify">
			<div class="form-group">
				<label>&nbsp;&nbsp;작성자</label>
				<input type="text" name="memberId" data-name="제목을" class="form-control" required="required" value="${board.memberId}" placeholder="memberId" readonly>
			</div>
			<!-- <div class="form-group" style="float:left;"> -->
			<div class="form-group">
				<label>&nbsp;&nbsp;카테고리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				<input type="radio" name="category" value="A" checked>&nbsp;&nbsp;활&nbsp;동 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="category" value="B">&nbsp;&nbsp;리&nbsp;빙 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="category" value="C">&nbsp;&nbsp;예&nbsp;술 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="category" value="D">&nbsp;&nbsp;미&nbsp;용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="category" value="E">&nbsp;&nbsp;기&nbsp;타 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="form-group">
				<label>&nbsp;&nbsp;경매 제목</label>
				<input type="text" name="title" class="form-control" required="required" value="${board.title}" placeholder="제목을 입력하세요.">
			</div>
			
			<label>&nbsp;&nbsp;입찰시작가&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; 즉시 입찰가</label>
			<div class="form-group">
				<input type="text" id="minPrice" name="minPrice" data-name="입찰 시작가를" class="form-control pull-left" inputmode="numeric" required="required"
					   value="<fmt:formatNumber type="number" pattern="#,###" value="${board.minPrice}" />" style="width:49%; display:inline;">
					   
				<input type="text" id="maxPrice" name="maxPrice" data-name="즉시 입찰가를" class="form-control pull-right" inputmode="numeric" required="required"
					   value="<fmt:formatNumber type="number" pattern="#,###" value="${board.maxPrice}" />" style="width:49%; display:inline;">
				<br><br><br>
			    
			    <label>&nbsp;&nbsp;현재가</label>
			    <input type="text" id="currentPrice" class="form-control pull-right" inputmode="numeric" required="required"
			    	   value="<fmt:formatNumber type="number" pattern="#,###" value="${board.currentPrice}" />" style="display:inline;" disabled>
			</div>
			<br><br>
			<div class="form-group">
				<label>&nbsp;&nbsp;상세 내용</label>
				<textarea name="contents" id="contents" required="required" class="form-control" rows="8" placeholder="Your text here">${board.contents}</textarea>
			</div>                        
			<div class="form-group">
				<input type="date" id="date" class="form-control pull-left" style="width:48%">
				<select id="time" class='form-control pull-right' style="width:48%">
					<c:forEach var="dateStep" begin="0" end="23" step="1">
						<option value="${dateStep>9 ? '' : '0'}${dateStep}">${dateStep>9 ? '' : '0'}${dateStep}</option>
					</c:forEach>
				</select>
			</div>
			<br><br><br>

<!-- 첨부파일 등록 -->
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default ">
         
         <div class="panel-heading">
         	<span>파일첨부</span> &nbsp;&nbsp;&nbsp;
         	<label id="ex_file_label" for="ex_file">업로드</label>
            <input type="file" name="uploadFile" id="ex_file" multiple>
         </div>
         	
         
         <!-- /.panel-heading -->
          <div class="panel-body upload">
            
               
               
            <div class="uploadResult">
                <ul>
                </ul>
            </div>
            
         </div>
      <!-- end panel-body -->
      </div>
      <!-- end panel-default -->
   </div>
   <!-- end col-lg-12 -->
</div>
<!-- end row -->
			
			<div class="form-group pull-right">
				
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq board.memberId}">				
						<button id="modifyBtn" data-oper="modify" type="button" class="btn btn-warning">수정</button>
						<button id="removeBtn" data-oper="remove" type="button" class="btn btn-danger">삭제</button>
					</c:if>
				</sec:authorize>
				
				<!-- <input type="reset" class="btn btn-info" value="초기화"> -->
				<button type="button" class="btn btn-info" onClick="history.go(0)">초기화</button>
				
				<button id="listBtn" data-oper="list" type="button" class="btn btn-info">목록</button>
			</div>
			<input type="hidden" name="bno" value='${board.bno}' />
			<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
			<input id="pagingCategory" type="hidden" name='category' value="${cri.category}"/>
			<input type="hidden" name="searchType" value="${cri.searchType}">
			<input type="hidden" name="searchKeyword" value="${cri.searchKeyword}">
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			
		</form>
	</div>
	
	<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
	</div>
</div>
	<script>
		//var dueDate = "${board.dueDate}";
		var today = new Date();
		//console.log(dueDate);
		
		var dueDate = new Date("${board.dueDate}");
		//console.log(dueDate);
		var yyyy = dueDate.getFullYear();
		var mm = (dueDate.getMonth()+1) > 9 ? dueDate.getMonth()+1 : '0'+(dueDate.getMonth()+1);
		var dd = dueDate.getDate() > 9 ? dueDate.getDate() : '0'+(dueDate.getDate());
		
		var time = dueDate.getHours() > 9 ? dueDate.getHours() : '0'+(dueDate.getHours());
		
		
		
		var date = yyyy+"-"+mm+"-"+dd;
		//console.log("Form에 넣어줄 : "+date);
		//console.log("시간 : "+time);
		
		$("#date").val(date);
		$("#time").val(time).prop("selected", true);
		
		//console.log("실제 dueDate : "+dueDate);
		
		
		$(document).on('keyup','input[inputmode=numeric]',function(event){
			this.value = this.value.replace(/[^0-9]/g,'');   // 입력값이 숫자가 아니면 공백
			this.value = this.value.replace(/,/g,'');          // ,값 공백처리
			this.value = this.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가 	
		});
		
		
		
		var contextPath = "${contextPath}";
		var frmModify = $("#frmModify");
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$(document).ajaxSend(function(e, xhr, options){
			xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		});
		
		
		$("button").on("click",function(e){
			var operation = $(this).data("oper");
			
			if(operation === 'remove'){
				$("#pagingCategory").remove();
				frmModify.attr("action", contextPath+"/board/boardRemove");
			} else if(operation=="list"){
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var categoryTag = $("#pagingCategory").clone();
				var searchTypeTag = $("input[name='searchType']").clone();
				var searchKeywordTag = $("input[name='searchKeyword']").clone();
				
				frmModify.empty();
				frmModify.append(pageNumTag);
				frmModify.append(amountTag);
				frmModify.append(categoryTag);
				frmModify.append(searchTypeTag);
				frmModify.append(searchKeywordTag);
				
				frmModify.attr("action",contextPath+"/board/boardGetList").attr("method","get");
				
			} else if(operation === 'modify'){
				
				var str="";
				var isRight = true;
				frmModify.find("input[type='text']").not("#maxPrice").each(function(i,item){
					if($(this).val().trim()==''){
						isRight = false;
						alert($(this).attr("data-name")+" 입력하세요.");
						$(this).focus();
						return false;
					}
				});
				
				if(!isRight){
					return false;
				}
				
				if($("#contents").val().trim()==''){
					alert("내용을 입력하세요.");
					$(this).focus();
					return false;
				}
				
				
				var dateValue = $("#date").val();
				var timeValue = $("#time").val();
				var strDueDate = dateValue +"T"+ timeValue+":00";
				var dueDate = new Date(strDueDate);
				
				if(today.getTime()>dueDate.getTime()){
					alert("현재 시간보다 마감 시간이 작을 수 없습니다.");
					return false;
				}
				
				var minPrice = $("#minPrice").val().replace(/,/g,'');
				var maxPrice = $("#maxPrice").val().replace(/,/g,'');
				var currentPrice = ${board.currentPrice};
				
				if(parseInt(minPrice)>parseInt(maxPrice) && maxPrice != ''){
					alert("최소 가격은 최대 가격보다 커야합니다.");
					return false;
				} else if (parseInt(minPrice) > parseInt(currentPrice) && currentPrice!=0) {
					alert("현재 가격보다 최소 가격이 클 수 없습니다.");
					return false;
				} else if (parseInt(maxPrice) < parseInt(currentPrice) && currentPrice!=0) {
					alert("최대 가격은 현재 가격보다 커야합니다.");
					return false;
				}
				
				
				$("#pagingCategory").remove();
				$("#minPrice").val(minPrice.replace(/,/g,''));
				$("#maxPrice").val(maxPrice.replace(/,/g,''));
				
				str +="<input type='hidden' name='strDueDate' value='"+strDueDate+"'>";
				
	            $(".uploadResult ul li").each(function(i, obj){
	               var jobj = $(obj);
	               
	               str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	               str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	               str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	               str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>"; 
	            });
	            frmModify.append(str);
			}
			
			frmModify.submit();
		})
		
		
		
	//첨부 파일	
		
	var bno = '<c:out value="${board.bno}"/>';
      
	// 첨부파일표시
	
	
      $.ajax({
         url: contextPath+'/board/getAttachList',
         data: {bno: bno},
         dataType: 'json',
         type: 'GET',
         success: function(arr) {
            var str="";
            
            $(arr).each(function(i, attach) {
               if(attach.fileType == 'I') {
                  var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
                     
                     str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
                         + "   data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >"
                         + "   <div>"
                         //+ "      <img src='/display?fileName="+fileCallPath+"'>"
                         + "      <span> "+ attach.fileName+"</span>"
                         + "      <button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
                         + "            class='btn btn-default'><i class='fa fa-times'></i></button>"
                         + "   </div>"
                         + "</li>";
                     
                   } else{
                      
                      str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
                           + "     data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >"
                           + "        <div>"
                           //+ "         <img src='/resources/images/attach.png'></a>"
                           + "         <span> "+ attach.fileName+"</span>"
                           + "         <button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
                           + "                class='btn btn-default'><i class='fa fa-times'></i></button><br>"
                           + "      </div>"
                           + "</li>";
                   }
                }); //end each
            
            $(".uploadResult ul").html(str);
         }
      }); //end ajax
      
      //첨부파일 수정 ==> (X버튼 처리)
      $(".uploadResult").on("click", "button", function(e) {
         if(confirm("첨부파일을 제거하시겠습니까?")) {
            var targetLi = $(this).closest("li");
            targetLi.remove();
         }
      });
      
      
      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 5242880; //5MB
        
      //첨부파일 용량, 확장자 확인
      function checkExtension(fileName, fileSize){
          
          if(fileSize >= maxSize){
             alert("파일 사이즈초과 되었습니다.");
               return false;
          }
          
          if(regex.test(fileName)){
             alert("해당 확장자 파일은 업로드 할 수 없습니다.");
            return false;
          }
          return true;
        }
        
      //파일첨부 변경 인식  
      $("input[type='file']").change(function(e){

          var formData = new FormData();
          var inputFile = $("input[name='uploadFile']");
          var files = inputFile[0].files;
          
          for(var i = 0; i < files.length; i++){

            if(!checkExtension(files[i].name, files[i].size) ){
              return false;
            }
            
            formData.append("uploadFile", files[i]);
            
          }
          
          $.ajax({
            url: contextPath+'/uploadAjaxAction',
            processData: false, 
            contentType: false,
            data: formData,
            type: 'POST',
            dataType:'json',
            success: function(result){
                //console.log(result); 
				showUploadResult(result); //업로드 결과 처리 함수 
            }
          }); //$.ajax
          
        });    

      //첨부결과 처리
      function showUploadResult(uploadResultArr){
             
          if(!uploadResultArr || uploadResultArr.length == 0){ return; }
          
          var uploadUL = $(".uploadResult ul");
          
          var str ="";
          
          $(uploadResultArr).each(function(i, obj){
             //이미지 타입
            if(obj.fileType == "I") {
               var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
               
               str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='I'>"
                   +       "<div>"
                   //+         "<img src='/display?fileName=" + fileCallPath + "'>"
                   +         "<span>" + obj.fileName + "</span>"
                   +         "<button type ='button' data-file=\'" + fileCallPath + "\' data-type='I' class ='btn btn-default'>"
                   +         "<i class ='fa fa-times'></i></button>"
                   +      "</div>"
                   + "</li>";
               
            } else {
               var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
               //var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
               
               str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='F'>"
                   +       "<div>"
                  // +         "<img src='/resources/images/attach.png'>"
                   +          "<span>" + obj.fileName + "</span>"
                   +         "<button type='button' data-file=\'" + fileCallPath + "\' data-type='F' class ='btn btn-default'>"
                   +         "<i class ='fa fa-times'></i></button>"
                   +       "</div>"
                   + "</li>";
            }
         }); 
         uploadUL.append(str);
        }     
		
		
		
		
		
		
	</script>

<%@include file="../includes/footer.jsp" %>