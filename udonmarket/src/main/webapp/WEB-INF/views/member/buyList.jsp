<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	                       	<a href="#">
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
						<table class="table table-hover">
						  <thead>
						    <tr>
						    	<th colspan="4">
						    	<p class="h6" style="margin-bottom: 0;">구매 내역</p>
						    	</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">
						      	<a href="#">
						      		<img src="/udon/resources/img/product/product/feature-product/f-p-1.jpg" 
						      			 class="img-fluid" alt="product"
						      			 style="max-height: 230px;">
						      	</a>
						       </th>
						      <td colspan="3">
						      	<p style="font-size: 1rem;">아이패드 프로 3세대 64기가 애플펜슬 1세대 포함</p>
						      	<p style="color: #545454; font-size: 0.9rem;">서울시 강남구 역삼동</p>						      	
						      	<p style="font-weight: bold;">
						      		<span class="badge badge-secondary">거래완료</span>
						      		580,000원
						      	</p>
						      	<p>❤ 8  💭 2<br />
						      	<div style="margin:10px 0px;">
						      	<button type="button" class="btn btn-outline-secondary btn-sm"
						      			style="margin: 0px 0.15rem;">작성한 후기 보기</button>
						      	</div>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">
						      	<a href="#">
						      		<img src="/udon/resources/img/product/product/feature-product/f-p-3.jpg" 
						      			 class="img-fluid" alt="product"
						      			 style="max-height: 230px;">
						      	</a>
						       </th>
						      <td colspan="3">
						      	<p style="font-size: 1rem;">애플워치 3세대</p>
						      	<p style="color: #545454; font-size: 0.9rem;">서울시 강남구 역삼동</p>
						      	<p style="font-weight: bold;">
						      		<span class="badge badge-secondary">거래완료</span>
						      		160,000원
						      	</p>
						      	<br />
						      	<p>❤ 8  💭 2<br />
						      	<div style="margin:10px 0px;">
						      	<button type="button" class="btn btn-outline-secondary btn-sm"
						      			style="margin: 0px 1.5px;">작성한 후기 보기</button>
						      	</div>
						      </td>
						    </tr>
						    <tr>
						      <th scope="row">
						      	<a href="#">
						      		<img src="/udon/resources/img/product/product/feature-product/f-p-2.jpg" 
						      			 class="img-fluid" alt="product"
						      			 style="max-height: 230px;">
						      	</a>
						       </th>
						      <td colspan="3">
						      	<p style="font-size: 1rem;">질스튜어트가방</p>
						      	<p style="color: #545454; font-size: 0.9rem;">서울시 강남구 역삼동</p>
						      	<p style="font-weight: bold;">
						      		<span class="badge badge-secondary">거래완료</span>
						      		60,000원
						      	</p>
						      	<br />
						      	<p>❤ 8  💭 2<br />
						      	<div style="margin:10px 0px;">
						      	<button type="button" class="btn btn-outline-secondary btn-sm"
						      			style="margin: 0px 1.5px;">작성한 후기 보기</button>
						      	</div>
						      </td>
						    </tr>
						  </tbody>
						</table>
				        </nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	