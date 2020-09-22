<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="프로필 수정" name="pageTitle"/>
</jsp:include>
<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>프로필 수정</h2>
							<h3>서울 강남구 논현동</h3>
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
	                <img src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" alt="..." width="130" class="rounded mb-2 img-thumbnail">
	                   
	                </div>
	            </div>
	            <div class="bg-light p-4 d-flex justify-content-end text-center">
	                
	            </div>
	            
		        </div>
	    </div>
	</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    
