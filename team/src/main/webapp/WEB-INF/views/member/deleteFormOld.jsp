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
 


</style>
<script>
	$(function(){
		$("#delBtn").on("click",function(e){
			e.preventDefault();
 			if($("#pw").val() == ""){
 				console.log('click!');
				$("#pwMsg").text("비밀번호를 입력하세요!");
				$("#pw").focus();
				return false;
			} 
			if(confirm("정말 탈퇴하시겠습니까?")){
				$("form").submit();
			}
			
		})
		
		// 취소버튼
		$("#cancel").on("click", function(e) {
			e.preventDefault();
			location.href = "/member/myPage";
		});
	});
</script>

    <form:form class="form-delete" modelAttribute="mdto" action="/member/memberDelete">
  <div class="text-center mb-4">
    <img class="mb-4" src="/docs/4.2/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">회원탈퇴</h1>
  </div>

  <div class="form-label-group">
    <form:label path="id" class="form-control">아이디</form:label>
    <form:input type="text" path="id" class="form-control" readonly="true"  />
 		<form:errors path="id" cssClass="errmsg"></form:errors>
  </div>

  <div class="form-label-group">
    <form:input type="password" path="pw" class="form-control" required="required"/>
    <form:label path="pw" class="form-control">비밀번호</form:label>
		<form:errors path="pw" cssClass="errmsg"></form:errors>
  </div>
  
  <%-- <div class="form-label-group ">
					<label for="pw" class="form-control">비밀번호확인</label>
					<input type="password" id="pw" class="col-sm-3 form-control form-control-sm " 
					placeholder="비밀번호를 입력하세요!" required/> 
						<span class="col-sm-2 pwErr"></span>
					<form:errors path="pw" cssClass="col-sm-2 errmsg"></form:errors>
				</div> --%>

 				<div class="form-label-group">
  				<span class="errmsg" id="pwMsg">${failed }</span>
  			</div>
				
  
  <button class="btn btn-lg btn-primary btn-block"  id="delBtn">회원탈퇴</button>
  <button class="btn btn-lg btn-primary btn-block" id="cancel">취소</button>
  
  
  <p class="mt-5 mb-3 text-muted text-center">&copy; 2018-2019</p>
</form:form>

<jsp:include page="/main_footer.jsp" flush="false"/>