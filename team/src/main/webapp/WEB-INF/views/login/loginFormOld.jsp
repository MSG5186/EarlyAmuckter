<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/main_header.jsp" flush="false"/>

<style>
	.errmsg {color: #f00;}
	
	.bd-placeholder-img {
	   font-size: 1.125rem;
	   text-anchor: middle;
	 }
	
	@media (min-width: 768px) {
	   .bd-placeholder-img-lg {
	     font-size: 3.5rem;
		}
 	.find {
  		font-size: 13px;
  	}
 }
 
 .find {
 	margin-top:20px;
 	border-top:1px solid #ccc;
 	line-height: 14px;
  	padding-top: 20px;
 	 	text-align: center;
  	color: #8e8e8e;
 }
 
 #findId, #findPw {
 	color:#ccc;
 }   
 
 .bar {
  display: inline-block;
  width: 1px;
  height: 13px;
  margin: 0 4px;
  text-indent: -999em;
  background: #e4e4e5;
  }
</style>

    <form:form class="form-login" modelAttribute="login" action="/login/loginOk">
  <div class="text-center mb-4">
    <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
  </div>

  <div class="form-label-group">
    <form:input type="text" path="id" class="form-control" required="required"   />
    <form:label path="id" class="form-control">아이디</form:label>
 		<form:errors path="id" cssClass="errmsg"></form:errors>
  </div>

  <div class="form-label-group">
    <form:input type="password" path="pw" class="form-control" required="required"/>
    <form:label path="pw" class="form-control">비밀번호</form:label>
		<form:errors path="pw" cssClass="errmsg"></form:errors>
  </div>

  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
  
  <div class="form-label-group">
  	<span class="errmsg">${loginFailed }</span>
  </div>
  
  <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
  
  <div class="find">
  	<p>
  		<a id="findId" href="/login/findIdForm">아이디 찾기</a>
  		<span class="bar">|</span>
  		<a id="findPw" href="/login/findPwForm">비밀번호 찾기</a>
  	</p>
  </div>
  
  <p class="mt-5 mb-3 text-muted text-center">&copy; 2018-2019</p>
</form:form>

<jsp:include page="/main_footer.jsp" flush="false"/>