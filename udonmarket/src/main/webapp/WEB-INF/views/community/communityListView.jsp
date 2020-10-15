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

<script>
$(function(){
	$("a[data-board-no]").click(function(){
		var bCode = $(this).attr("data-board-no");
		location.href = "${ pageContext.request.contextPath }/community/communityDetailView?userId=${userId}&bCode=" + bCode;
	});
	
});
$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/community/communityListView?userId=${userId}";
		url = url + "&searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});	
$(function(){
	$("a[data-category-code]").click(function(){
		var categoryCode = $(this).attr("data-category-code");
		location.href = "${ pageContext.request.contextPath }/community/communityListView?userId=${userId}&categoryCode=" + categoryCode;
	});
	
});
</script>

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>동네생활</h2>
                            
							<%-- <h3>${ userId }</h3> --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->






    <!--================Blog Area =================-->
    <section class="blog_area padding_top">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                    
<%--   <table id="tbl-board" class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${ list }" var="c">
		<tr>
			<td>${ c.bCode }</td>
			<td>${ c.boardTitle }</td>
			<td>${ c.userId }</td>
			<td><fmt:formatDate value="${ c.regDate }" type="both"/></td>
	
		</tr>
		</c:forEach>
	</table>
              --%> 
                    <c:forEach items="${ list }" var="c">
                    	
                    	<c:if test="${ c.categoryCode == 17 || c.categoryCode == 18 || c.categoryCode == 19 || c.categoryCode == 20}">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="${pageContext.request.contextPath}/resources/img/blog/no_img.png" alt="">
                                <a href="#" class="blog_item_date">
                                    <h3></h3>
                                    <p><fmt:formatDate value="${ c.regDate }" type="both"/></p>
                                </a>
                            </div>

                            <div class="blog_details">
                            
                            <%-- <c:if test="${ c.categoryCode == 22 }">
								<a class="genric-btn success-border medium" style="border-color: red; font-weight: bold;">공지사항</a>
							</c:if> --%>
							
                            <c:if test="${ c.categoryCode == 17 }">
								<a class="genric-btn success-border medium">동네생활이야기</a>
							</c:if>
							<c:if test="${ c.categoryCode == 18 }">
								<a class="genric-btn success-border medium">우리동네질문</a>
							</c:if>
							<c:if test="${ c.categoryCode == 19 }">
								<a class="genric-btn success-border medium">분실/실종센터</a>
							</c:if>
							<c:if test="${ c.categoryCode == 20 }">
								<a class="genric-btn success-border medium">동네사건사고</a>
							</c:if>
                            	
                            	<br/><br/>
                                <a class="d-inline-block" data-board-no="${ c.BCode }" >
                                
                                	
                                    <h2>${ c.boardTitle }</h2>
                                    <hr />
                                	<p>${ c.boardContent }</p>
                                </a>
                                <ul class="blog-info-link">
                                
                                <c:if test="${ c.hashtagCode == 1 }">
                                    <li><i class="fa fa-hashtag"></i> 강아지 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 2 }">
                                    <li><i class="fa fa-hashtag"></i> 고양이 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 3 }">
                                    <li><i class="fa fa-hashtag"></i> 건강 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 4 }">
                                    <li><i class="fa fa-hashtag"></i> 동네맛집 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 5 }">
                                    <li><i class="fa fa-hashtag"></i> 동네카페 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 6 }">
                                    <li><i class="fa fa-hashtag"></i> 살림/청소/정리 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 7 }">
                                    <li><i class="fa fa-hashtag"></i> 식물 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 8 }">
                                    <li><i class="fa fa-hashtag"></i> 임신/출산/육아 </li>
                                </c:if>
                                <c:if test="${ c.hashtagCode == 9 }">
                                    <li><i class="fa fa-hashtag"></i> 집꾸미기 </li>
                                </c:if>
                                <span class="align-middle"><%-- <i class="far fa-comments"></i> ${ c.replyCount } &nbsp; --%> <i class="far fa-heart"></i></span> ${ c.likeThis }
                                
                                
                               <br /><br />
                               <div style="color: gray;">${ c.address }</div> 
                               
                               <div style="float: right; color: #ff3368; font-weight: bold; font-size: 12px">by ${ c.nickname }</div>
                                
                                    <!-- <li><a href="#"><i class="far fa-comments"></i> 03 Comments</a></li> -->
                                </ul>
                            </div>
                        </article>
						</c:if>
                       </c:forEach>
                       

						<!-- 페이징 바  -->
                        <!-- <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav> -->
                        
                        
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    		<a href="${ pageContext.request.contextPath }/community/communityForm?userId=test">
                    		<form>
                                <button 
                                	class="genric-btn primary radius" style="width:100%"
                                    type="button">게시글 작성하기</button>
                            </form>
                            </a>
                            <br /> 	
                        <aside class="single_sidebar_widget search_widget">
                        	
                        
                            
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                    <select class="form-control form-control-sm" name="searchType" id="searchType">

										<option value="board_title">제목</option>
					
										<option value="board_content">본문</option>
										
									</select>
                                        <input type="text" class="form-control" placeholder='키워드 검색'
                                            id="keyword"
                                            name="keyword">
                                        <div class="input-group-append">
                                            <button class="btn" type="button" name="btnSearch" id="btnSearch"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!-- <button class="button rounded-0 primary-bg text-white w-100 btn_1"
                                   name="btnSearch" id="btnSearch">검색하기</button> -->
                            
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">카테고리</h4>
                            <ul class="list cat-list">
                    			<!-- <li>
                                    <a data-category-code="22" class="d-flex" style="">
                                        <p>공지사항</p>
                                    </a>
                                </li> -->
                                <li>
                                    <a data-category-code="17" class="d-flex">
                                        <p>동네생활이야기</p>
                                    </a>
                                </li>
                                <li>
                                    <a data-category-code="18" class="d-flex">
                                        <p>우리동네질문</p>
                                    </a>
                                </li>
                                <li>
                                    <a data-category-code="19" class="d-flex">
                                        <p>분실/실종센터</p>
                                    </a>
                                </li>
                                <li>
                                    <a data-category-code="20" class="d-flex">
                                        <p>동네사건사고</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">태그</h4>
                            <ul class="list">
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=1">강아지</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=2">고양이</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=3">건강</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=4">동네맛집</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=5">동네카페</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=6">살림/청소/정리</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=7">식물</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=8">임신/출산/육아</a>
                                </li>
                                <li>
                                    <a href="communityListView?userId=${userId}&hashtagCode=9">집꾸미기</a>
                                </li>
                            </ul>
                        </aside>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->














<jsp:include page="/WEB-INF/views/common/footer.jsp"/>