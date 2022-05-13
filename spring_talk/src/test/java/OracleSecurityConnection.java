

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class OracleSecurityConnection {
	@Autowired
	private PasswordEncoder pwEncode;
	
	@Autowired
	private DataSource ds;
	
	
	
	@Test
	public void test () {
		String sql = "UPDATE user_info set user_pw=?";
		try {
			Connection con = ds.getConnection();
			
			PreparedStatement p =  con.prepareStatement(sql);
			

			p.setString(1, pwEncode.encode("1234"));
			p.executeUpdate();
			
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("SELECT * FROM user_info");
			ResultSetMetaData rsmd = rs.getMetaData();
			
			while(rs.next()) {
				
				log.info("users getFetchSize  : " + rsmd.getColumnCount());;
				
				for(int index = 1 ; index < rsmd.getColumnCount(); index++) {

					log.info("object "+ index +" : " + rs.getObject(index));;
				}
			}
			
			s = con.createStatement();
			rs = s.executeQuery("SELECT * FROM user_auth");
			rsmd = rs.getMetaData();
			
			while(rs.next()) {
				
				log.info("users getFetchSize  : " + rsmd.getColumnCount());;
				
				for(int index = 1 ; index <= rsmd.getColumnCount(); index++) {

					log.info("object "+ index +" : " + rs.getObject(index));;
				}
			}
			
		}catch(Exception e) {
			log.info("exception : " + e);
		}
	}
	
}
