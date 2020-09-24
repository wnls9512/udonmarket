<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/upload.css">

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>상품 등록</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb end-->
    
    <!--================ Register Area =================-->
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
												<input type="file" id="upload_file" name="">
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
                            <form class="row contact_form" action="#" method="post" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star" style="margin-top: 10%;">
                                    <input type="text" name="first_name" placeholder="글 제목"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '글 제목'" required
											class="single-input-primary">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                	<a href="#" class="genric-btn default-border" style="width: 100%;">카테고리 선택 &nbsp;&nbsp;&nbsp;&nbsp; ></a>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
										<input type="text" name="first_name" placeholder="가격 입력"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '가격 입력'" required
											class="single-input-primary" style="width:68%;">
										<div class="primary-switch">
											<input type="checkbox" id="primary-switch" checked>
											<label for="primary-switch"></label>
										</div>
										<p style="margin-left: 6%; width: 27%; color: darkgray; font-size:14px;">가격제안 받기</p>
                                    </div>
                                </div>
                                <div class="col-md-12 form-group p_star">
									<textarea class="single-textarea" placeholder="부개1동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)" 
											  onfocus="this.placeholder = ''" style="height: 240px;"
											  onblur="this.placeholder = '부개1동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)'" required></textarea>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
	                                	<a href="#" class="genric-btn default-border" style="width: 68%;">쿠폰 조회</a>
	                   					<div class="confirm-switch">
											<input type="checkbox" id="primary-switch" checked>
											<label for="confirm-switch"></label>
										</div>
										<p style="margin-left: 6%; width: 27%; color: darkgray; font-size:14px;">쿠폰 적용</p>
                                    </div>
                                </div>
                                <div class="col-md-12 form-group p_star">
	                                <button type="submit" value="submit" class="btn_3">
	                                    	완료
	                                </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


<script>
// file upload js start
var btnUpload = $("#upload_file"),
	btnOuter = $(".button_outer");
	
btnUpload.on("change", function(e)
{
	var ext = btnUpload.val().split('.').pop().toLowerCase();
	
	if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) 
	{
		$(".error_msg").text("Not an Image...");
	} 
	else 
	{
		$(".error_msg").text("");
		btnOuter.addClass("file_uploading");
		setTimeout(function()
		{
			btnOuter.addClass("file_uploaded");
		},3000);
		
		var uploadedFile = URL.createObjectURL(e.target.files[0]);
		setTimeout(function()
		{
			$("#uploaded_view").append('<img src="'+uploadedFile+'" />').addClass("show");
		},3500);
	}
});

$(".file_remove").on("click", function(e)
{
	$("#uploaded_view").removeClass("show");
	$("#uploaded_view").find("img").remove();
	btnOuter.removeClass("file_uploading");
	btnOuter.removeClass("file_uploaded");
});
//file upload js end
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	