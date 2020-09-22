<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<!-- kakao map api&library -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a40619c082a3c1c995f8bec611d38389&libraries=services,clusterer,drawing"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>

<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/mypage.css">
<style>
a{text-decoration: none; color: black;}
html { font-size: 16px; }
.slidecontainer {width: 100%;}

.slider {
  -webkit-appearance: none;
  width: 100%;
  height: 15px;
  border-radius: 5px;
  background: #d3d3d3;
  outline: none;
  opacity: 0.7;
  -webkit-transition: .2s;
  transition: opacity .2s;
}

.slider:hover {
  opacity: 1;
}

.slider::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #4CAF50;
  cursor: pointer;
}

.slider::-moz-range-thumb {
  width: 25px;
  height: 25px;
  border-radius: 50%;
  background: #4CAF50;
  cursor: pointer;
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
	                       	<a href="#">
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
							<div><p>내 동네 설정하기</p></div>
							<div class="input-group">
							  <input type="text" class="form-control" 
							  		placeholder="동명(읍,명)으로 검색 (ex.서초동)" aria-label="Recipient's username" aria-describedby="basic-addon2">
							  <div class="input-group-append">
							    <button class="btn btn-outline-secondary" type="button">검색</button>
							  </div>
							</div>
							<br />
							<!-- map 지도 -->
							<div id="map" style="width:100%; height:350px;"></div>						
						</div>
						<br />
						<div>
							지역 범위 설정하기
							<div class="slidecontainer">
							  <input type="range" min="1" max="100" value="50" class="slider" id="myRange">
							</div>
						</div>
				        </nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>

<script>
 	//지도를 표시할 div 
	var mapContainer = document.getElementById('map'), 

	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 4 // 지도의 확대 레벨 
	}; 

	// 지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
		    
		    var lat = position.coords.latitude; // 위도
		    var lon = position.coords.longitude; // 경도
	
		    //console.log("경도:" + lon); 
		    //console.log("위도:" + lat);

			var address;
		    geocoder.coord2RegionCode(lon, lat, function(result, status){
			    
		    	if (status === kakao.maps.services.Status.OK) {
		        	address = result[0].address_name;
		       	}
		    console.log(address);
		       	
			var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			var message = '<div style="padding:5px; font-size: 12px;"> 현재 위치 : '+ address +' </div>'; // 인포윈도우에 표시될 내용입니다
		    
		    // 마커와 인포윈도우를 표시합니다
		    displayMarker(locPosition, message);		    
		    });
		    
		});
	
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	
		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		    message = 'geolocation을 사용할수 없습니다';
		    
		displayMarker(locPosition, message);
	}
	
	//지도에 마커와 인포윈도우를 표시하는 함수
	function displayMarker(locPosition, message) {
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({  
		    map: map, 
		    position: locPosition
		}); 
		
		var iwContent = message, // 인포윈도우에 표시할 내용
		    iwRemoveable = true;
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
	
		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);
		
		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);      
	}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	