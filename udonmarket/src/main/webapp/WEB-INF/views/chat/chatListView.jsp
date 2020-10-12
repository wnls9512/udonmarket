<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- chat css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chat.css">

</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="userId"/>
</sec:authorize>

<!-- Modal -->
<div class="">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
  
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">채팅</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
  
  
		<div class="container py-2 px-4">
		
		  <div class="row rounded-lg overflow-hidden shadow">
		    <!-- Users box-->
		    <div class="col-5 px-0">
		      <div class="bg-white">
		
		        <div class="bg-gray px-4 py-2 bg-light">
		          <p class="h5 mb-0 py-1">채팅방</p>
		        </div>
		
		        <div class="messages-box">
		          <div class="list-group rounded-0">
		          	<c:if test="${not empty list }">
			          	<c:forEach items="${list }" var="r">
						    <a href="#" class="list-group-item list-group-item-action list-group-item-light rounded-0" name="chatRoom" >
						      <input type="hidden" name="roomCode" value=${r.roomCode } />
				              <div class="media"><img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
				                <div class="media-body ml-4">
				                  <div class="d-flex align-items-center justify-content-between mb-1">
				                    <h6 class="mb-0">${r.senderNickName}</h6><small class="small font-weight-bold"><fmt:formatDate value="${r.regDate }" pattern="yy/MM/dd"/></small>
				                  </div>
				                  <p class="font-italic text-muted mb-0 text-small">${r.title }</p>
				                </div>
				              </div>
				            </a>
			          	</c:forEach>
		          	</c:if>
		          </div>
		        </div>
		      </div>
		    </div>
		    <!-- Chat Box-->
		    <div class="col-7 px-0">
		      <div class="px-4 py-5 chat-box bg-white" id="chatBox">
		      
		        <span>채팅방을 선택해주세요.</span>
		
		      </div>
		
		      <!-- Typing area -->
		      <form action="#" class="bg-light">
		        <div class="input-group">
		          <input type="text" id="message" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light">
		          <div class="input-group-append">
		            <button id="sendBtn" type="button" class="btn btn-link">전송<i class="far fa-paper-plane"></i></button>
		          </div>
		        </div>
		      </form>
		
		    </div>
		  </div>
		</div>
    </div>
  </div>
</div>
<script>
$("[name=chatRoom]").click(function(){
	var $roomCode = $(this).find("[name=roomCode]").val();
	var $myId = "${userId}";
	$("#chatBox").empty();

	//선택된 채팅방 색깔 바꾸기
	$("[name=chatRoom]").attr('class', "list-group-item list-group-item-action list-group-item-light rounded-0");
	$(this).attr('class', "list-group-item list-group-item-action list-group-item-light rounded-0");

	//대화 내용 가져오기
	$.ajax({
		url : "${pageContext.request.contextPath}/chat/selectChatMsg",
		method : "POST",
		dataType : "json",
		data : {
				roomCode : $roomCode,
		},
		beforeSend : function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success : function(data){
			let msg = data.list;

			for(let i = 0; i<msg.length; i++){

				//내가 보낸 메세지
				if(msg[i].userId != $myId){

					let senderMsg = "<div class='media w-50 mb-3'><img src='https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg' alt='user' width='50' class='rounded-circle'>" +
							          "<div class='media-body ml-3'>" +
							            "<div class='bg-light rounded py-2 px-3 mb-2'>" +
							              "<p class='text-small mb-0 text-muted'>" + msg[i].chatContent + "</p>" +
							            "</div>" +
							            "<p class='small text-muted'> <fmt:formatDate value="${msg[i].regDate }" pattern='yy/MM/dd'/>" +"</p>" +
							          "</div>" +
							        "</div>";

					$("#chatBox").append(senderMsg);									
				}
				//상대방이 보낸 메세지
				else if (msg[i].userId == $myId){

					let recieverMsg = "<div class='media w-50 ml-auto mb-3'>" +
								          "<div class='media-body'>" +
								            "<div class='bg-primary rounded py-2 px-3 mb-2'>" +
								              "<p class='text-small mb-0 text-white'>" + msg[i].chatContent + "</p>" +
								            "</div>" +
								            "<p class='small text-muted'><fmt:formatDate value="${msg[i].regDate }" pattern='yy/MM/dd'/>" +"</p>" +
								          "</div>" +
								        "</div>";

					$("#chatBox").append(recieverMsg);		
				}
				
			} 
			
		},
		error : function(xhr, status, err){
			console.log("처리 실패", xhr, status, err);
			alert("대화 불러오기에 실패했어요 다시 시도해주세요 💦");
		}
		
	});
	
});

$("#sendBtn").click(function() {
	let $msg = $("#message").val();
	
	
});
</script>
</body>
</html>