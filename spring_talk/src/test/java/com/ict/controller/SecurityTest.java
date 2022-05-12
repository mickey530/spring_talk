package com.ict.controller;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.talk.user.domain.AuthVO;
import com.talk.user.domain.UserVO;
import com.talk.user.mapper.AuthMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class SecurityTest {
	
	@Autowired
	private AuthMapper mapper;
	
	@Test
	public void testRead() {
		UserVO vo = mapper.getUserAuth("user_id1");
		log.info(vo);
		log.info("user_id1 : " +vo.toString());
		for(AuthVO a : vo.getAvos()){
			log.info("user_id1 permission : " +a.toString());
		}
	}
}