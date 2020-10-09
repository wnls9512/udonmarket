<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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

$(document).on('click', '#btnSearch', function(e){

		e.preventDefault();

		var url = "${pageContext.request.contextPath}/community/communityListView";

		url = url + "?searchType=" + $('#searchType').val();

		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;

		console.log(url);

	});	


$(".replyWriteBtn").on("click", function(){
  var formObj = $("form[name='replyForm']");
  formObj.attr("action", "/saveReply");
  formObj.submit();
});

// 삭제
function deleteProduct(bCode)
{
	if(confirm("삭제할까요?"))
	{
		$.ajax
		({
			url: "${pageContext.request.contextPath}/community/" + bCode,
			method: "PUT",
			beforeSend: function(xhr)
			{
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        dataType: "json",
			success: function(map)
			{
				alert(map.msg);
				location.href = "${pageContext.request.contextPath}/community/communityListView";									
			},
			error: function(xhr, status, err)
			{
				alert("게시글 삭제에 실패했어요 💧");
				console.log(xhr, status, err);
			}
		});
	}
	else
		return false;
}


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
                  
                  			<%-- <c:if test="${ community.categoryCode == 22 }">
								<a class="genric-btn success-border medium" style="border-color: red; font-weight: bold;">공지사항</a>
							</c:if> --%>
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
                       			<c:if test="${ community.hashtagCode == 1 }">
                                    <li><i class="fa fa-hashtag"></i> 강아지 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 2 }">
                                    <li><i class="fa fa-hashtag"></i> 고양이 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 3 }">
                                    <li><i class="fa fa-hashtag"></i> 건강 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 4 }">
                                    <li><i class="fa fa-hashtag"></i> 동네맛집 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 5 }">
                                    <li><i class="fa fa-hashtag"></i> 동네카페 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 6 }">
                                    <li><i class="fa fa-hashtag"></i> 살림/청소/정리 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 7 }">
                                    <li><i class="fa fa-hashtag"></i> 식물 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 8 }">
                                    <li><i class="fa fa-hashtag"></i> 임신/출산/육아 </li>
                                </c:if>
                                <c:if test="${ community.hashtagCode == 9 }">
                                    <li><i class="fa fa-hashtag"></i> 집꾸미기 </li>
                                </c:if>
                     </ul>
                     
                     <div style="float: right;">
	                     <a href="">수정</a>
	                     &nbsp;
	                     <a href="javascript:deleteProduct('${community.BCode }');">삭제</a>
                     </div>
                     <br /><br />
                     <a href="#">
                     <div class="blog-author" style="width: 100%;/*  margin:0 auto; */ margin-top: 5px; /* background-color: white; */">
                  <div class="media align-items-center" >
                     <img src="${pageContext.request.contextPath}/resources/img/blog/author.png" alt="">
                     <div class="media-body">
                        
                           <h4>${ community.userId }</h4>
                        
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
               
               <!-- 댓글 -->
               <%-- <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<form:form name="form" id="form" role="form" modelAttribute="reply" method="post">

				<form:hidden path="bCode" id="bCode"/>

				<div class="row">

					<div class="col-sm-10">

						<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></form:textarea>

					</div>

					<div class="col-sm-2">

						<form:input path="userId" class="form-control" id="userId" value="test"></form:input>

						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px"> 저 장 </button>

					</div>

				</div>

				</form:form>

			</div>

			

			

			

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">댓글</h6>

				<div id="replyList"></div>

			</div>  --%>

	<div class="comments-area">
                  <h4>댓글 <span style="color: red"></span></h4>
				<c:forEach items="${replyList}" var="r">
                  <div class="comment-list">
                     <div class="single-comment justify-content-between d-flex">
                        <div class="user justify-content-between d-flex">
                           <div class="thumb">
                              <img src="${pageContext.request.contextPath}/resources/img/comment/comment_1.png" alt="">
                           </div>
                           <div class="desc">
                              <p class="comment">
                                	${r.content}
                              </p>
                              <div class="d-flex justify-content-between">
                                 <div class="d-flex align-items-center">
                                    <h5>
                                       <a href="#">${r.userId}</a>
                                    </h5>
                                    <p class="date"> <fmt:formatDate value="${r.regDate}" pattern="yyyy-MM-dd" /> </p>
                                      &nbsp;&nbsp; &nbsp;&nbsp;
                                    <a href="#">신고하기</a>
                                 </div>
                                 
                              </div>
                           </div>
                        </div>
                        </div>
                     </div>
					</c:forEach>   
                  </div>
                  <div class="comment-form">
                  <form class="form-contact comment_form" id="replyForm" name="replyForm" method="post">
                     <div class="row">
                        <div class="col-12">
                           <div class="form-group">
                           <input type="hidden" id="bCode" name="bCode" value="${community.BCode}" />
                           <input type="hidden" id="userId" name="userId" value="test" />
                              <textarea class="form-control w-100" name="comment" id="comment" cols="30" rows="5"
                                 placeholder="댓글 작성 시 타인에 대한 배려와 책임을 담아주세요."></textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group mt-3">
                        <button type="button" class="replyWriteBtn">작성</button>
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
                                
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">카테고리</h4>
                            <ul class="list cat-list">
                                
                                <!-- <li>
                                    <a href="communityListView?categoryCode=22" class="d-flex">
                                        <p>공지사항</p>
                                    </a>
                                </li> -->
                                <li>
                                    <a href="communityListView?categoryCode=17" class="d-flex">
                                        <p>동네생활이야기</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="communityListView?categoryCode=18" class="d-flex">
                                        <p>우리동네질문</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="communityListView?categoryCode=19" class="d-flex">
                                        <p>분실/실종센터</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="communityListView?categoryCode=20" class="d-flex">
                                        <p>동네사건사고</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>

                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">최근 게시글</h3>
                           
                           	<c:forEach var="c" items="${ list }"  begin="0" end="3" step="1">
                           		<c:if test="${ c.categoryCode == 17 || c.categoryCode == 18 || c.categoryCode == 19 || c.categoryCode == 20}">
								<div class="media post_item">
									<a data-board-no="${ c.BCode }">
									<img src="${pageContext.request.contextPath}/resources/img/blog/no_img.png" alt="post" style="width: 42px; height: 42px">
									<div class="media-body">
										<h3 style="font-weight: bold;">${c.boardTitle}</h3>
									<p><fmt:formatDate value="${ c.regDate }" type="both"/></p>
									</a>
									</div>
								</div>
								</c:if>
							</c:forEach>
                           	
                           
                        </aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">태그</h4>
                            <ul class="list">
                                <li>
                                    <a href="communityListView?hashtagCode=1">강아지</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=2">고양이</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=3">건강</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=4">동네맛집</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=5">동네카페</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=6">살림/청소/정리</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=7">식물</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=8">임신/출산/육아</a>
                                </li>
                                <li>
                                    <a href="communityListView?hashtagCode=9">집꾸미기</a>
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
	
	
	
	