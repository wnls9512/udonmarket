<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="동네생활" name="pageTitle"/>
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
                            <h2>게시글 작성하기</h2>
							<h3>서울 강남구 논현동</h3>
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
	                        	<div class="col-md-12 form-group p_star" style="margin-top: 10%;">
                                    <input type="text" name="userId" value="닉네임"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '회원'" required
											class="single-input-primary" readonly required style="background-color: #f6f6f6; width: 50%">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                	<!-- <a href="#" class="genric-btn default-border" style="width: 100%;">카테고리 선택 &nbsp;&nbsp;&nbsp;&nbsp; ></a> -->
                                	
										<select name="category">
										    <option value="">카테고리 선택</option>
										    <option value="17">동네생활이야기</option>
										    <option value="18">우리동네질문</option>
										    <option value="19">분실/실종센터</option>
										    <option value="20">동네사건사고</option>
										</select>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" name="first_name" placeholder="글 제목"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '글 제목'" required
											class="single-input-primary">
                                </div>
                               
                                
                                <div class="col-md-12 form-group p_star">
									<textarea class="single-textarea" placeholder="내용" 
											  onfocus="this.placeholder = ''" style="height: 240px;"
											  onblur="this.placeholder = '내용'" required></textarea>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <input type="text" name="first_name" placeholder="#태그"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '#태그'" required
											class="single-input-primary">
                                </div>
                                <div class="col-md-12 form-group p_star">
	                                <button type="button" value="submit" class="btn_3" id="uploadBtn">
	                                    	게시글 등록
	                                </button>
                           		 </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    </section>


<script>
/* ================ file upload start ================*/
$(function()
{
	$("#uploadBtn").on("click", function(e)
	{
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;

		console.log(files);

		// add filedata to formdata
		for(var i = 0; i < files.length; i++)
		{
			formData.append("uploadFile", files[i]);
		}

		$.ajax
		({
			url: '${pageContext.request.contextPath}/product/register',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result)
			{
				alert("Uploaded");
			}	
		});
	});
});

var btnUpload = $("#upload_file"),
	btnOuter = $(".button_outer");
	
btnUpload.on("change", function(e)
{
	var ext = btnUpload.val().split('.').pop().toLowerCase();
	
	if($.inArray(ext, ['png','jpg','jpeg']) == -1) 
	{
		$(".error_msg").text("해당 종류의 파일은 업로드할 수 없습니다.");
	} 
	else 
	{
		// process bar
		$(".error_msg").text("");
		btnOuter.addClass("file_uploading");
		setTimeout(function()
		{
			btnOuter.addClass("file_uploaded");
		},3000);

		// add thumbnail
		var uploadedFile = URL.createObjectURL(e.target.files[0]);
		setTimeout(function()
		{
			$("#uploaded_view").append('<img src="'+uploadedFile+'" />').addClass("show");
		},3500);
	}
});

// remove thumbnail
$(".file_remove").on("click", function(e)
{
	$("#uploaded_view").removeClass("show");
	$("#uploaded_view").find("img").remove();
	btnOuter.removeClass("file_uploading");
	btnOuter.removeClass("file_uploaded");
});
/* ================ file upload end ================*/
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	