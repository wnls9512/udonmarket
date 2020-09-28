<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>

<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<style>
a{text-decoration: none; color: black;}
html { font-size: 16px; }
.custom1 {
background-color: #fbf9ff;
border: 1px solid #f2f2f2;
border-radius: 20px;
text-align: center;
font-weight: bolder;
display: inline-block;
padding: 5px 10px;
margin: 5px 10px;
}
</style>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>마이페이지</h2>
							<!-- <h3>서울 강남구 논현동</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
    
    
    <div class="row py-5 px-4">
	    <div class="col-md-5 mx-auto">
	        <!-- Profile widget -->
	        <div class="bg-white shadow rounded overflow-hidden">
	            <div class="px-4 pt-0 pb-4 cover">
	                <div class="media align-items-end profile-head">
	                    <div class="profile mr-3"><img src="https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80" alt="..." width="130" class="rounded mb-2 img-thumbnail">
	                    	<a href="${pageContext.request.contextPath }/member/mypage" class="btn btn-outline-dark btn-sm btn-block">Mypage</a>
	                    </div>
	                    <div class="media-body mb-5 text-white">
	                        <h4 class="mt-0 mb-0" style="color:white;">Mark Williams</h4>
	                        <p class="small mb-4" style="color:white;"> <i class="fas fa-map-marker-alt mr-2"></i>New York</p>
	                    </div>
	                </div>
	            </div>
	            <div class="bg-light p-4 d-flex justify-content-end text-center">
	                <ul class="list-inline mb-0">
	                    <li class="list-inline-item">            
	                       <h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/salesList">
	                       		<i class="fas fa-receipt fa-2x" ></i> <br /> 판매목록
	                       	</a>
	                       </h6>
	                    </li>
	                    <li class="list-inline-item">
	                    	<h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/buyList">
	                       		<i class="fas fa-shopping-bag fa-2x" ></i> <br /> 구매목록
	                       	</a>
	                       </h6>
	                    </li>
	                    <li class="list-inline-item">
	                    	<h6 class="font-weight-bold mb-0 d-block">	                       	
	                       	<a href="${pageContext.request.contextPath }/member/wishList">
	                       		<i class="fas fa-heart fa-2x" ></i> <br /> 관심목록
	                       	</a>
	                       </h6>
	                    </li>
	                </ul>
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
						<div>
							<hr />
							<div style="text-align: center;">
								<button type="button" class="btn_3" data-toggle="modal" data-target="#exampleModalLong">
								  받은 거래 평가
								</button>
							</div>
							<hr />							  							
							<div>
							<table>
								<tbody>
								<c:if test="${ not empty evaList}">
									<c:forEach items="${evaList}" var="eva" begin="0" end="4" step="1">
									<c:if test="${ eva.kind eq true }">
										<tr>
											<td>
											<ul class="unordered-list">
												<li>
								                   <h4 style="display: inline-block;">${eva.count }명</h4>														
												</li>
									        </ul>
											</td>
											<td>
												<p class="custom1">${eva.content}</p>
											</td>
										</tr>
									</c:if>									
									</c:forEach>
								</c:if>
								<c:if test="${ empty evaList }">
									<tr><td>받은 매너 평가가 아직 없어요</td></tr>
								</c:if>
								</tbody>
							</table>
							</div>
							<hr />	
							<div style="text-align: center;">
								<button type="button" class="btn_3" data-toggle="modal" data-target="#exampleModalLong1" style="margin-bottom: 15px;">
								  받은 거래 후기 (${ totalReview})
								</button>
							</div>
							<div>
								<table class="table table-hover">
									<tbody>
									<c:if test="${ not empty reviewList}">
										<c:forEach items="${reviewList}" var="review" begin="0" end="4" step="1">
											<tr><td>
												<div class="row">
													<div class="col-md">
														<i class="far fa-user-circle fa-lg"></i>
														<h4 class="mb-20" style="display: inline-block;">${ review.sender }</h4> 
														<!-- <p style="display: inline-block; color: #575757;"> 수원시 영통구 망포동</p>	 -->	
														<p class="text-left"> ${ review.content } </p>
													</div>
												</div>
											</td></tr>
										</c:forEach>
									</c:if>
									<c:if test="${ empty reviewList}">
										<tr><td> 받은 거래 후기가 아직 없어요 </td></tr>
									</c:if>
									</tbody>
								</table>							
							</div>
						</div>
				        </nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

