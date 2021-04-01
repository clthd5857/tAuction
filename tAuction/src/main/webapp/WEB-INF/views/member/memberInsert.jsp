<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<style>
   .btn-custom{
      width:"30%";
      background-color: #4fcccd;
       color: #fff;
       font-size: 14px;
       font-weight: 300;
       letter-spacing: 5px;
          text-transform: uppercase;
       border-radius: 3px;
       border-bottom: 3px solid #2f9697;
         box-shadow: none;
       padding: 10px;
       
   }
   .form-custom{
      
       border: 1px solid #eaeaea;
       font-weight: 300;
       outline: none;
       box-shadow: none;
       height: 40px;
   	   width:"50%";
         padding: 6px 12px;
       font-size: 14px;
       line-height: 1.42857143;
       color: #555;
       background-color: #fff;
       background-image: none;
       border-radius: 4px;
       -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
       transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
   }
</style>
<section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">회원가입</h1>
                            <p>Triple A</p>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
   </section>
   <div class="container">
      <div class="col-sm-12 col-md-12">
      <div class="col-md-12">
                        <ul id="tab1" class="nav nav-tabs">
                            <li class="active"><a href="#tab1-item1" data-toggle="tab">회원약관</a></li>
                            <li><a href="#tab1-item2" data-toggle="tab">개인정보 수집 및 이용 동의</a></li>
                            <li><a href="#tab1-item3" data-toggle="tab">마케팅/홍보 수집 및 이용 동의</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="tab1-item1">
                               <div style="overflow:scroll; width:100%; height:150px;">
                                <p><strong>제 1 조 (목적)</strong><br>
								1. 본 약관은 TripleA 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 TripleA 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
								<strong>제 2 조 (약관의 효력과 변경)</strong><br>
								1. TripleA 사이트는 귀하가 본 약관 내용에 동의하는 경우 TripleA 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.<br>
								2. TripleA 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 TripleA 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.<br>
								이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.<br>
								<strong>제 3 조 (약관 외 준칙)</strong><br>
								1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.</p>
                               </div>
                            </div>
                            <div class="tab-pane fade" id="tab1-item2">
                             <div style="overflow:scroll; width:100%; height:150px;">
                                <p>TripleA는 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항 제1호에 따라 아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다.<br>

									TripleA는 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.<br>
									이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.<br>
									
									<strong>개인정보의 수집 및 이용 동의</strong><br>
									1. 개인정보의 수집 및 이용 목적<br>
									가. 서비스 제공에 관한 업무 이행 - 컨텐츠 제공, 특정 맞춤 서비스 제공(마이페이지, 뉴스레터 등), 기업 애로상담<br>
									나. 회원관리<br>
									- 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달<br>
									
									2. 수집하는 개인정보의 항목<br>
									<개인회원 가입><br>
									필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일, 암호화된 이용자 확인값(CI)<br>
									선택항목 : 이메일 수신여부, 문자수신여부, 웹진구독여부<br>
									<기업회원 가입><br>
									필수항목 : 아이디, 비밀번호, 담당자 이름, 담당자 전화번호, 핸드폰번호, 이메일, (법인기업의 경우 법인등록번호), 기업정보(회사명, 대표자명, 사업자등록번호, 회사전화번호, 주소, 지역, 대표업종), 암호화된 이용자 확인값(CI)<br>
									선택항목 : 팩스번호, 홈페이지주소, 회사이메일주소, 창업일자, 부업종, 매출액, 수출액, 상시근로자 수, 주요생산품명, 이메일 수신여부, 문자수신여부, 이메일 수신여부, 문자수신여부, 웹진구독여부<br>
									<자동수집><br>
									IP주소, 쿠키, 서비스 이용기록, 방문기록 등<br>
									
									3. 개인정보의 보유 및 이용기간<br>
									기업마당은 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성 등 그 개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. 다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다.<br>
									
									회원정보<br>
									-탈퇴 후 지체없이 파기<br>
									
									4. 동의거부권 및 불이익<br>
									정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만, 필수 항목에 대한 동의를 거부할 시 저희가 제공하는 서비스를 이용할 수 없습니다.</p>
                             </div>
                            </div>
                            <div class="tab-pane fade" id="tab1-item3">
                             <div style="overflow:scroll; width:100%; height:150px;">
                            <p><strong>1. 개인정보의 수집 및 이용 목적</strong><br>
									신규 서비스 개발 및 마케팅ㆍ광고에의 활용<br>
									- 신규 서비스 개발, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 등 회원의 서비스 이용에 대한 통계<br>
								<strong>2. 수집하는 개인정보의 항목</strong><br>
									필수항목 : 이름<br>
									선택항목 : 이메일, 연락처(휴대전화번호, 유선전화번호 중 1개 선택)<br>
								<strong>3. 개인정보의 보유 및 이용기간</strong><br>
								이용목적의 달성 후 지체없이 파기<br>
								<strong>4. 동의거부권 및 불이익</strong><br>
								개인정보의 마케팅/홍보의 수집 및 이용 동의를 거부하시더라도 회원 가입 시 제한은 없습니다. 다만, 마케팅 활용 서비스 안내 및 참여에 제한이 있을 수 있습니다.</p>
                            </div>
                            </div>
                        </div>
                        <a>모두 동의합니다.</a> <input type="checkbox" id="checkbox" >
                    </div>
                        
      </div>
  
   </div>

  
   <br>
  <div class="container">
    <h4>사용자 정보</h4><hr>
   <div class="col-sm-6 col-md-6" style="  left:25%; top:50%; ">
   
 <form id="memberForm" name="memberForm" method="post">
             <div class="form-group">
                 <input type="text" name="memberId" id="memberId" class="form-control" required="required" placeholder="아이디(영어,숫자 6자리 이상 가능합니다)" oninput="checkId()">
                 <div  class="alert alert-success" id="alert-successId">사용할 수 있는 아이디 입니다.</div>
                 <div  class="alert alert-danger" id="alert-dangerId">중복된 아이디입니다.</div>
             </div>
               <div class="form-group">
                 <input type="password" name="memberPassword" id="password1"class="form-control" required="required" placeholder="비밀번호(8~12자 이내로 적으시오.)">
                 
             </div>
               <div class="form-group">
                 <input type="password"  class="form-control" id="password2" required="required" placeholder="비밀번호확인" >
                 <div  class="alert alert-success" id="alert-successPassword">비밀번호가 일치합니다.</div>
                 <div  class="alert alert-danger" id="alert-dangerPassword">비밀번호가 일치하지 않습니다.</div>
                 <div  class="alert alert-danger" id="alert-checkPassword">8~15자리의 영문, 숫자, 특수문자의 입력이 가능합니다.</div>
                 <p></p>
             </div>
             <div class="form-group">
                 <input type="text" name="memberName" class="form-control" required="required" placeholder="이름">
             </div>
             <div class="form-group">
                 <input type="text" name="memberPhoneNumber" class="form-control"  required="required" placeholder="핸드폰(-없이 입력하시오)">
             </div>
              <div class="form-group">
                 <input type="text" class="form-custom" id="sample6_postcode" name="memberAddressCode" required="required" placeholder="우편번호">
                  <input type="button" class="btn btn-custom" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
              </div>
             <div class="form-group">
                <input type="text" class="form-control" name="memberAddress" id="sample6_address"  required="required" placeholder="주소">
             </div>
             <div class="form-group">
               <input type="text" class="form-control" id="sample6_detailAddress" name="memberAddressDetail" required="required" placeholder="상세주소">
             </div>   
          <div class="form-group">
               <input type="text" class="form-control" id="sample6_extraAddress" name="memberAddressExtra" placeholder="참고항목">
             </div>  
             <div class="form-group">
             <input type="email" id="inputEmail" name="memberEmail" style="width:70%;" class="form-custom" required="required" placeholder="이메일">&nbsp;<button type="button" id="createCode"  class="btn btn-custom">인증번호</button>
          </div>
               
              <div class="form-group" id="checkCodeBox">
                 <input type="text" id="emailCode" style="width:20%;" class="form-custom" required="required" placeholder="인증번호">
                 <button type="button" name="check" id="checkCode" style="width:20%;" class="btn btn-custom">확인</button>
                 <div  class="alert alert-success" id="alert-successEmail">인증 코드가 일치합니다.</div>
                 <div  class="alert alert-danger" id="alert-dangerEmail">인증 코드가 일치하지 않습니다.</div>
             </div>
             <div class="form-group">
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
               <button type="submit" style="margin-left:150px;" name="submit" id="submit" class="btn btn-custom">회원 가입</button> &nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" id="reset"   name="reset" class="btn btn-custom" value="초기화">
              </div>
    </form>
    </div>
   </div>
  <script src="/resources/closer/member.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  //csrf 공격 방지
  $(document).ajaxSend(function(e, xhr, options) {
     xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
     });
  
  //카카오 우편번호 API
 function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    } 

  
  
  
 //초기화 누를시 알림창 숨기기
  $("#reset").on("click",function(e){
     $("#alert-successId").hide();
      $("#alert-dangerId").hide();
      $("#alert-successPassword").hide();
      $("#alert-dangerPassword").hide();
      $("#alert-checkPassword").hide();
      $("#alert-successEmail").hide();
      $("#alert-dangerEmail").hide();
  });
  
