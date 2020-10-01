<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="pageTitle"/>
</jsp:include>

<!-- mypage css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/signupform.css">

    <!--================Home Banner Area =================-->
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item">
                            <h2>회원가입</h2>
							<!-- <h3>서울 강남구 논현동</h3> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
    
   <div id="memberSignup-container" class="row py-5 px-4">
	    <div class="col-md-5 mx-auto">
	     <form id="memberSignupFrm" action="signupForm" method="post">
	        <!-- Profile widget -->
	        <div class="bg-white shadow rounded overflow-hidden">
	            <div class="px-4 pt-0 pb-4 cover">
	                <div class="media align-items-end profile-head" style="text-align: center">
	                    <div class="media-body mb-5 text-white">
	                        <h4 class="mt-0 mb-0" style="color:white;">회원가입</h4>
	                    </div>
	                </div>
	            </div>
	            <div class="px-4 py-3">
	                <div class="p-4 rounded shadow-sm bg-light">
				        <!-- Vertical Menu-->
				        <nav class="nav flex-column bg-white shadow-sm rounded p-3">
				        	<table class="mx-auto">
				        	<tr>
				        		<td>
					        		<div id="userId-container">
				        				<input type="text" name="userId" id="userId" class="nav-link px-4 rounded-pill" placeholder="아이디 입력" required style="width: 22rem;"/>
				        				<span class="guide ok">이 아이디는 사용 가능합니다.</span>		   
										<span class="guide error">이 아이디는 사용할 수 없습니다.</span>		   
										<input type="hidden" id="idValid" value="0" />
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="password" name="password" id="password_" class="nav-link px-4 rounded-pill" placeholder="비밀번호 입력" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="password" id="password2" class="nav-link px-4 rounded-pill" placeholder="비밀번호 확인" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="email" name="email" id="email" class="nav-link px-4 rounded-pill" placeholder="이메일 입력(abc@xyz.com)" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	<tr>
				        		<td>
				        			<div class="signup-container">
				        				<input type="text" name="nickName" id="nickName" class="nav-link px-4 rounded-pill" placeholder="별명 입력" required style="width: 22rem;"/>
				        			</div>
				        		</td>
				        	</tr>
				        	</table>
				        </nav>
				        <div>
				        	<input type="submit" value="회원가입" class="nav-link-submit-reset px-4 rounded-pill">
							<input type="reset" value="취소" class="nav-link-submit-reset px-4 rounded-pill">
						</div>
	                </div>
	            </div>
	        </div>
	    </form>
	    </div>
	</div>
<script>
$("#userId").keyup(function(){

	//중복 검사후 아이디 재작성하는 경우
	if(/^\w{4,}$/.test($(this).val()) == false){
		$(".guide").hide();
		$("#idValid").val(0);
		return;
	}

	$.ajax({
		url : "${ pageContext.request.contextPath }/member/checkIdDuplicate",
		data : {
			userId : $(this).val()
		},
		dataType : "json",
		success : function(data){
			console.log(data);

			if(data.isUsable == true){
				$(".guide.error").hide();
				$(".guide.ok").show();
				$("#idValid").val(1);
			}
			else {
				$(".guide.error").show();
				$(".guide.ok").hide();
				$("#idValid").val(0);
			}
		},
		error : function(xhr, status, err){
			console.log("처리실패", xhr, status, err);
		}
	});

	
});
	
$("#password2").blur(function(){
	var $p1 = $("#password_"), $p2 = $("#password2");
	if($p1.val() != $p2.val()){
		alert("패스워드가 일치하지 않습니다.");
		$p1.focus();
	}
});

$("#memberSignupFrm").submit(function(){

	//html5 추가된 속성 pattern을 활용해 정규식 검사도 가능하지만,
	//구체적인 피드백제공하지는 못한다.
	var $userId = $("#userId");
	if(/^\w{4,}$/.test($userId.val()) == false){
		alert("아이디는 최소 4자리이상이어야 합니다.");
		$memberId.focus();
		return false;
	}

	//중복검사여부
	var $idValid = $("#idValid");
	if($idValid.val() == 0){
		alert("아이디 중복검사 해주세요.");
		return false;
	} 
	return true;
});
</script>
   








<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	
	
	