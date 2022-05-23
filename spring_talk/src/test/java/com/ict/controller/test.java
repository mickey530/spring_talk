package com.ict.controller;

import static org.junit.Assert.fail;

import java.lang.ProcessHandle.Info;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.talk.file.domain.ImageFileVO;
import com.talk.file.mapper.ImageFileMapper;
import com.talk.file.service.FileService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class test {

	@Autowired
	FileService fService;

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
//	@Test
    public void testConnection() {
        try(Connection con = DriverManager.getConnection(
                    "jdbc:log4jdbc:oracle:thin:@localhost:1521/XEPDB1",
                    "springprj",
                    "springprj"
                )){

            PreparedStatement prps= con.prepareStatement("select * from reply");

            ResultSet sr =prps.executeQuery();

            while(sr.next()) {

                sr.getObject(1);
                sr.getObject(2);
                sr.getObject(3);
                sr.getObject(4);
                sr.getObject(5);
                sr.getObject(6);
                sr.getObject(7);

            }

            log.info(con);
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

	@Test
    public void testFile() {
		List<ImageFileVO> ifList = new ArrayList<ImageFileVO>();
		
		ImageFileVO ifVO = new ImageFileVO();

		ifVO.setFile_name("112");
		ifVO.setUpload_path("112");
		ifVO.setUuid("112");
		ifVO.setFile_type("IMG");
		ifVO.setPost_num(1);
		
		log.info(ifVO);
		System.out.println("VO : " + ifVO.toString());
		ifList.add(ifVO);
		

		fService.insert(ifList);
		fService.select(1);
		
	}
    
    
    
}