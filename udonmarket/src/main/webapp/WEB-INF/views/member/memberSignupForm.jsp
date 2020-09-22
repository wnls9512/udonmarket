<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="pageTitle"/>
</jsp:include>

<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/signupform.css">

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>회원가입</h2>
							<!-- <h3>서울 강남구 논현동</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
   <div id="memberSignup-container" class="row py-5 px-4">
	    <div class="col-md-5 mx-auto">
	     <form id="memberSignupFrm" action="signupForm" method="post">
	        <!-- Profile widget -->
	        <div class="bg-white shadow rounded overflow-hidden">
	            <div class="px-4 pt-0 pb-4 cover">
	                <div class="media align-items-end profile-head" style="text-align: center">
	                    <div class="media-body mb-5 text-white">
	                        <h4 class="mt-0 mb-0" style="color:white;">회원가입</h4>
	                    </div>
	                </div>
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
				        	<table>
				        	<tr>
				        		<td>
					        		<div class="signup-container">
				        				<input type="text" name="userId" id="userId" class="nav-link px-4 rounded-pill" placeholder="아이디 입력" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="password" name="password" id="userId" class="nav-link px-4 rounded-pill" placeholder="비밀번호 입력" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="email" name="email" id="email" class="nav-link px-4 rounded-pill" placeholder="이메일 입력" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="text" name="nickname" id="nickname" class="nav-link px-4 rounded-pill" placeholder="별명 입력" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="text" name="address" id="address" class="nav-link px-4 rounded-pill" placeholder="주소 입력" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	</table>
				        </nav>
				        <div>
				        	<input type="submit" value="회원가입" class="nav-link-submit-reset px-4 rounded-pill">
							<input type="reset" value="취소" class="nav-link-submit-reset px-4 rounded-pill">
						</div>
	                </div>
	            </div>
	        </div>
	    </form>
	    </div>
	</div>
    
   








<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	