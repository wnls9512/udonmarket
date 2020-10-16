<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="로그인" name="pageTitle"/>
</jsp:include>



    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>LOGIN</h2>
							<!-- <h3>서울 강남구 논현동</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
    
    
    

    <!--================login_part Area =================-->
    <section class="login_part padding_top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>New to our Shop?</h2>
                            <p>There are advances being made in science and technology
                                everyday, and a good example of this is the</p>
                            <a href="${pageContext.request.contextPath }/member/signupForm" class="btn_3">Create an Account</a>
                        </div>
                    </div>
                </div>
				<div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Welcome Back ! <br>
                                Please Sign in now</h3>
                            <form:form class="row contact_form" action="${pageContext.request.contextPath }/member/login" method="POST" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                                </div>
                                <div class="col-md-12 form-group">
                                    <button type="submit" value="submit" class="btn_3">로그인</button>
                                    <a class="lost_pass" href="${pageContext.request.contextPath }/member/passwordFind" style="font-size: large; font-weight: 800">비밀번호 찾기</a>
                                </div>
                            </form:form>
	                             	<div class="col-md-12 form-group">                            
<%--                                     	<a href="https://kauth.kakao.com/oauth/authorize?client_id=91a359c6f4f2628b3f78a34ef78b9d82&redirect_uri=http://localhost:9090/udon/kakaologin&response_type=code"><img src="${pageContext.request.contextPath }/resources/img/kakao_login_page.png" style="width: 100%; border-radius: 2rem; padding-bottom: 1rem;"/></a> --%>
                                    	<a href="https://kauth.kakao.com/oauth/authorize?client_id=91a359c6f4f2628b3f78a34ef78b9d82&redirect_uri=http://localhost:9090/udon/kakaologin&response_type=code"><img src="${pageContext.request.contextPath }/resources/img/kakao_login_page.png" style="width: 100%; border-radius: 2rem; padding-bottom: 1rem;"/></a>
 									</div> 
<%--                             	<form:form class="row contact_form" action="https://kauth.kakao.com/oauth/authorize?client_id=91a359c6f4f2628b3f78a34ef78b9d82&redirect_uri=http://localhost:9090/udon/kakaologin&response_type=code" method="GET"> --%>
<%-- 										<button type="submit" style="border-color: transparent; width: 100%"><img src="${pageContext.request.contextPath }/resources/img/kakao_login_page.png" style="width: 100%; border-radius: 2rem; padding-bottom: 1rem;"/></button> --%>
<%-- 								</form:form> --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================login_part end =================-->




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	