<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="제품 상세보기" name="pageTitle"/>
</jsp:include>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>게시글 제목</h2>
							<h3>카테고리</h3>
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
              <div class="d-flex">
                <img src="${pageContext.request.contextPath}/resources/img/product/single-product/review-1.png" alt="" />
              </div>
              <div class="media-body" style="margin: 2%;">
                <h4>${seller.nickname }</h4>
                <span>${product.address }</span>
              </div>
              <div>
              	거래온도 
              	${seller.score }
              </div>
            </div>
            <br/>
            <h3>${product.title }</h3>
            <h2>${product.price }원</h2>
            <ul class="list">
              <li>
                <a class="active" href="#">
                  <span>카테고리</span> : ${product.category }</a>
              </li>
              <li>
                <a href="javascript:void(0);"> <span>상태</span> : 
                <c:choose>
                <c:when test="${product.tradeStatus == 'S' }">판매중</c:when>
                <c:when test="${product.tradeStatus == 'R' }">예약중</c:when>
                <c:when test="${product.tradeStatus == 'C' }">판매완료</c:when>
                </c:choose>
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
              <a href="#" class="like_us"> <i class="ti-heart"></i> </a>
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
	
	
	
	