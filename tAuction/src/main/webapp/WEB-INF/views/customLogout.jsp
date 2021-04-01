<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@include file="includes/header.jsp" %>
<h2><c:out value="${error}"/></h2>
<h2><c:out value="${logout}"/></h2>
<div class="col-md-4 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>로그인</h2>
                        <form id="main-contact-form" name="contact-form" method="post" action="${contextPath}/customLogout">
                       
                            <div class="form-group">
                                <button class="btn btn-submit">로그아웃</button>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
<%@include file="includes/footer.jsp" %>