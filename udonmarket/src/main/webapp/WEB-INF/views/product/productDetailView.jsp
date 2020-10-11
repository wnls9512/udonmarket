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
              <div class="d-flex" style="width: 17%;">
              <a href="${pageContext.request.contextPath}/member/mypage?userId=${product.seller}">
                <img class="rounded-circle" 
                	 src="${pageContext.request.contextPath }/resources/img/member/${seller.renamedFilename == null ? seller.originalFilename:seller.renamedFilename}"  
                	 alt="" />
              </div>
              <div class="my-2 ml-2" style="width: 37%;">
                <h4>${seller.nickname }</h4>
                <span>${product.address }</span>
                </a>
              </div>
              <!-- ==== 매너온도 START ==== -->
			  <div class="my-2" style="width: 40%;">
				<span>매너온도</span>
				<!-- 얼굴아이콘 시작 -->
				<c:choose>
				<c:when test="${seller.score le '20' }">
				<img class="d-inline float-right" src="${pageContext.request.contextPath}/resources/img/score/face20.PNG" style="width: 20%;"/>
				</c:when>
				<c:when test="${seller.score le '32' }">
				<img class="d-inline float-right" src="${pageContext.request.contextPath}/resources/img/score/face32.PNG" style="width: 20%;"/>
				</c:when>
				<c:when test="${seller.score le '36.5' }">
				<img class="d-inline float-right" src="${pageContext.request.contextPath}/resources/img/score/face36.5.PNG" style="width: 20%;"/>
				</c:when>
				<c:when test="${seller.score le '40' }">
				<img class="d-inline float-right" src="${pageContext.request.contextPath}/resources/img/score/face40.PNG" style="width: 20%;"/>
				</c:when>
				<c:when test="${seller.score le '50' }">
				<img class="d-inline float-right" src="${pageContext.request.contextPath}/resources/img/score/face50.PNG" style="width: 20%;"/>
				</c:when>
				<c:otherwise>
				<img class="d-inline float-right" src="${pageContext.request.contextPath}/resources/img/score/face60.PNG" style="width: 20%;"/>
				</c:otherwise>
				</c:choose>
				<!-- 얼굴아이콘 끝 -->
				<span class="float-right">
				<strong style="color: 
				<c:choose>
				<c:when test="${seller.score le '20' }">#072038</c:when>
				<c:when test="${seller.score le '32' }">#0D3A65</c:when>
				<c:when test="${seller.score le '36.5' }">#186EC0</c:when>
				<c:when test="${seller.score le '40' }">#37B24D</c:when>
				<c:when test="${seller.score le '50' }">#FFAD13</c:when>
				<c:otherwise>#F76707</c:otherwise>
				</c:choose>        	
				;">${seller.score }℃ &nbsp;</strong></span>
				<!-- 온도bar 시작 -->
				<c:choose>
				<c:when test="${seller.score le '20' }">
				<img src="${pageContext.request.contextPath}/resources/img/score/bar20.png" />
				</c:when>
				<c:when test="${seller.score le '32' }">
				<img src="${pageContext.request.contextPath}/resources/img/score/bar32.png" />
				</c:when>
				<c:when test="${seller.score le '36.5' }">
				<img src="${pageContext.request.contextPath}/resources/img/score/bar36.5.png" />
				</c:when>
				<c:when test="${seller.score le '40' }">
				<img src="${pageContext.request.contextPath}/resources/img/score/bar40.png" />
				</c:when>
				<c:when test="${seller.score le '50' }">
				<img src="${pageContext.request.contextPath}/resources/img/score/bar50.png" />
				</c:when>
				<c:otherwise>
				<img src="${pageContext.request.contextPath}/resources/img/score/bar60.png" />
				</c:otherwise>
				</c:choose>
				<!-- 온도bar 끝 -->
			</div>
			<!-- ==== 매너온도 END ==== -->
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
            <h3>
            ${product.title }
            </h3>
            <span style="color: gray;">${product.category} · <c:if test="${product.pull }">끌올 &nbsp;</c:if>
                   										     <c:if test="${product.regDate != 0}">${p.regDate} days ago</c:if>
                   										     <c:if test="${product.regDate == 0}">today</c:if></span>
            <!-- kebab START -->
            <c:if test="${product.seller ne userId }">
			<div class="d-inline float-right" id="test">
			  <div class="dropdown">
			    <a data-toggle="dropdown"><i class="fa fa-ellipsis-v fa-2x waves-effect"></i></a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#reportModal">신고하기</a>
			    </div>
			  </div>
			</div>
			</c:if>
            <c:if test="${product.seller eq userId }">
			<div class="d-inline float-right" id="test">
			  <div class="dropdown">
			    <a data-toggle="dropdown"><i class="fa fa-ellipsis-v fa-2x waves-effect"></i></a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="javascript:void(0);" data-toggle="modal" data-target="#pullModal">끌어 올리기</a>
			      <a class="dropdown-item" 
			      	 href="${pageContext.request.contextPath }/product/updateProduct?pCode=${product.PCode}&categoryName=${product.category }">
			      	 수정
		      	  </a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">숨기기</a>
			      <a class="dropdown-item" href="javascript:deleteProduct('${product.PCode }');">삭제</a>
			    </div>
			  </div>
			</div>
			</c:if>
			<!-- kebab END -->
            <br/><br/>
            <h2 class="d-inline"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" />원</h2>&nbsp;&nbsp;
            <br/>
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
        <!-- 판매자의 다른상품 -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center">
                        <h2>${seller.nickname }님의 다른 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                    	<c:forEach items="${other }" var="p">
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath }/resources/img/product/product_1.png" alt="">
                            <div class="single_product_text">
                                <h4>${p.title }</h4>
                                <h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price}" />원</h3>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <!-- 비슷한 상품 -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="section_tittle text-center mt-3">
                        <h2>비슷한 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-between">
                <div class="col-lg-12">
                    <div class="best_product_slider owl-carousel">
                    	<c:forEach items="${similar }" var="p">
                        <div class="single_product_item">
                            <img src="${pageContext.request.contextPath }/resources/img/product/product_1.png" alt="">
                            <div class="single_product_text">
                                <h4>${p.title }</h4>
                                <h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price}" />원</h3>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product_list part end-->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<jsp:include page="/WEB-INF/views/product/pullModal.jsp"/>


