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
	                    <div class="profile mr-3"><img src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" alt="..." width="130" class="rounded mb-2 img-thumbnail"><a href="${pageContext.request.contextPath}/member/editprofile" class="btn btn-outline-dark btn-sm btn-block">Edit profile</a></div>
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
	                       		<i class="fas fa-receipt fa-2x" ></i> <br /> 판매내역
	                       	</a>
	                       </h6>
	                    </li>
	                    <li class="list-inline-item">
	                    	<h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/buyList">
	                       		<i class="fas fa-shopping-bag fa-2x" ></i> <br /> 구매내역
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
				          <a href="${pageContext.request.contextPath }/member/settingsArea" class="nav-link px-4 rounded-pill">
	                           <i class="fas fa-map-marker-alt"></i>&nbsp; 내 동네 설정
	                      </a>
				          <a href="${pageContext.request.contextPath }/member/keywordNoti" class="nav-link px-4 rounded-pill">
		                      <i class="fas fa-tag"></i>&nbsp; 키워드 알림
	                      </a>
<!-- 				          <a href="#" class="nav-link px-4 rounded-pill">
		                      <i class="fas fa-th-large"></i>&nbsp; 모아보기
	                      </a> -->
				          <a href="${pageContext.request.contextPath }/member/myReviewList" class="nav-link px-4 rounded-pill">
		                      <i class="far fa-smile"></i>&nbsp; 받은 거래 후기
	                      </a>
				        </nav>
	                </div>
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
				          <a href="${pageContext.request.contextPath}/member/myPost" class="nav-link px-4 rounded-pill">
	                           <i class="far fa-edit"></i>&nbsp; 동네생활 글
	                      </a>
				          <a href="${pageContext.request.contextPath}/member/myComment" class="nav-link px-4 rounded-pill">
		                      <i class="far fa-comment-dots"></i>&nbsp; 동네생활 댓글
	                      </a>
				          <a href="${pageContext.request.contextPath}/member/interList" class="nav-link px-4 rounded-pill">
		                      <i class="far fa-star"></i>&nbsp; 관심 주제 목록
	                      </a>
				        </nav>
	                </div>
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
				          <a href="#" class="nav-link px-4 rounded-pill">
	                           <i class="far fa-envelope"></i>&nbsp; 친구초대
	                      </a>
				          <a href="#" class="nav-link px-4 rounded-pill">
		                      <i class="fas fa-share-alt"></i>&nbsp; 당근마켓 공유
	                      </a>
				          <a href="${pageContext.request.contextPath}/member/announce" class="nav-link px-4 rounded-pill">
		                      <i class="far fa-flag"></i>&nbsp; 공지사항
	                      </a>
				          <a href="${pageContext.request.contextPath}/member/FAQ" class="nav-link px-4 rounded-pill">
		                      <i class="far fa-question-circle"></i>&nbsp; 자주 묻는 질문
	                      </a>
				        </nav>
	                </div>
	            </div>
<!-- 	            <div class="py-4 px-4">
	                <div class="d-flex align-items-center justify-content-between mb-3">
	                    <h5 class="mb-0">Recent photos</h5><a href="#" class="btn btn-link text-muted">Show all</a>
	                </div>
	                <div class="row">
	                    <div class="col-lg-6 mb-2 pr-lg-1"><img src="https://images.unsplash.com/photo-1469594292607-7bd90f8d3ba4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" alt="" class="img-fluid rounded shadow-sm"></div>
	                    <div class="col-lg-6 mb-2 pl-lg-1"><img src="https://images.unsplash.com/photo-1493571716545-b559a19edd14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" alt="" class="img-fluid rounded shadow-sm"></div>
	                    <div class="col-lg-6 pr-lg-1 mb-2"><img src="https://images.unsplash.com/photo-1453791052107-5c843da62d97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80" alt="" class="img-fluid rounded shadow-sm"></div>
	                    <div class="col-lg-6 pl-lg-1"><img src="https://images.unsplash.com/photo-1475724017904-b712052c192a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80" alt="" class="img-fluid rounded shadow-sm"></div>
	                </div>
	            </div> -->
	        </div>
	    </div>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	