//인증번호 버튼 클릭시 확인 div 생성
  $("#createEmail").on("click",function(e){
     $("#checkEmail").show();
     
  });
  
  
  
   var memberForm = $("#memberForm");
   
   //약관 체크에 따른 데이터 전송
   $("#submit").on('click',function(e){
    
    var memberAddress=$("#sample6_postcode").val();

      //console.log(memberAddress);
     
      //console.log($("input[name=memberAddress]").val());
     
     if($("#checkbox").is(":checked")==true)
     {
        //console.log("체크 된 상태");
       memberAddress =memberAddress+" "+$("#sample6_address").val()+" "+$("#sample6_extraAddress").val()+" "+$("#sample6_detailAddress").val();
        memberForm.attr("action","/member/memberInsert").submit(); 
     }
     else
     {
        
        //console.log("체크 안 된 상태");
        alert("약관 확인을 체크하시오");
        return false;
     } 
   });
   
   
   $(function(){
      $("#alert-successEmail").hide();
      $("#alert-dangerEmail").hide();
      $("#checkCodeBox").hide();
      //페이지 시작시 알림창 숨기기
      $("#alert-successId").hide();
      $("#alert-dangerId").hide();
      $("#alert-successPassword").hide();
      $("#alert-dangerPassword").hide();
      $("#alert-checkPassword").hide();
     
   });
   
   //비밀번호 일치 체크 여부
   $("input").keyup(function(){
      var password1 = $("#password1").val();
      var password2 = $("#password2").val();
   
      if(password1!=""){
         if(password1.length<8||password1.length>12)
         {
            $("#alert-checkPassword").show();
            $("#alert-dangerPassword").hide();
            $("#submit").attr("disabled","disabled");
         }
         else if(password1.length==0||password1=="")
         { $("#alert-successPassword").hide();
            $("#alert-dangerPassword").show();
            $("#submit").attr("disabled","disabled");
            
         }
         else{
            $("#alert-checkPassword").hide();
            if(password1==password2){
               $("#alert-successPassword").show();
               $("#alert-dangerPassword").hide();
               $("#submit").removeAttr("disabled");
            }
            else{
               $("#alert-successPassword").hide();
               $("#alert-dangerPassword").show();
               $("#submit").attr("disabled","disabled");
            }
         }
      
      
      }
      if(password2==""||password2.length==0)
      {
         $("#alert-successPassword").hide();
         $("#alert-dangerPassword").hide();
   
      }
    
   })
   
   //이메일 코드
   var emailCode="";
   $("#createCode").on("click",function(){
      var email=$("#inputEmail").val();//입력한 메일
      $("#checkCodeBox").show();
      
      $.ajax({
         type:"GET",
         url:"/member/checkEmail?email="+email,
         success:function(data){
            //console.log("data: "+data);
            emailCode=data;
      }
         
         
      });
   });
   $("#checkCode").on("click",function(){
      var inputCode=$("#emailCode").val();
   
      
      if(inputCode==emailCode){
         $("#alert-dangerEmail").hide();
           $("#alert-successEmail").show();
           $("#submit").removeAttr("disabled");
          
      }
      else
      {
           $("#alert-dangerEmail").show();
           $("#alert-successEmail").hide();
           $("#submit").attr("disabled","disable")
      }
   }) 
   
   
  //아이디 중복 체크 Ajax
   function checkId(){
   memberService.checkId();
   }
   
  
   
   
  </script>
<%@include file="../includes/footer.jsp" %>