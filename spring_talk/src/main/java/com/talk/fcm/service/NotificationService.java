package com.talk.fcm.service;

import java.util.List;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.UserVO;

public interface NotificationService {
	public void init(String firebaseKey, String firebaseDatabaseUrl, String rootPath);
	public void sendByTokenList(List<String> tokenList);
	void sendByTokenList(List<String> tokenList, String title, String body);
}
