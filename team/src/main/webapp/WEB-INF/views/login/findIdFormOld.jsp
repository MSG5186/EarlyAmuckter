<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/main_header.jsp" flush="false" />

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>얼리어먹터</title>

     <!-- Bootstrap 시작 -->
		<link rel="stylesheet" href="/resources/bootstrap-4.2.1/dist/css/bootstrap.css" />
		
		<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
		<script src="/webjars/popper.js/1.14.6/dist/umd/popper.min.js"></script>
		<script src="/resources/bootstrap-4.2.1/dist/js/bootstrap.js"></script>
		<!-- Bootstrap 끝     -->   
        
		<!-- font-awesome -->        
    <link rel="stylesheet" href="/webjars/font-awesome/5.6.3/css/all.css" />
    


<style>
.errmsg {
	color: #f00;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
	.find {
		font-size: 13px;
	}
}
</style>

<script>
	
	$(function() {
		//유효성체크 오류시 에러표시 css적용 
		$(".errmsg").each(function(idx) {
			if ($(this).text().length > 0) {
				$(this).prev().removeClass("is-valid").addClass("is-invalid");
			}
		});
		
		$("#cancel").on("click",function(e){
			e.preventDefault();
			location.href="/";
		})


		// 조회버튼 클릭
		$("#findId").on("click", function(e) {
			e.preventDefault();
			$("form").submit();
		})

		// 조회버튼 클릭
		/* $("#findId").on("click", function(e) {
			e.preventDefault();
			var name = "";
			var phone = "";
			name = $("#phone").val();
			phone = $("#name").val();
			
			$.ajax({
				type: "POST",		// post, get, put, delete
			//	url: "/login/findId?name="+name+"&phone="+phone,
					url: "/login/findId",
				headers:{
					"Content-Type":"application/json",
				},
				dataType: "text",
 				data:JSON.stringify({
					name : name,
					phone : phone
				}), 
				success: function(result){
					console.log(result);
					$('#findedId').attr('value',result);
				},
				error: function(xhr,status,err){
					console.log("xhr:"+xhr.responseText);
					console.log("status:"+status);
					console.log("err:"+err);
				//	alert('입력값이 잘못되었습니다!');
					$('#findedId').attr('value','입력값이 잘못되었습니다!');
				
				}
			})
		}) */
		
	});
</script>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-4">
			<form:form class="form-findId" modelAttribute="findID"
				action="${pageContext.request.contextPath}/login/findId">
				<div class="text-center mb-4">
					<h1 class="h3 mb-3 font-weight-normal">아이디 찾기</h1>
				</div>

				<div class="form-label-group mb-3">
					<form:label path="name">이름</form:label>
					<form:input type="text" path="name" class="form-control"
						placeholder="ex)010-1234-5678" />
					<form:errors path="name" cssClass="col-sm-2 errmsg"></form:errors>
				</div>
				
				<div class="form-label-group mb-3">
					<form:label path="phone">전화번호</form:label>
					<form:input type="phone" path="phone" class="form-control"
						placeholder="ex)010-1234-5678" />
					<form:errors path="phone" cssClass="col-sm-2 errmsg"></form:errors>
				</div>

				<!-- <div class="form-label-group mb-3">
					<label>찾은 아이디</label> <input type="text" class="form-control" id="findedId"
						readonly="true" ></input>
				</div> -->
				
				<div class="form-label-group mb-3">
					<label>찾은 아이디</label> <input type="text" class="form-control"
						readonly="true" value="${mdto.id }"></input>
  							</div>

				<div class="form-label-group">
  				<span class="errmsg">${findFailed }</span>
  			</div>


				<div class="form-label-group mb-3 row">
					<div class="col-md">
						<button class="btn btn-md btn-primary btn-block" id="findId">조회</button>
					</div>
					<div class="col-md">
						<button class="btn btn-md btn-primary btn-block" id="cancel">취소</button>
					</div>
				</div>
				<p class="mt-5 mb-3 text-muted text-center">&copy; 2018-2019/p>
			</form:form>

		</div>
	</div>
</div>


<jsp:include page="/main_footer.jsp" flush="false" />




