<!-- ========== REPORT MODAL START ========== -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"><strong>게시글 신고</strong></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	   <div class="row text-center align-items-end">
	      <div class="mb-5 mb-lg-0" style="float:none; margin:0 auto;">
	        <div class="bg-white rounded-lg">
				<div class="p-4 text-left">
					<span><strong>'${product.title }'</strong></span><br/>
					<span><strong>게시글을 신고하는 이유를 선택해주세요.</strong></span>
					<hr/>
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="widgets_inner pb-0" id="productReport">
                                <ul class="list">
                   					<c:forEach items="${reasonReport }" var="r">
                                    <li>
                                        <a href="javascript:reportList(${r.reasonCode })">${r.reasonContent }</a>
                                        <span>></span>
                                    </li>
                                    </c:forEach>
                                </ul>
							</div>
						</aside>
					</div>
					<hr/><br/>
					<span><strong>혹시 '${seller.nickname }'을 신고하고 싶으신가요?</strong></span>
					<hr/>
					<div class="left_sidebar_area">
						<aside class="left_widgets p_filter_widgets">
							<div class="widgets_inner pb-0" id="userReport">
                                <ul class="list">
                                    <li>
                                        <a href="javascript:reportList(2)">사용자 신고하러 가기</a>
                                        <span>></span>
                                    </li>
                                </ul>
							</div>
						</aside>
					</div>
					<hr/>
				</div>
	        </div>
	      </div>
      	</div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- ========== REPORT MODAL END ========== -->




	
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

