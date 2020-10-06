package com.kh.udon.common.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * 1. 텍스트 메세지 전용
 * 	  TextWebSocketHandler - handlerTextMessage
 * 2. 바이너리 메세지 전용
 * 	  BinaryWebSocketHandler - handleBinaryMessage
 *
 * 웹소켓 연결 시작하기 (jsp)
 * var webSocket = new WebSocket("ws://요청주소");
 *
 */
@RequestMapping("/websocket")
public class WebSocketHandler extends TextWebSocketHandler{
	
	 //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	//웹소켓이 연결되면 호출되는 함수
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.printf("%s 연결 됨\n", session.getId());
	}

	//클라이언트가 서버로 메세지를 전송했을 때 실행 되는 메소드
	// WebSocketSession session : 전송 주체 정보가 담긴 세션
    // TextMessage message : 전송 받은 메세지 정보
	@Override
	protected void handleTextMessage(WebSocketSession session, 
									 TextMessage message) throws Exception {
		
		System.out.printf("%s로부터 [%s] 받음\n", 
                			session.getId(), message.getPayload());
        session.sendMessage(new TextMessage("echo: " + message.getPayload()));
		
	}

	//클라이언트와의 연결을 끊었을 때 실행되는 메소드
	// 웹소켓이 연결이 종료 = 세션 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, 
									  CloseStatus status) throws Exception {
		System.out.printf("%s 연결 끊김\n", session.getId());
	}
		
}
