<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
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
	
		<!--================ 사이드바 =================-->	
    <section class="cat_product_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="l_w_title">
                                <h3>관리자 메뉴</h3>
                            </div>
                            <div class="widgets_inner">
                                <ul class="list">
                                    <li><a href="${pageContext.request.contextPath }/admin/memberList">회원 조회 / 등록 / 삭제</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/memberList">신고 관리(게시글)</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/memberList">신고 관리(댓글)</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/memberList">쿠폰 관리</a></li>
                                </ul>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
	</section>
	
	<section class="cat_product_area section_padding">
		<form:form id="adminMemberSignupFrm" action="${pageContext.request.contextPath }/member/signupForm" method="post">

		</form:form>
	</section>


		
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>