// 삭제
function deleteProduct(pCode)
{
	if(confirm("삭제할까요?"))
	{
		$.ajax
		({
			url: "${pageContext.request.contextPath}/product/" + pCode,
			method: "PUT",
			beforeSend: function(xhr)
			{
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        dataType: "json",
			success: function(map)
			{
				alert(map.msg);
				location.href = "${pageContext.request.contextPath}/product/productListView?userId=${userId}";									
			},
			error: function(xhr, status, err)
			{
				alert("상품 삭제에 실패했어요 💧");
				console.log(xhr, status, err);
			}
		});
	}
	else
		return false;
}

// 신고하기
function reportList(reasonCode)
{
	var $product = $("#productReport");
	
	$.ajax
	({
		url: "${pageContext.request.contextPath}/product/report/" + reasonCode,
        dataType: "json",
		success: function(list)
		{
			// 상품 신고
			if(reasonCode != 2)
			{
			 	$("#productReport").html("");
				var str = "";
		
				str += "<ul class='list'>";
		
				for(var i in list)
				{
					if(list[i].parentCode == reasonCode)
					{
						str += "<li>";
						
						if(list[i].leaf == 0)
						{
							str += "<a href='javascript:reportList(" + list[i].reasonCode + ")'>" + list[i].reasonContent + "</a>";
							str += "<span>></span>";
						}
						else
						{
							str += "<a href='javascript:reportProduct(" + list[i].reasonCode + ", ${product.PCode}, \"${userId}\")'>";
							str += list[i].reasonContent + "</a>";
						}
							
						str += "</li>";
					} 
				}
				
				str += "</ul>";
				$("#productReport").html(str); 
			}
			// 사용자 신고
			else
			{
		 		$("#userReport").html("");
				var str = "";
		
				str += "<ul class='list'>";
		
				for(var i in list)
				{
					if(list[i].parentCode == reasonCode)
					{
						str += "<li>";
						
						if(list[i].leaf == 0)
						{
							str += "<a href='javascript:reportList(" + list[i].reasonCode + ")'>" + list[i].reasonContent + "</a>";
							str += "<span>></span>";
						}
						else
						{
							str += "<a href='javascript:reportUser(" + list[i].reasonCode + ", \"${product.seller}\", \"${userId}\")'>";
							str += list[i].reasonContent + "</a>";
						}
							
						str += "</li>";
					}
				}
				
				str += "</ul>";
				$("#userReport").html(str); 
		
			}
		},
		error: function(xhr, status, err)
		{
			console.log("목록 불러오기 실패");
		}
	});
}
// 상품 게시글 신고
function reportProduct(reasonCode, pCode, userId)
{
	if(confirm("신고하시겠습니까?"))
	{
		$.ajax
		({
			url: "${pageContext.request.contextPath}/product/reportProduct",
			method: "POST",
			data:
			{
				reasonCode: reasonCode,
				pCode: pCode,
				reportId: userId
			},
	        dataType: "text",
			success: function(result)
			{
				alert(result);
				$("#reportModal").modal('hide');
			},
			error: function(xhr, status, err)
			{
				alert("신고에 실패했습니다.");
				console.log(xhr, status, err);
				$("#reportModal").modal('hide');
			}
		});
	}
}
// 사용자 신고
function reportUser(reasonCode, suspectId, userId)
{
	if(confirm("신고하시겠습니까?"))
	{
		$.ajax
		({
			url: "${pageContext.request.contextPath}/product/reportUser",
			method: "POST",
			data:
			{
				reasonCode: reasonCode,
				shooterId: suspectId,
				reportId: userId
			},
	        dataType: "text",
			success: function(result)
			{
				alert(result);
				$("#reportModal").modal('hide');
			},
			error: function(xhr, status, err)
			{
				alert("신고에 실패했습니다.");
				console.log(xhr, status, err);
				$("#reportModal").modal('hide');
			}
		});
	}
}
</script>
	
	