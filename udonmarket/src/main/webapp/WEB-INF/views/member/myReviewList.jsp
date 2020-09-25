<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<!-- kakao map api&library -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a40619c082a3c1c995f8bec611d38389&libraries=services,clusterer,drawing"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>

<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<style>
a{text-decoration: none; color: black;}
html { font-size: 16px; }
.custom1 {
background-color: #fbf9ff;
border: 1px solid #f2f2f2;
border-radius: 20px;
text-align: center;
font-weight: bolder;
display: inline-block;
padding: 5px 10px;
margin: 5px 10px;
}

</style>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>마이페이지</h2>
							<!-- <h3>서울 강남구 논현동</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
    
    
    <div class="row py-5 px-4">
	    <div class="col-md-5 mx-auto">
	        <!-- Profile widget -->
	        <div class="bg-white shadow rounded overflow-hidden">
	            <div class="px-4 pt-0 pb-4 cover">
	                <div class="media align-items-end profile-head">
	                    <div class="profile mr-3"><img src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" alt="..." width="130" class="rounded mb-2 img-thumbnail">
	                    	<a href="${pageContext.request.contextPath }/member/mypage" class="btn btn-outline-dark btn-sm btn-block">Mypage</a>
	                    </div>
	                    <div class="media-body mb-5 text-white">
	                        <h4 class="mt-0 mb-0" style="color:white;">Mark Williams</h4>
	                        <p class="small mb-4" style="color:white;"> <i class="fas fa-map-marker-alt mr-2"></i>New York</p>
	                    </div>
	                </div>
	            </div>
	            <div class="bg-light p-4 d-flex justify-content-end text-center">
	                <ul class="list-inline mb-0">
	                    <li class="list-inline-item">            
	                       <h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/salesList">
	                       		<i class="fas fa-receipt fa-2x" ></i> <br /> 판매목록
	                       	</a>
	                       </h6>
	                    </li>
	                    <li class="list-inline-item">
	                    	<h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/buyList">
	                       		<i class="fas fa-shopping-bag fa-2x" ></i> <br /> 구매목록
	                       	</a>
	                       </h6>
	                    </li>
	                    <li class="list-inline-item">
	                    	<h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/wishList">
	                       		<i class="fas fa-heart fa-2x" ></i> <br /> 관심목록
	                       	</a>
	                       </h6>
	                    </li>
	                </ul>
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
						<div>
						<hr />
							<div style="text-align: center; ">
								<h5 style="font-weight: bold;
									  		color: #575757;"><a href="#">받은 매너 평가</a></h5> 		
							    <p id="myLocal" style=" color: #575757;"></p>
							</div>
							<hr />							  							
							<div>
							<table>
								<tbody>
									<tr>
										<td>
										<ul class="unordered-list">
											<li>
							                   <h4 style="display: inline-block;">1234명</h4>														
											</li>
								        </ul>
										</td>
										<td>
											<p class="custom1">친절하고 매너가 좋아요</p>
										</td>
									</tr>
									<tr>
										<td>
										<ul class="unordered-list">
											<li>
							                   <h4 style="display: inline-block;">1233명</h4>														
											</li>
								        </ul>
										</td>
										<td>
											<p class="custom1">응답이 빨라요</p>
										</td>
									</tr>
									<tr>
										<td>
										<ul class="unordered-list">
											<li>
							                   <h4 style="display: inline-block;">122명</h4>														
											</li>
								        </ul>
										</td>
										<td>
											<p class="custom1">시간 약속을 잘 지켜요</p>
										</td>
									</tr>
									<tr>
										<td>
										<ul class="unordered-list">
											<li>
							                   <h4 style="display: inline-block;">121명</h4>														
											</li>
								        </ul>
										</td>
										<td>
											<p class="custom1">상품 설명이 자세해요</p>
										</td>
									</tr>
									<tr>
										<td>
										<ul class="unordered-list">
											<li>
							                   <h4 style="display: inline-block;">12명</h4>														
											</li>
								        </ul>
										</td>
										<td>
											<p class="custom1">좋은 상품을 저렴하게 판매해요</p>
										</td>
									</tr>
								</tbody>
							</table>
							<hr />	
							<div style="text-align: center; margin-bottom: 15px;">
								 <h5 style="font-weight: bold;
									  		color: #575757;"><a href="#">받은 거래 후기(12)</a></h5>
							</div>
							<div>
								<table class="table table-hover">
									<tbody>
										<!-- 후기 시작 -->	
										<tr><td>
											<div class="row">
												<div class="col-md">
													<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
													  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
													  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
													</svg>
													<h4 class="mb-20" style="display: inline-block;">익명 사용자</h4> 
													<p style="display: inline-block; color: #575757;"> 수원시 영통구 망포동</p>		
													<p class="text-left">잘 받았습니다 너무 귀엽네요 시간 약속 지켜주셔서 감사드립니다 </p>
												</div>
											</div>
										</td></tr>
										<!-- 후기 끝 -->	
										<!-- 후기 시작 -->	
										<tr><td>
											<div class="row">
												<div class="col-md">
													<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
													  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
													  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
													</svg>
													<h4 class="mb-20" style="display: inline-block;">익명 사용자</h4> 
													<p style="display: inline-block; color: #575757;"> 수원시 영통구 망포동</p>		
													<p class="text-left">잘 받았습니다 너무 귀엽네요 시간 약속 지켜주셔서 감사드립니다 </p>
												</div>
											</div>
										</td></tr>
										<!-- 후기 끝 -->	
										<!-- 후기 시작 -->	
										<tr><td>
											<div class="row">
												<div class="col-md">
													<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
													  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
													  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
													</svg>
													<h4 class="mb-20" style="display: inline-block;">익명 사용자</h4> 
													<p style="display: inline-block; color: #575757;"> 수원시 영통구 망포동</p>		
													<p class="text-left">잘 받았습니다 너무 귀엽네요 시간 약속 지켜주셔서 감사드립니다 </p>
												</div>
											</div>
										</td></tr>
										<!-- 후기 끝 -->	
										<!-- 후기 시작 -->	
										<tr><td>
											<div class="row">
												<div class="col-md">
													<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
													  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
													  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
													</svg>
													<h4 class="mb-20" style="display: inline-block;">익명 사용자</h4> 
													<p style="display: inline-block; color: #575757;"> 수원시 영통구 망포동</p>		
													<p class="text-left">잘 받았습니다 너무 귀엽네요 시간 약속 지켜주셔서 감사드립니다 </p>
												</div>
											</div>
										</td></tr>
										<!-- 후기 끝 -->	
										<!-- 후기 시작 -->	
										<tr><td>
											<div class="row">
												<div class="col-md">
													<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
													  <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
													  <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
													</svg>
													<h4 class="mb-20" style="display: inline-block;">익명 사용자</h4> 
													<p style="display: inline-block; color: #575757;"> 수원시 영통구 망포동</p>		
													<p class="text-left">잘 받았습니다 너무 귀엽네요 시간 약속 지켜주셔서 감사드립니다 </p>
												</div>
											</div>
										</td></tr>
										<!-- 후기 끝 -->	
									</tbody>
								</table>
							
							</div>
						</div>
				        </nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	