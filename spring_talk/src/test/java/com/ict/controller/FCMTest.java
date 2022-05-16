package com.ict.controller;

import java.net.URL;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.talk.fcm.service.NotificationService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration 
@Log4j
@PropertySource("classpath:fcm_data.properties")
public class FCMTest {

	
	@Test
	public void testRead() {
		String json = "spring-talk-86162-firebase-adminsdk-wzlpy-3f52da1d55.json";

		String FCM_PRIVATE_KEY_PATH="asf";

		  String fireBaseScope="sadf";
//		URL url= getClass().getResource("/file/" + json);

		log.info("testRead : ");
		
		log.info("FCM_PRIVATE_KEY_PATH : "+FCM_PRIVATE_KEY_PATH);
		
		log.info("fireBaseScope : "+fireBaseScope);

	}
}