<!-- 받은 거래 평가 modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="modal-header">
        <!-- <h5 class="modal-title" id="exampleModalLongTitle">매너 상세</h5> -->
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        </div>
      	<div class="modal-body">
      		<!-- 받은 매너 칭찬 -->
      		<h4><i class="far fa-laugh-wink fa-2x"></i> 받은 매너 칭찬</h4>
      		<br />
      		<table>
				<tbody>
			        <c:if test="${ not empty evaList}">
					<c:forEach items="${evaList}" var="eva">
		      		<c:if test="${ eva.kind eq true }">
			        	<tr>
			        		<td><h4><i class="fas fa-user-friends"></i> ${eva.count }</h4></td>
			        		<td><p class="custom1">${eva.content}</p></td>       		
			        	</tr>
					</c:if>
					</c:forEach>
					</c:if>
					<c:if test="${ empty evaList }">
						<tr><td colspan="2">받은 매너 칭찬이 없어요</td></tr>
					</c:if>					
				</tbody>
	        </table>
	        <br />
	        <hr />
	        <br />
	        <!-- 받은 비매너 -->
      		<h4><i class="far fa-angry fa-2x"></i> 받은 비매너</h4>
      		<br />
      		<table>
			<tbody>
				<!-- 로그인 유저 == 평가받은 유저 (받은 비매너는 내꺼만 볼 수 있음) -->
				<%-- <c:if test="${ loginMember.userId eq evaList.get(0).getUserId()}"> --%>
		        <c:if test="${ not empty evaList}">
				<c:forEach items="${evaList}" var="eva">
		        <c:if test="${ eva.kind eq false }">
		        	<tr>
		        		<td><h4><i class="fas fa-user-friends"></i> ${eva.count }</h4></td>
		        		<td><p class="custom1">${eva.content}</p></td>       		
		        	</tr>
				</c:if>
				</c:forEach>
				</c:if>
				<c:if test="${ empty evaList }">
					<tr><td>받은 비매너가 없어요</td></tr>
				</c:if>			
				<%-- </c:if> --%>
				<%-- <c:if test="${ loginMember.userId ne evaList.get(0).getUserId()}">
					<tr><td>'받은 비매너'는 본인에게만 보여요</td></tr>
				</c:if> --%>
			</tbody>
	        </table>
      	</div>
	    <div class="modal-footer">
	        <button type="button" class="genric-btn primary radius" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>

<!-- 받은 거래  후기 modal -->
<div class="modal fade" id="exampleModalLong1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div>
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> -->
        </div>
      	<div class="modal-body">
      	    <nav>
			  <div class="nav nav-tabs" id="nav-tab" role="tablist">
			    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">전체 후기</a>
			    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">판매자 후기</a>
			    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">구매자 후기</a>
			  </div>
			</nav>
			
			<div class="tab-content" id="nav-tabContent">
			  <!-- 전체 후기 -->
			  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
				  <table class="table table-hover">
					<tbody>
					<c:if test="${ not empty reviewList}">
						<c:forEach items="${reviewList}" var="review">
							<tr><td>
								<div class="row">
									<div class="col-md">
										<i class="far fa-user-circle"></i>
										<h5 class="mb-20" style="display: inline-block;">${ review.sender }</h5> 
										<!-- <p style="display: inline-block; color: #575757;"> 수원시 영통구 망포동</p>	 -->	
										<br />
										<span class="text-left"> ${ review.content } </span>
									</div>
								</div>
							</td></tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty reviewList}">
						<tr><td> 받은 거래 후기가 아직 없어요 </td></tr>
					</c:if>
					</tbody>
				  </table>	
			  </div>
			  <!-- 판매자 후기 -->
			  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				...
			  </div>
			  <!-- 구매자 후기 -->
			  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
			  ...
			  </div>
			</div>
      	</div>
	    <div class="modal-footer">
	        <button type="button" class="genric-btn primary radius" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	