<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
	#login-form {
		display: flex;
		justify-content: center;
	}
</style>

<%-- <h2><c:out value="${error}"/></h2> --%>
<%-- <h2><c:out value="${logout}"/></h2> --%>

<div class="container" id="login-form">
	<div class="col-md-4 col-sm-5" >
		<div class="contact-form bottom">
		    <h2>로그인</h2>
		    <form  name="contact-form" method="post" action="${contextPath}/login">
		        <div class="form-group">
		            <input type="text" name="username" class="form-control" required="required" placeholder="아이디">
		        </div>
		        <div class="form-group">
		            <input type="password" name="password" class="form-control" required="required" placeholder="패스워드">
		        </div>
		        <div class="form-group">
		            <a href="${contextPath}/member/memberInsert">회원가입</a>
		        </div>
		        <div class="form-group">
		            <input type="submit" name="submit" class="btn btn-submit" value="로 그 인">
		        </div>
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		    </form>
		</div>
	</div>
</div>
<br><br>

<script>
	
	var error="${error}";
	
	if(error){
		alert("로그인 정보가 일치하지 않거나, 회원이 존재하지 않습니다.");
	}
	

</script>



<%@include file="includes/footer.jsp" %>