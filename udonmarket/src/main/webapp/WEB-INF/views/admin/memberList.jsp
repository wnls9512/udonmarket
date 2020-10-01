<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<%-- 	한글 인코딩 처리 --%>
<fmt:requestEncoding value="utf-8"/>	
	
	<jsp:include page="/WEB-INF/views/common/header.jsp">
		<jsp:param value="회원관리" name="pageTitle"/>
	</jsp:include>
<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css">

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
                            <h2>관리자용 페이지</h2>
							<!-- <h3>서울 강남구 논현동</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	<h1 class="text-center mt-5">관리자만 접근 가능한 페이지 입니다. </h1>

		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>