<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mail_wrap{ width: 100%; margin-top: 20px; } 
	.mail_name{ font-size: 25px; font-weight: bold; } 
	.mail_input_box{ border: 1px solid black; height:31px; padding: 10px 14px; } 
	.mail_input{ width:100%; height:100%; border:none; font-size:28px; } 
	.mail_check_wrap{ margin-top: 20px; } 
	.mail_check_input_box{ border: 1px solid black; height: 31px; padding: 10px 14px; width: 61%; float: left; } 
	.mail_check_input{ width:100%; height:100%; border:none; font-size:28px; } 
	.mail_check_button{ border: 1px solid black; height: 51px; width: 30%; float: right; line-height: 50px; text-align: center; font-size: 30px; font-weight: 900; background-color: #ececf7; cursor: pointer; }
	.correct{
		color: green;
	}
	.incorrect{
		color: red;
	}

	
</style>
</head>
<body>
<div class="mail_wrap">
	<div class="mail_name">이메일</div>
	<div class="mail_input_box">
		<input class="mail_input" name="memberMail">
	</div>
	<div class="mail_check_wrap">
		<div class="mail_check_input_box" id="mail_check_input_box_false">
			<input class="mail_check_input" disabled="disabled">
		</div>
		<div class="mail_check_button">
			<span>인증번호 전송</span>
		</div>
		<div class="clearfix"></div>
		<span id="mail_check_input_box_warn"></span>
	</div>
</div>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script>
	var code="";
	$(".mail_check_button").on("click",function(){
		var email=$(".mail_input").val();//입력한 메일
		var checkBox=$(".mail_check_input");
		var boxWrap=$(".mail_check_input_box");
		
		$.ajax({
			type:"GET",
			url:"/sample/mailCheck?email="+email,
			success:function(data){
				//console.log("data: "+data);
				checkBox.attr("disabled",false);
				boxWrap.attr("id","mail_check_input_box_true");
				code=data;
			}
			
			
		});
	});
	$(".mail_check_input").blur(function(){
		var inputCode=$(".mail_check_input").val();
		var checkResult= $("#mail_check_input_box_warn");
		if(inputCode===code){
			checkResult.html("인증번호가 일치합니다.");
			checkResult.attr("class","correct");
		}
		else
		{
			checkResult.html("인증번호가 일치하지 않습니다.");
			checkResult.attr("class","incorrect");
		}
	})
</script>
</body>
</html>