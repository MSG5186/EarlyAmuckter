<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/main_header.jsp" flush="false" />
<script>
	$(function(){
		$("#write").on("click",function(e){
			var user ="${user.id == null ? null : user.id}";
			
			if(user == null || user == ""){
				location.href="/login/loginForm";
				return;
			}
			
			e.preventDefault();
			location.href="${pageContext.request.contextPath }/product/writeForm";
		})
		
		// 검색 버튼 클릭
		$("#btn1").on("click",function(e){
			if($("#keyword").val().trim().length == 0){
				alert("검색어를 입력하세요.");
				return;
			}
			$("form").submit();
			
		})
		
	});
	
</script>
<div class="container">

<style>
#product_list {
	list-style: none;
	padding: 0px;
	margin; 0px;
}

#product_list > li > #item {
    height: 120px;
    margin: 15px 0px;
}
#product_list > li > #item > #thumbnail {
	float:left;
	margin-right: 13px;
}
#product_list > li > #item > #thumbnail > img {
	width: 150px;
	height: 120px;
}
#product_list > li > #item > #brand {
    font-size: 14px;
    color: #dc1f1f;
	margin-bottom: 5px;
}
#product_list > li > #item > #title {
	font-size: 19px;
	font-weight: bold;
	margin-bottom: 23px;
}
#product_list > li > #item > #allergy {
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 5px;
    color: #2a70ca;
}
#product_list > li > #item > #description {
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 5px;
    color: #903030;
}
#product_info {
	width: 1080px;
}
#product_info > .sidebar {
    float: left;
    width: 270px;
    height: 500px;
    margin-right: 20px;
}
#product_info > .sidebar > #filter {
	
    width: 100%;
    height: 100%;
    background-color: #f5f5f5;
    border: 1px solid #e0e0e0;
}
#product_info > .list {
    float: left;
    display: block;
    width: 70%;
}
#product_info > .sidebar > #filter > #option {
	padding: 10px 17px;
}
#product_info > .sidebar > #filter > #option > .item_box {
	
}
#product_info > .sidebar > #filter > #option > .item_box > label[type="button"] {
    width: 100px;
    display: inline-block;
    padding: 7px 5px;
	text-align:center;
    background-color: #fff;
    border: 1px solid #c7c7c7;
}
</style>

<div id="product_info">
	<div class="sidebar">
		<div id="filter">
			<div id="option">
				<h1>필터</h1>
				<h2>브랜드</h2>
				<div class="item_box">
					<label type="button">CU</label>
					<label type="button">GS</label>
				</div>
				<h2>상품종류</h2>
				<div class="item_box">
					<label type="button">라면</label>
					<label type="button">김밥</label>
				</div>
			</div>
		</div>
	</div>
	
	<div class="list">
		<ul id="product_list">
			<li>
				<c:forEach items="${list }" var="boardDTO">
					<div id="item">
						<div id="thumbnail">
							<img src="https://news.samsung.com/kr/wp-content/uploads/2015/09/%ED%88%AC%EB%AA%A8%EB%A1%9C%EC%9A%B0%EC%97%90%EC%84%B8%EC%9D%B4%EA%B0%80%EC%9E%A5%EC%8A%AC%ED%94%88%EC%9D%8C%EC%8B%9D8.jpg"/>
						</div>
						<div id="brand">CU</div>
						<div id="title"><a href="/board/view?bnum=${productDTO.pnum }">따끈따끈 두부튀김</a></div>
						<div id="allergy">알레르기 성분 : 없음</div>
						<div id="description">52,300원</div>
					</div>
				</c:forEach>
			</li>
		</ul>
	</div>
</div>


<button id="write" type="button" class="btn btn-outline-primary btn-sm">글쓰기</button>
	
	
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center  pagination-sm">
			<c:if test="${pc.prev }">
			<li class="page-item">
				<a class="page-link" href="/board/list?${pc.makeSearchURL(1) }&searchType=${pc.searchType}&keyword=${pc.keyword}">
					<span aria-hidden="true">&laquo;</span>
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="/board/list?${pc.makeSearchURL(pc.startPage-1) }&searchType=${pc.searchType}&keyword=${pc.keyword}">
					<span aria-hidden="true">&lt;</span>
				</a>
			</li>
			</c:if>
			
			 <c:forEach begin="${pc.startPage }" end="${pc.endPage }" var="pageNum">
      
       <!-- 요청페이지와 현재페이지가 다르면  -->
      <c:if test="${pc.recordCriteria.reqPage != pageNum }">
      <li class="page-item"><a class="page-link" href="/board/list?${pc.makeSearchURL(pageNum) }&searchType=${pc.searchType}&keyword=${pc.keyword}">${pageNum }</a></li>
      </c:if>
      
      <!-- 요청페이지와 현재페이지가 같으면 강조표시  -->
				<c:if test="${pc.recordCriteria.reqPage == pageNum }">
	     	 <li class="page-item active"><a class="page-link" href="/board/list?${pc.makeSearchURL(pageNum) }&searchType=${pc.searchType}&keyword=${pc.keyword}">${pageNum }</a></li>
	      </c:if>
	    <!--------------------------------------------------------------------------->
      </c:forEach>
			
			<c:if test="${pc.next }">
			<li class="page-item">
				<a class="page-link" href="/board/list?${pc.makeSearchURL(pc.endPage+1) }&searchType=${pc.searchType}&keyword=${pc.keyword}">
					<span aria-hidden="true">&gt;</span>
				</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="/board/list?${pc.makeSearchURL(pc.finalEndPage) }&searchType=${pc.searchType}&keyword=${pc.keyword}">
					<span aria-hidden="true">&raquo;</span>
				</a>
			</li>
			</c:if>
		</ul>
	</nav>
	<!-- 검색 조건 -->
   <div class="row justify-content-center mb-3">
     <form action="/board/list" method="post">
     	<div class="row">
       <label class="col-sm-2 col-form-label col-form-label-sm px-0 mx-0" for="key1">검색어</label>
       <select class="col-sm-3 custom-select custom-select-sm px-1 mr-1" name="searchType" id="key1">
         <option value="TC"
         	<c:out value="${pc.searchType == 'TC' ? 'selected' : ''} "/>>제목+내용</option>
         <option value="T"
         	<c:out value="${pc.searchType == 'T' ? 'selected' : ''} "/>>제목</option>
         <option value="C"
         	<c:out value="${pc.searchType == 'C' ? 'selected' : ''} "/>>내용</option>
         <option value="N"
         	<c:out value="${pc.searchType == 'N' ? 'selected' : ''} "/>>작성자</option>
         <option value="I"
         	<c:out value="${pc.searchType == 'I' ? 'selected' : ''} "/>>아이디</option>
       </select>
       <input class="col-sm-5 form-control form-control-sm px-1 mr-1" type="search" 
       name="keyword" id="keyword" placeholder="검색어를 입력하세요" value="${pc.keyword}">
       <button id="btn1" type="button" class="btn btn-outline-primary btn-sm px-2 mx-0">검색</button>
     </div>
     </form>
   </div>
</div>
<jsp:include page="/main_footer.jsp" flush="false" />
