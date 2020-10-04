<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="제품 상세보기" name="pageTitle"/>
</jsp:include>

<sec:authentication property="principal.username" var="userId"/>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <!-- <h2>게시글 제목</h2>
							<h3>카테고리</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->



  <!--================Single Product Area =================-->
  <div class="product_image_area section_padding">
    <div class="container">
      <div class="row s_product_inner justify-content-between">
        <div class="col-lg-7 col-xl-7">
          <div class="product_slider_img">
            <div id="vertical">
              <div data-thumb="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png">
                <img src="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png" />
              </div>
              <div data-thumb="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png">
                <img src="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png" />
              </div>
              <div data-thumb="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png">
                <img src="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png" />
              </div>
              <div data-thumb="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png">
                <img src="${pageContext.request.contextPath}/resources/img/product/single-product/product_1.png" />
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-5 col-xl-4">
          <div class="s_product_text">
             <div class="media">
              <div class="d-flex w-25">
                <img class="rounded-circle" 
                	 src="${pageContext.request.contextPath }/resources/img/member/${seller.renamedFilename == null ? seller.originalFilename:seller.renamedFilename}"  
                	 alt="" />
              </div>
              <div class="media-body" style="margin: 6%;">
                <h4>${seller.nickname }</h4>
                <span>${product.address }</span>
              </div>
              <div>
              	거래온도 
              	${seller.score }
              </div>
            </div>
            <br/>
            <c:if test="${product.seller != userId }">
            <c:choose>
            <c:when test="${product.tradeStatus == 'R' }">
            <h3 class="d-inline" style="color: green;">예약중</h3>
            </c:when>
            <c:when test="${product.tradeStatus == 'C' }">
            <h3 class="d-inline" style="color: gray;">거래완료</h3>
            </c:when>
            </c:choose>
            </c:if>
            <h3 class="d-inline">
            ${product.title }
            </h3>
            <br/><br/>
            <h2 class="d-inline"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" />원</h2>&nbsp;&nbsp;
            <span style="color: red;">${product.category }</span><br/>
            <ul class="list">
              <li>
                <a href="javascript:void(0);">
                <c:if test="${product.seller == userId }">
				<div class="default-select mt-3" id="status_select">
					<select>
						<option value="S" <c:if test="${product.tradeStatus == 'S' }">selected</c:if>>판매중</option>
						<option value="R" <c:if test="${product.tradeStatus == 'R' }">selected</c:if>>예약중</option>
						<option value="C" <c:if test="${product.tradeStatus == 'C' }">selected</c:if>>거래완료</option>
					</select>
				</div>
                </c:if>
                </a>
              </li>
            </ul>
            <p>
            ${product.content }
            </p>
            <div class="card_area d-flex justify-content-between" style="border: none;">
            	<span style="color: gray;">관심 ${product.wish} · 채팅 ${product.chat }<br /></span>
            </div>
            <div class="card_area d-flex justify-content-between align-items-center">
              <a href="#" class="btn_3">채팅으로 거래하기</a>
              <c:if test="${product.offer == 1 }">
              <a href="#">가격제안하기</a>
              </c:if>
              <c:if test="${product.offer == 0 }">
              <a href="javascript:void(0);">가격제안 불가</a>
              </c:if>
              <a href="javascript:addToWish('${userId}', '${product.PCode}')" class="like_us"> <i class="ti-heart"></i> </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--================End Single Product Area =================-->


    <!-- product_list part start-->
    <section class="product_list best_seller">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>관련 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath }/resources/img/product/product_1.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath }/resources/img/product/product_2.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath }/resources/img/product/product_3.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath }/resources/img/product/product_4.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath }/resources/img/product/product_5.png" alt="">
                            <div class="single_product_text">
                                <h4>Quartz Belt Watch</h4>
                                <h3>$150.00</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product_list part end-->
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
<script>
//관심 목록 추가
function addToWish(userId, pCode)
{
	$.ajax
	({
		url: "${pageContext.request.contextPath}/product/addToWish",
		method: "POST",
		data: 
		{
			userId: userId,
			pCode: pCode
		}, 
		dataType: "text",
		beforeSend: function(xhr)
		{
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
			success: function(result)
		{
			alert(result);										
		},
		error: function(xhr, status, err)
		{
			alert("이미 관심목록에 추가되있어요 💘");
		}
	});
}

$(function()
{
	// 거래 상태 변경
	$("#status_select").on("change", function()
	{
		var selected = $("#status_select option:selected").val();
		var pCode = "${product.PCode}";

		$.ajax
		({
			url: "${pageContext.request.contextPath}/product/changeStatus",
			method: "POST",
			data: 
			{
				status: selected,
				pCode: pCode
			}, 
			dataType: "text",
			beforeSend: function(xhr)
			{
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
				success: function(result)
			{
				alert(result);										
			},
			error: function(xhr, status, err)
			{
				alert("상태 변경에 실패했어요 💧");
			}
		});
	});
});
</script>
	
	