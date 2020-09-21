package com.kh.udon.common.handler;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

//알림 Socket
public class NotiHandler extends TextWebSocketHandler{

	Map<String, Object> userSessions = new HashMap<>();
	
	//Connection이 연결 되었을 때, 클라이언트가 서버에 접속했을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderId = getId(session);
		userSessions.put(senderId, session);
		
	}

	//메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderId = getId(session);
		
		//protocol: command, 알림발신자, 알림수신자, 게시판번호 
		//댓글 알림 일때 : (reply, user2, user1, boardNo)
		//키워드 알림 : (keyword, "" , user1, keyword 내용)
		//관심목록 알림 : (wish, "" , user1, productNo)
		//가격제안 알림 : (price, user2, user1, productNo)
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strArr = msg.split(","); 
			
			if(strArr != null && strArr.length == 4) {
				String cmd = strArr[0];
				String replyWriter = strArr[1];
				String boardWriter = strArr[2];
				String boardNo = strArr[3];
				
				//게시글작성자가 온라인일때
				WebSocketSession boardWriterSession 
						= (WebSocketSession) userSessions.get(boardWriter);
				
				//댓글알림일때
				if("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 " + boardNo + "번 게시글에 댓글을 달았습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
			
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
	}
	
	
	//로그인 중인 아이디 
	//(로그인되지 않은 아이디라면 userId, 로그인된 사용자라면 그 사용자의 sessionId를 구하기)
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();

/*		
		//Session에 저장된 현재 로그인 중인 아이디
		User loggedIn = (User)httpSession.get(userLoggedIn);
		//없으면 세션아이디 (로그인 안했을 때)
		if(loggedIn == null)
			return session.getId();
		//있으면 userId (로그인 했을 때)
		else
			return loggedIn.getUserId();
			
*/		
		return null;
	}
	
}
