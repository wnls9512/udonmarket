<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${ param.pageTitle }</title>
    <link rel="icon" href="${pageContext.request.contextPath }/resources/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/lightslider.min.css">
    <!-- nice select CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slick.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/price_rangs.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
	<!-- jquery -->
	<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
	<!-- notification css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/notification.css">
    <script src="${pageContext.request.contextPath }/resources/js/notification.js"></script>
<script>
<%-- RedirectAttribute에 등록된 msg값 존재 여부 확인 후 출력 --%>
<c:if test="${not empty msg }">
	alert('${ msg }');
</c:if>
</script>

</head>

<body>
    <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="${pageContext.request.contextPath }"> <img src="${pageContext.request.contextPath }/resources/img/logo.jpg" alt="logo" style="width: 30%; margin-top: 8%;"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath }">HOME</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath }/product/productListView">중고거래</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath }/community/communityListView" id="navbarDropdown_1"
                                        role="button" aria-haspopup="true" aria-expanded="false">동네생활
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="/">동네생활이야기</a>
                                        <a class="dropdown-item" href="/">우리동네질문</a>
										<a class="dropdown-item" href="/">분실/실종센터</a>
										<a class="dropdown-item" href="/">동네사건사고</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex">
                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <a href="#" id="bell"><i class="ti-bell"></i></a>
                            <a href="${pageContext.request.contextPath }/chat/chatListView"><i class="ti-comments-smiley"></i></a>
                            <a href="${pageContext.request.contextPath }/member/mypage"><i class="ti-user"></i></a>
	                        <a href="${pageContext.request.contextPath }/member/loginForm"><i class="ti-power-off"></i></a>

                            
                            <c:if test="${empty loginMember }">
	                            <a href="${pageContext.request.contextPath }/member/loginForm"><i class="ti-power-off"></i></a>
                            </c:if>
                            <c:if test="${not empty loginMember }">
                            	<span>${ loginMember.userId}</span>님, 반갑습니다. 
                            	<a href="${pageContext.request.contextPath }/member/logout">로그아웃<i class="ti-power-off"></i></a>
                            </c:if>
                            

                        </div>
                        
                        <div class="notifications" id="box">
					        <h2>Notifications - <span>2</span></h2>
					        <div class="notifications-item"> <img src="https://i.imgur.com/uIgDDDd.jpg" alt="img">
					            <div class="text">
					                <h4>Samso aliao</h4>
					                <p>Samso Nagaro Like your home work</p>
					            </div>
					        </div>
					        <div class="notifications-item"> <img src="https://img.icons8.com/flat_round/64/000000/vote-badge.png" alt="img">
					            <div class="text">
					                <h4>John Silvester</h4>
					                <p>+20 vista badge earned</p>
					            </div>
					        </div>
					    </div>
                        
                        
                        
                    </nav>
                </div>
            </div>
        </div>
        <div class="search_input" id="search_input_box">
            <div class="container ">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>
    <!-- Header part end-->
    
