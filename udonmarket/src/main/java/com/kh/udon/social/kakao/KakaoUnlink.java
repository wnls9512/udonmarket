package com.kh.udon.social.kakao;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class KakaoUnlink {
	
	public static JsonNode kakaoUserUnlink(JsonNode accessToken) {
		
		final String RequestUrl = "https://kapi.kakao.com/v1/user/unlink";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);
		
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			log.debug("\nSending 'POST' request to URL : " , RequestUrl);
			log.debug("Response Code : " , responseCode);

			// JSON 형태 변환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
		}
		
		return returnNode;
	}

}
