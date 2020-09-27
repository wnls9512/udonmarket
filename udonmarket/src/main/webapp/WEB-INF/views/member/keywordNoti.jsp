<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<!-- kakao map api&library -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a40619c082a3c1c995f8bec611d38389&libraries=services,clusterer,drawing"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>

<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<style>
a{text-decoration: none; color: black;}
html { font-size: 16px; }
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
							<div style="text-align: center; ">
								<h5 style="font-weight: bold;
									  		color: #575757;">키워드 알림 설정</h5> 		
							    <p id="myLocal" style=" color: #575757;"></p>
							</div>
							<hr />							  
							<div>
								 <h5 style="font-weight: bold;
									  		color: #575757;">키워드 알림</h5>
								 <p style="color: #575757;">키워드를 등록해두면, 해당 키워드와 관련된 판매글이 올라올때 푸시 알림을 받을 수 있어요.</p>
								 <a href="#" style="color: #007bff;">혹시 키워드 알림이 오지 않나요?</a>
							</div>
							<br />
							<form action="" class="insertKeyword">
								<div class="input-group mb-3">
								  <input type="text" 
								  		 name="keyword"
								  		 class="form-control" 
								  		 placeholder="키워드를 입력해주세요." 
								  		 aria-label="Recipient's username" 
								  		 aria-describedby="basic-addon2">
								  <!-- value = 로그인 중인 유저 아이디 -->
								  <input type="hidden" name="userId" value="" />
								  <div class="input-group-append">
							      <input type="button" 
							      		 id="btn-insert"
							    	     class="btn btn-outline-secondary" 
							    	     value="등록" />
								  </div>
								</div>
								<span class="guide error">이미 추가된 키워드예요 🤔 </span>
								<input type="hidden" id="idValid" value="0" />
							</form>
							<br />
							<p>등록된 키워드  <mark style="color: red; background: white;">${totalKeywordContents}</mark>/ 30</p>
							<div>
								<c:if test="${ not empty list }">
									<c:forEach items="${ list }" var="key">
										<h5 id="keywordList" style="display: inline-block;">
											<span class="btn btn-outline-primary btn-sm">${key.keyContent}
											<button type="button" 
													onclick="deleteKey('${ key.keyCode }')"
													style="background: none; border: none;">x</button>
											</span>
										</h5>							
									</c:forEach>
								</c:if>
								<c:if test="${ empty list }"></c:if>
							</div>
						</div>													
				        </nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
<script>
$(function(){
	$(".guide.error").hide();
	$("#idValid").val(0);
	$("#btn-insert").attr('disabled', true);

	//키워드 중복 검사
	$("[name=keyword]").keyup(function(){

	 	if($(this).val() == ''){
	 		$(".guide.error").hide();
			$("#idValid").val(0);
			$("#btn-insert").attr('disabled', true);
			return;
		} 
		
		$.ajax({
			url : "${pageContext.request.contextPath}/member/checkKeywordDuplicate",
			data : {
				userId : $("[name=userId]").val(),
				keyword : $("[name=keyword]").val()
			},
			dataType : "json",
			success : function(data){
				//console.log(data);

				if(data.isUsable == true){
					$(".guide.error").hide();
					$("#idValid").val(1);
					$("#btn-insert").attr('disabled', false);
				}
				else{
					$(".guide.error").show();
					$("#idValid").val(0);
					$("#btn-insert").attr('disabled', true);
				}
					
			},
			error : function(xhr, status, err){
				 console.log("처리 실패", xhr, status, err)
			}

		});
		
	});
	
});

function deleteKey(key){
	if(!confirm('정말 삭제할까요?')) return;
	location.href = "${ pageContext.request.contextPath }/member/deleteKeyword?key=" + key;
}

$("#btn-insert").click(function(){

	$(".insertKeyword").attr("action", "${ pageContext.request.contextPath }/member/insertKeyword")
	.attr("method", "POST")
	.submit();	
	
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
