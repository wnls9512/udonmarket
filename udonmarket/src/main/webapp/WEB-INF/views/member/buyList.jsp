<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<fmt:requestEncoding value="utf-8"/>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>

<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<style>
a{text-decoration: none; color: black;}
html { font-size: 16px; }
</style>
    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
	<section class="breadcrumb" style="background-color : #ecfdff;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2 style="display: inline-block;">MYPAGE</h2>
					       <img src="${pageContext.request.contextPath }/resources/img/banner/mypage3.png" 
			                                    	 alt="" 
			                                    	 style="max-width: 590px;position: relative; left: 115px;">  	 
                        </div>
                    </div>
                </div>
            </div>
         </div>
    </section>
    <!-- breadcrumb start-->
    
     <!-- 로그인 한 사용자 아이디 -->
 	<sec:authentication property="principal.username" var="loggedInUserId" />   
    
    <div class="row py-5 px-4">
	    <div class="col-md-5 mx-auto">
	        <!-- Profile widget -->
	        <div class="bg-white shadow rounded overflow-hidden">
	            <div class="px-4 pt-0 pb-4 cover">
	                <div class="media align-items-end profile-head">
	                    <div class="profile mr-3">
	                    	<!-- LoggdeInUser 정보 가져오기  -->
	                        <sec:authentication property="principal" var="loggedInUser" />
	                    	<img src="${pageContext.request.contextPath }/resources/img/member/${member.renamedFileName == null 
	                    															 ? member.originalFileName:member.renamedFileName}" 
	                    		 alt="..." 
	                    		 width="130" 
	                    		 class="rounded mb-2 img-thumbnail">
	                    	<a href="${pageContext.request.contextPath }/member/mypage?userId=${member.userId}" class="btn btn-outline-dark btn-sm btn-block">Mypage</a>
	                    </div>
	                    <div class="media-body mb-5 text-white">
	                        <h4 class="mt-0 mb-0" style="color:white;">${member.nickName}</h4>
	                        <p class="small mb-4" style="color:white;"> <i class="fas fa-map-marker-alt mr-2"></i>${member.address}</p>

	                    </div>
	                </div>
	            </div>
	            <div class="bg-light p-4 d-flex justify-content-end text-center">
	                <ul class="list-inline mb-0">
	                    <li class="list-inline-item">            
	                       <h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/salesList?userId=${member.userId}">
	                       		<i class="fas fa-receipt fa-2x" ></i> <br /> 판매목록
	                       	</a>
	                       </h6>
	                    </li>
	                    <li class="list-inline-item">
	                    	<h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="#">
	                       		<i class="fas fa-shopping-bag fa-2x" ></i> <br /> 구매목록
	                       	</a>
	                       </h6>
	                    </li>
	                    <c:if test="${loggedInUserId == member.userId }">
	                    <li class="list-inline-item">
	                    	<h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/wishList?userId=${member.userId}">
	                       		<i class="fas fa-heart fa-2x" ></i> <br /> 관심목록
	                       	</a>
	                       </h6>
	                    </li>
	                    </c:if>
	                </ul>
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
						<table class="table table-hover">
						  <thead>
						    <tr>
						    	<th colspan="4">
						    	<p class="h6" style="margin-bottom: 0;">구매 내역</p>
						    	</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:if test="${not empty list }">
						  		<c:forEach items="${list }" var="buy">
								    <tr>
								      <th scope="row">
							      		<!-- 첫번째 상품 이미지로 가져오기 -->
							      		<img src="/udon/resources/img/product/product/feature-product/f-p-1.jpg" 
							      			 onclick="location.href='${pageContext.request.contextPath}/product/productDetailView?pCode=${buy.PCode}';"
							      			 class="img-fluid" alt="product"
							      			 style="max-height: 230px;">							      	
								       </th>
								      <td colspan="3">
								      	<p style="font-size: 1rem;">${buy.title }</p>
								      	<p style="color: #545454; font-size: 0.9rem;">${buy.sellerAddr }</p>						      	
								      	<p style="font-weight: bold;">
								      		<span class="badge badge-secondary">거래완료</span>
								      		<fmt:formatNumber value="${buy.price }" groupingUsed="true"/>원
								      	</p>
								      	<input id="toggle-heart${buy.wishCode}" name="toggle-heart" type="checkbox"/>
										<label id="toggle-heart${buy.wishCode}-label" for="toggle-heart">❤</label> 
								      	${buy.totalWish}
								      	<!-- 열린 채팅방 수 -->
								      	<i class="far fa-comments"></i> 2<br />
								      	<c:if test="${loggedInUserId == member.userId }">
								      	<div style="margin:10px 0px;">
								      	<!-- 작성 후기가 있다면 후기 보기 페이지로 -->
								      	<c:if test="${ buy.reviewCode ne 0}">
									      	<button type="button" class="btn btn-outline-secondary btn-sm"
									      			style="margin: 0px 0.15rem;"
									      			onclick="reviewInfo('${buy.reviewCode}')">작성한 후기 보기</button>
								      	</c:if>
								      	<!-- 작성 후기 없다면 후기 작성 페이지로 이동 -->
								      	<c:if test="${ buy.reviewCode eq 0}">
								      		<button type="button" class="btn btn-outline-secondary btn-sm"
									      			style="margin: 0px 0.15rem;"
									      			onclick="insertReview('${buy.PCode}','${member.userId}')">후기 작성하러 가기</button>
								      	</c:if>
								      	</div>
								      	</c:if>
								      </td>
								    </tr>
						  		</c:forEach>
						  	</c:if>
						  	<c:if test="${empty list }">
						  		<tr><td colspan="4">
						  			<p>구매 내역이 없어요</p>
						  			<p>동네 이웃과 따뜻한 거래를 해보세요</p>
						  		</td></tr>
						  	</c:if>
						  </tbody>
						</table>
				        </nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
<script>
$(function(){

	
	
});

function reviewInfo(reviewCode){
	alert("리뷰코드는" + reviewCode);
	
}

function insertReview(pCode, userId){
	alert("상품코드는" + pCode +"사용자 아이디는" + userId);
	
}

</script>
<style>
[name=toggle-heart] {
  position: absolute;
  left: -100vw;
}
[for='toggle-heart'] {
  color: #aab8c2;
}
[name=toggle-heart]:checked + label {
  color: #e2264d;
} 
[for='toggle-heart'] {
  font-size: 1.5em;
  cursor: pointer;
}
[for='toggle-heart'] { 
  align-self: center; 
}
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	