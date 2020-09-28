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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modal.css">

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
                    <div class="login_part_text text-center" style="background-image:none; border: 1px solid #ff3368; width:100%; padding: 50px 70px;">
                        <div class="login_part_text_iner">
	                        	<!-- upload image start -->
	                        	<main class="main_full">
									<div class="container">
										<div class="panel" style="margin-top: 0;">
											<div class="button_outer">
												<div class="btn_upload">
													<input type="file" id="upload_file" name="uploadFile" multiple>
													Upload Image 0 / 5
												</div>
												<div class="processing_bar"></div>
												<div class="success_box"></div>
											</div>
										</div>
										<div class="error_msg"></div>
										<div class="preview popup-gallery" id="preview0"></div>
										<div class="preview popup-gallery" id="preview1"></div>
										<div class="preview popup-gallery" id="preview2"></div>
										<div class="preview popup-gallery" id="preview3"></div>
										<div class="preview popup-gallery" id="preview4"></div>
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
                                    <input type="text" name="title" placeholder="글 제목"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '글 제목'" required
											class="single-input-primary">
                                </div>
                                <div class="col-md-12 form-group p_star">
                                	<button data-toggle="modal" data-target="#categoryModal" class="btn btn-primary genric-btn default-border" 
                                			id="category" data-code="" type="button" style="width: 100%; color: #007bff;">카테고리 선택 &nbsp;&nbsp;&nbsp;&nbsp; ></button>
                              		<input type="hidden" name="category" value=""/>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
										<input type="number" name="price" placeholder="가격 입력"
											onfocus="this.placeholder = ''" onblur="this.placeholder = '가격 입력'" required
											class="single-input-primary" style="width:68%;">
										<div class="primary-switch">
											<input type="checkbox" id="primary-switch" checked>
											<label for="primary-switch"></label>
										</div>
										<input type="hidden" name="offer" />
										<p style="margin-left: 6%; width: 30%; color: darkgray; font-size:14px;">가격제안 받기</p>
                                    </div>
                                </div>
                                <div class="col-md-12 form-group p_star">
									<textarea class="single-textarea" placeholder="부개1동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)" 
											  onfocus="this.placeholder = ''" style="height: 240px;" name="content"
											  onblur="this.placeholder = '부개1동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요.)'" required></textarea>
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
	                                	<button type="button" class="genric-btn default-border btn btn-primary" data-toggle="modal" data-target="#couponModal" 
	                                			style="width: 68%; color: #007bff;">쿠폰 조회</button>
	                   					<div class="confirm-switch">
											<input type="checkbox" id="confirm-switch" disabled>
											<label for="confirm-switch"></label>
										</div>
										<p style="margin-left: 6%; width: 27%; color: darkgray; font-size:14px;">쿠폰 적용</p>
                                    </div>
                                </div>
                                <div class="col-md-12 form-group p_star">
	                                <button type="button" value="submit" class="btn_3" id="uploadBtn">
	                                    	완료
	                                </button>
                           		 </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    </section>
    
<!-- ====== Category Modal ======  -->
<div id="categoryModal" class="modal fixed-left fade" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-aside" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<div class="button-group-area mt-40">
			<c:forEach items="${category }" var="c" varStatus="status">
			<c:if test="${status.count % 2 == 0}">
			<a href="javascript:void(0);" class="genric-btn primary radius category" style="width: 100%;" 
			   data-code="${c.categoryCode }" data-name="${c.categoryName }">${c.categoryName }</a>
			</c:if>
			<c:if test="${status.count % 2 == 1}">
			<a href="javascript:void(0);" class="genric-btn success radius category" style="width: 100%;" 
			   data-code="${c.categoryCode }" data-name="${c.categoryName }">${c.categoryName }</a>
			</c:if>
			</c:forEach>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- ====== Coupon Modal ======  -->
