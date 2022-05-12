import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class OjdbcConnectionTest {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
        try(Connection con = DriverManager.getConnection(
                    "jdbc:log4jdbc:oracle:thin:@localhost:1521/XEPDB1",
                    "springprj",
                    "springprj"
                )){

            PreparedStatement prps= con.prepareStatement("select * from user_info");

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
}
