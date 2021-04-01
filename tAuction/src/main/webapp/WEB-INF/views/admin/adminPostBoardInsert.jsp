<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../includes/admin_header.jsp" %>


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
      height: 200px;
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


<div class="normal-table-area">
        <div class="container">
        	<div class="row">  
                 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">   
                 	<div class="normal-table-list" id="boardRemoveList">
                        <div class="basic-tb-hd">
        <h2>글쓰기</h2><br>
        <form id="frmInsert" role="form" method="post" action="/admin/adminPostBoardInsert">
        <!-- <form role="form" method="post" action="/board/boardTest"> -->
			<div class="form-group">
				<input type="text" name="title" class="form-control" required="required" value="" placeholder="title">
			</div>
			<div class="form-group">
				<textarea name="contents" id="message" required="required" class="form-control" rows="8" placeholder="Your text here" ></textarea>
			</div>                        
						
						
<!-- 첨부파일 등록 -->
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         
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
			
			
			
			<div class="form-group">
			<span class="pull-right">
    			<!-- <input type="submit" name="submit" class="btn btn-submit" value="Submit"> -->
    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<button id="submitBtn" type="submit" class="btn btn-info notika-btn-info waves-effectt">등록</button>
				<button type="reset" class="btn btn-submit">리셋</button>
			</span>	
			</div>
        </form>
	</div>    
	</div>
</div>
</div>
	</div>
</div>
<script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
});


	var frmInsert = $("#frmInsert");
	
	$("#submitBtn").on("click",function(e){
		e.preventDefault();
			
		var str = "";
	      
		$(".uploadResult ul li").each(function(i, obj){
		   var jobj = $(obj);
		   
		   str +="<input type='hidden' name='attachList["+ i +"].fileName' value='"+ jobj.data("filename") +"'>"
		       + "<input type='hidden' name='attachList["+ i +"].uuid' value='"+ jobj.data("uuid") +"'>"
		       + "<input type='hidden' name='attachList["+ i +"].uploadPath' value='"+ jobj.data("path") +"'>"
		       + "<input type='hidden' name='attachList["+ i +"].fileType' value='"+ jobj.data("type") +"'>";
		});
		frmInsert.append(str).submit();
		
	})
	
	
	//첨부파일 확장자 필터링
   var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
   var maxSize = 5242880; //5MB
   
   function checkExtension(fileName, fileSize) {
      if(fileSize >= maxSize) {
         alert("파일 사이즈초과 되었습니다.");
         return false;
      }
      if(regex.test(fileName)) {
         alert("해당 확장자 파일은 업로드 할 수 없습니다.");
         return false;
      }
      return true;
   }
   
   
   //파일 업로드시 이벤트 처리
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
         url: '/uploadAjaxAction',
         processData: false, 
         contentType: false,
         data: formData,
         type: 'POST',
         dataType:'json',
         success: function(result){
            //console.log(result); 
          showUploadResult(result); //업로드 결과 처리 함수 
   
         }
       }); //end $.ajax
   });
   
   //업로드 결과 처리함수
   function showUploadResult(uploadResultArr) {
      if(!uploadResultArr || uploadResultArr.length == 0) {return;}
      
      var uploadUL = $(".uploadResult ul");
      var str="";
      
      $(uploadResultArr).each(function(i, obj) {
         //이미지 타입
         if(obj.fileType == "I") {
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
            
            str +="<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='I'>"
                +       "<div>"
                +         "<span>" + obj.fileName + "</span>"
                +         "<button type ='button' data-file=\'" + fileCallPath + "\' data-type='I' class ='btn btn-warning btn-circle'>"
                +         "<i class ='fa fa-times'></i></button><br>"
                +         "<img src='/display?fileName=" + fileCallPath + "'>"
                +      "</div>"
                + "</li>";
            
         } else {
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
            //var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
            
            str +="<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='F'>"
                +       "<div>"
                +          "<span>" + obj.fileName + "</span>"
                +         "<button type='button' data-file=\'" + fileCallPath + "\' data-type='F' class ='btn btn-warning btn-circle'>"
                +         "<i class ='fa fa-times'></i></button><br>"
                +         "<img src='/resources/images/attach.png'>"
                +       "</div>"
                + "</li>";
         }
      }); 
      uploadUL.append(str);      
   }
   
   //업로드파일 X버튼 이벤트처리 (삭제)
   $(".uploadResult").on("click", "button", function(e) {
      var targetFile = $(this).data("file");
      var type = $(this).data("type");
      
      var targetLi = $(this).closest("li");
      
      $.ajax ({
         url: '/deleteFile',
         data: {fileName: targetFile, type:type},
         dataType : 'text',
         type : 'POST',
         success: function(result) {
            targetLi.remove();
         }
         
      }); //end ajax
   });
   
   
</script>





<%@include file="../includes/admin_footer.jsp" %>