<div class="modal fade" id="couponModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Coupon</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	   <div class="row text-center align-items-end">
	      <!-- Coupon Table START -->
	      <div class="mb-5 mb-lg-0" style="float:none; margin:0 auto;">
	        <div class="bg-white p-5 rounded-lg shadow">
	          <h1 class="h6 text-uppercase font-weight-bold mb-4">${coupon.couponName }</h1>
	          <h2 class="h1 font-weight-bold">${coupon.amount }<span class="text-small font-weight-normal ml-2">개</span></h2>
	
	          <div class="custom-separator my-4 mx-auto bg-primary"></div>
	
	          <ul class="list-unstyled my-5 text-small text-left">
	            <li class="mb-3">
	              <i class="fa fa-check mr-2 text-primary"></i> 쿠폰 적용된 상품은 전국에 노출됩니다.</li>
	            <li class="mb-3">
	              <i class="fa fa-check mr-2 text-primary"></i> 유효기간은 <span class="text-small font-weight-normal ml-2">
	              		<fmt:formatDate value="${coupon.expireDate }" pattern="yyyy년 MM월 dd일"/></span>까지 입니다.</li>
	            <li class="mb-3 text-muted">
	              <i class="fa fa-times mr-2"></i>해당 쿠폰은 타인 양도 불가합니다.
	            </li>
	            <li class="mb-3 text-muted">
	              <i class="fa fa-times mr-2"></i>거짓물품 배송시 사이트 이용에 제한이 생깁니다.
	            </li>
	            <li class="mb-3 text-muted">
	              <i class="fa fa-times mr-2"></i>쿠폰 적용 후 취소는 불가합니다.
	            </li>
	          </ul>
	          <a href="javascript:void(0);" class="btn btn-primary btn-block p-2 shadow rounded-pill coupon">적용</a>
	          <input type="hidden" name="coupon" value=""/>
	        </div>
	      </div>
	      <!-- Coupon Table END -->
      	</div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

 
<script>
/* ================ file upload START ================*/

var btnUpload = $("#upload_file"),
	btnOuter = $(".button_outer");

$(function()
{
	btnUpload.on("change", function(e)
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
			dataType: 'json',
			success: function(result)
			{
				console.log(result);

				showUploadedFile(result);

				$(".btn_upload").html("Upload Image " + result.length + " / 5");
			}	
		});
	});
});


	
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
			btnOuter.removeClass("file_uploading");
		},3000);
	}
});

// show thumbnail
function showUploadedFile(uploadResultArr)
{
	var str = "";
	
	$(uploadResultArr).each(function(i, obj)
	{
		var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
		originPath = originPath.replace(new RegExp(/\\/g), "/");

		str += "<a href='${pageContext.request.contextPath}/product/display?fileName=" + originPath + "'>";
		str += "<img src='${pageContext.request.contextPath}/product/display?fileName=" + fileCallPath + "'></a>";


		
		$("#preview" + i).append(str);

		str = "";
	});


	$.each ($("[id^=preview]"), function (i, el) 
	{
		$("#preview" + i).hide();
		
		if($("#preview" + i).find($("img")).length)
		{
			setTimeout(function()
			{
				$("#preview" + i).show();
			},3500);
		}
	});
}

// remove thumbnail
$(".file_remove").on("click", function(e)
{
	$("#uploaded_view").removeClass("show");
	$("#uploaded_view").find("img").remove();
	btnOuter.removeClass("file_uploading");
	btnOuter.removeClass("file_uploaded");
});

// show original image
$(document).ready(function() {
	$('.popup-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
			}
		}
	});
});
/* ================ file upload END ================*/


/* ================ submit form START ================*/
$(function()
{
	// 카테고리
	function selectCategory(code, name)
	{
		$("#category").html(name);
		$("[name=category]").val(code);
	}

	$(".category").on("click", function()
	{
		var code = $(this).data('code');
		var name = $(this).data('name');
		
		selectCategory(code, name);
		$("#categoryModal").hide();
		$(".modal-backdrop").hide();
	});

	// 쿠폰
	$(".coupon").on("click", function()
	{
		$("#couponModal").hide();
		$(".modal-backdrop").hide();

		$("#confirm-switch").removeAttr("disabled");
		$("#confirm-switch").prop("checked", true);
		$("[name=coupon]").val(1);
	});

	$("#confirm-switch").on("change", function()
	{
		if($(this).is(":checked"))
			$("[name=coupon]").val(1);
		else
			$("[name=coupon]").val(0);
	});
	
	// 가격제안
	$("#primary-switch").on("change", function()
	{
		if($(this).is(":checked"))
			$("[name=offer]").val(1);
		else
			$("[name=offer]").val(0);

		alert($("[name=offer]").val());
	});
	
	
/* 	$("#uploadBtn").on("click", function()
	{
		var formData = new FormData();

		formData.append("seller", 'test');
		formData.append("title", $("[name=title]").val());
		formData.append("category", $("[name=category]").val());
		formData.append("content", $("[name=content]").val());
		formData.append("price", $("[name=price]").val());
		formData.append("coupon", $("[name=coupon]").val());
		formData.append("offer", ?);
		
	});  */
});
/* ================ submit form END ================*/

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	