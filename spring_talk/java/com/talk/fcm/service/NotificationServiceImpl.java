package com.talk.fcm.service;

import java.io.FileInputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.google.firebase.messaging.SendResponse;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushNotification;

import lombok.extern.slf4j.Slf4j;

@Service
@Repository
@PropertySource("classpath:fcm_data.properties")
public class NotificationServiceImpl implements NotificationService{

	 @Value("${fcm.key.path}")
	 private String FCM_PRIVATE_KEY_PATH;

	 @Value("${fcm.key.scope}")
	 private String fireBaseScope;

	@Override
    public void init(String firebaseKey, String firebaseDatabaseUrl, String rootPath) {
		try{
			FileInputStream serviceAccount = new FileInputStream(rootPath+"/fcm/"+firebaseKey);

			FirebaseOptions.Builder builder = FirebaseOptions.builder();
			FirebaseOptions options = builder
					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.setDatabaseUrl(firebaseDatabaseUrl)
					.build();

			FirebaseApp.initializeApp(options);
		}catch(Exception e) {
			System.out.println("[( "+ e.getClass().getSimpleName()+" )][#EXCEPTION( {"+e.getMessage()+"} )] {}");
		}
    }

	@Override
	public void sendByTokenList(List<String> tokenList) {
		sendByTokenList(tokenList,"푸싱","푸싱이 잘가네요...");
    }


	@Override
	public void sendByTokenList(List<String> tokenList,String title, String body) {
		
		WebpushConfig a = WebpushConfig.builder().setNotification(
					new WebpushNotification(title, body,"url 경로")
				).build();
		
        List<Message> messages = tokenList.stream().map(token -> Message.builder()
                .putData("time", LocalDateTime.now().toString())
                .setWebpushConfig(a)
                .setToken(token)
                .build()).collect(Collectors.toList()); 

        // 요청에 대한 응답을 받을 response
        BatchResponse response;
        try {

            // 알림 발송
            response = FirebaseMessaging.getInstance().sendAll(messages);

            // 요청에 대한 응답 처리
            if (response.getFailureCount() > 0) {
                List<SendResponse> responses = response.getResponses();
                List<String> failedTokens = new ArrayList<>();

                for (int i = 0; i < responses.size(); i++) {
                    if (!responses.get(i).isSuccessful()) {
                        failedTokens.add(tokenList.get(i));
                    }
                }
                System.out.println("List of tokens are not valid FCM token : " + failedTokens);
            }
        } catch (FirebaseMessagingException e) {
        	System.out.println("cannot send to memberList push message. error info : {"+e.getMessage()+"}");
        }
    }
	

}
