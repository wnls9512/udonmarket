<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<fmt:requestEncoding value="utf-8"/>

<sec:authentication property="principal.username" var="userId"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="동네생활" name="pageTitle"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/upload.css">

 <script>

function fn_addtoBoard(){
    
    var form = document.getElementById("writeForm");
    
    form.action = "<c:url value='/community/communityFormDone'/>";
    form.submit();
    
}


</script>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>게시글 작성하기</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
<section class="login_part padding_top">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center" style="background-image:none; border: 1px solid #ff3368; width:100%;">
                        <div class="login_part_text_iner">
	                        	<!-- upload image start -->
	                        	<main class="main_full">
									<div class="container">
										<div class="panel">
											<div class="button_outer">
												<div class="btn_upload">
													<input type="file" id="upload_file" name="uploadFile" multiple>
													Upload Image 0 / 10
												</div>
												<div class="processing_bar"></div>
												<div class="success_box"></div>
											</div>
										</div>
										<div class="error_msg"></div>
										<div class="uploaded_file_view" id="uploaded_view">
											<span class="file_remove">X</span>
										</div>
									</div>
								</main>
								<!-- upload image end -->
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-6 col-md-6">
	                    <div class="login_part_form">
	                        <div class="login_part_form_iner">
	                        <form id="writeForm" name="writeForm" method="post">
	                        	<div class="col-md-12 form-group p_star" style="margin-top: 10%;">
                                    <input type="hidden" id="userId" name="userId" value="${ userId }" required
											class="single-input-primary" readonly required style="background-color: #f6f6f6; width: 50%">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                	<!-- <a href="#" class="genric-btn default-border" style="width: 100%;">카테고리 선택 &nbsp;&nbsp;&nbsp;&nbsp; ></a> -->
                                	
										<select id="categoryCode" name="categoryCode">
										    <option value="">카테고리 선택</option>
										    <option value="17">동네생활이야기</option>
										    <option value="18">우리동네질문</option>
										    <option value="19">분실/실종센터</option>
										    <option value="20">동네사건사고</option>
										</select>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" id="boardTitle"name="boardTitle" placeholder="글 제목" onfocus="this.placeholder = ''" onblur="this.placeholder = '글 제목'" required class="single-input-primary">
                                </div>
                               
                                
                                <div class="col-md-12 form-group p_star">
									<textarea class="single-textarea" id="boardContent"name="boardContent" placeholder="내용" onfocus="this.placeholder = ''" onblur="this.placeholder = '내용'" style="height: 240px;" required></textarea>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    	<select id="hashtagCode" name="hashtagCode">
										    <option value="100">태그 선택</option>
										    <option value="1">#강아지</option>
										    <option value="2">#고양이</option>
										    <option value="3">#건강</option>
										    <option value="4">#동네맛집</option>
										    <option value="5">#동네카페</option>
										    <option value="6">#살림/청소/정리</option>
										    <option value="7">#식물</option>
										    <option value="8">#임신/출산/육아</option>
										    <option value="9">#집꾸미기</option>
										    
										</select>
                                </div>
                                <div class="col-md-12 form-group p_star">
	                               <!-- <input type="submit" value="게시글 등록" class="btn_1" /> -->
	                                <a onClick='fn_addtoBoard()' class="btn_3" style="text-align: center;">게시글 등록</a>
	                                    
                           		 </div>
                           		 </form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    </section>


<script>

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	