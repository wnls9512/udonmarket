<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 상세보기" name="pageTitle"/>
</jsp:include>

<script>

$(function(){

	$("a[data-board-no]").click(function(){
		var bCode = $(this).attr("data-board-no");
		location.href = "${ pageContext.request.contextPath }/community/communityDetailView?bCode=" + bCode;
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
                            <h2>${ community.boardTitle }</h2>
                            <c:if test="${ community.categoryCode == 17 }">
								<h3>동네생활이야기</h3>
							</c:if>
							<c:if test="${ community.categoryCode == 18 }">
								<h3>우리동네질문</h3>
							</c:if>
							<c:if test="${ community.categoryCode == 19 }">
								<h3>분실/실종센터</h3>
							</c:if>
							<c:if test="${ community.categoryCode == 20 }">
								<h3>동네사건사고</h3>
							</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
    
    
    
   <!--================Blog Area =================-->
   <section class="blog_area single-post-area padding_top">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                     <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/blog/no_img.png" alt="">
                  </div>
                  <div class="blog_details">
							<c:if test="${ community.categoryCode == 17 }">
								<a class="genric-btn success-border medium">동네생활이야기</a>
							</c:if>
							<c:if test="${ community.categoryCode == 18 }">
								<a class="genric-btn success-border medium">우리동네질문</a>
							</c:if>
							<c:if test="${ community.categoryCode == 19 }">
								<a class="genric-btn success-border medium">분실/실종센터</a>
							</c:if>
							<c:if test="${ community.categoryCode == 20 }">
								<a class="genric-btn success-border medium">동네사건사고</a>
							</c:if>
                   	 <br/><br/>
                     <h2>
                     	${ community.boardTitle }
                     </h2>
                     <h6><fmt:formatDate value="${ community.regDate }"/></h6>
                     <br />
                     <p class="excert">
                        ${ community.boardContent }
                     </p>
                     <ul class="blog-info-link mt-3 mb-4">
                        <li><a href="#"><i class="fa fa-hashtag"></i> 강아지 </a></li>
                     </ul>
                     
                     <a href="#">
                     <div class="blog-author" style="width: 100%;/*  margin:0 auto; */ margin-top: 5px; /* background-color: white; */">
                  <div class="media align-items-center" >
                     <img src="${pageContext.request.contextPath}/resources/img/blog/author.png" alt="">
                     <div class="media-body">
                        
                           <h4>닉네임</h4>
                        
                        <p>서울시 강남구 논현동</p>
                     </div>
                  </div>
               </div>
               </a>
                  
                  </div>
               </div>
               <div class="navigation-top">
                  <div class="d-sm-flex justify-content-between text-center">
                     <p class="like-info"><span class="align-middle"><a href="#"><i class="far fa-heart"></i></a></span> 4명의 이웃이 이 게시글을 좋아합니다. </p>
                     <div class="col-sm-4 text-center my-2 my-sm-0">
                        <!-- <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p> -->
                     </div>
                     <a class="genric-btn primary-border small">신고하기</a>
                  </div>
                  <div class="navigation-area">
                     <div class="row">
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/post/preview.png" alt="">
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-left"></span>
                              </a>
                           </div>
                           <div class="detials">
                              <p>이전 게시글</p>
                              <a href="#">
                                 <h4>ㅎㅎ</h4>
                              </a>
                           </div>
                        </div>
                        <div
                           class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                           <div class="detials">
                              <p>다음 게시글</p>
                              <a href="#">
                                 <h4>ㅋㅋ</h4>
                              </a>
                           </div>
                           <div class="arrow">
                              <a href="#">
                                 <span class="lnr text-white ti-arrow-right"></span>
                              </a>
                           </div>
                           <div class="thumb">
                              <a href="#">
                                 <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/post/next.png" alt="">
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
               <div class="comments-area">
                  <h4>댓글 <span style="color: red">3</span></h4>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="${pageContext.request.contextPath}/resources/img/comment/comment_1.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                	댓글내용
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">닉네임</a>
                                    </h5>
                                    <p class="date"> 2020. 09. 24 </p>
                                      &nbsp;&nbsp; &nbsp;&nbsp;
                                    <a href="#">신고하기</a>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="${pageContext.request.contextPath}/resources/img/comment/comment_1.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                	댓글내용
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">닉네임</a>
                                    </h5>
                                    <p class="date"> 2020. 09. 24 </p>
                                      &nbsp;&nbsp; &nbsp;&nbsp;
                                    <a href="#">신고하기</a>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="${pageContext.request.contextPath}/resources/img/comment/comment_1.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                	댓글내용
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">닉네임</a>
                                    </h5>
                                    <p class="date"> 2020. 09. 24 </p>
                                      &nbsp;&nbsp; &nbsp;&nbsp;
                                    <a href="#">신고하기</a>
                                 </div>
                                 <div class="reply-btn">
                                    <a href="#" class="btn-reply text-uppercase">reply</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="comment-form">
                  <form class="form-contact comment_form" action="#" id="commentForm">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="5"
                                 placeholder="댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group mt-3">
                        <a href="#" class="btn_3 button-contactForm">등록</a>
                     </div>
                  </form>
               </div>
            </div>
            <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    		<a href="${ pageContext.request.contextPath }/community/communityForm">
                    		<form>
                                <button 
                                	class="genric-btn primary radius" style="width:100%"
                                    type="button">게시글 작성하기</button>
                            </form>
                            </a>
                            <br /> 	
                        <aside class="single_sidebar_widget search_widget">
                        	
                        
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='키워드를 검색해주세요'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1"
                                    type="submit">검색하기</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">카테고리</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>동네생활이야기</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>우리동네질문</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>분실/실종센터</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex">
                                        <p>동네사건사고</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">최근 게시글</h3>
                           
                           	<c:forEach var="c" items="${ list }"  begin="0" end="3" step="1">
								<div class="media post_item">
									<a data-board-no="${ c.BCode }">
									<img src="${pageContext.request.contextPath}/resources/img/blog/no_img.png" alt="post" style="width: 42px; height: 42px">
									<div class="media-body">
										<h3 style="font-weight: bold;">${c.boardTitle}</h3>
									<p><fmt:formatDate value="${ c.regDate }" type="both"/></p>
									</a>
									</div>
								</div>
							</c:forEach>
                           	
                           
                        </aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">태그</h4>
                            <ul class="list">
                                <li>
                                    <a href="#">강아지</a>
                                </li>
                                <li>
                                    <a href="#">고양이</a>
                                </li>
                                <li>
                                    <a href="#">건강</a>
                                </li>
                                <li>
                                    <a href="#">동네맛집</a>
                                </li>
                                <li>
                                    <a href="#">동네카페</a>
                                </li>
                                <li>
                                    <a href="#">살림/청소/정리</a>
                                </li>
                                <li>
                                    <a href="#">식물</a>
                                </li>
                                <li>
                                    <a href="#">임신/출산/육아</a>
                                </li>
                                <li>
                                    <a href="#">집꾸미기</a>
                                </li>
                            </ul>
                        </aside>

                    </div>
                </div>
         </div>
      </div>
   </section>
   <!--================Blog Area end =================-->




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	