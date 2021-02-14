package www.dream.com.userSecurity;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml",
		"file:src\\main\\webapp\\WEB-INF\\spring\\security-context.xml" })
public class MemberTests {
	@Autowired
	private PasswordEncoder pwencoder;

	@Autowired
	private DataSource ds;

	@Test
	public void testInsertMember() {
		String sql = "insert into  T_Users(party_id, user_num, email, user_id, PASSWORD) values (?,?,?,?,?)";

		for (int i = 0; i < 100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(5, pwencoder.encode("pw" + i));

				if (i < 80) {
					pstmt.setLong(1, 2);
					pstmt.setLong(2, i);
					pstmt.setString(3, i + "@naver.com");
					pstmt.setString(4, "user" + i);
				} else {
					pstmt.setLong(1, 3);
					pstmt.setLong(2, i);
					pstmt.setString(3, i + "@naver.com");
					pstmt.setString(4, "관리자" + i);
				}
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
						}
					}
				}
			}
		}
	}
	
	
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into T_AUTHORITIES (USER_ID, AUTH) values (?,?)";
		
		for(int i = 0; i < 100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i < 80) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				}else {
					pstmt.setString(1, "관리자" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				pstmt.executeUpdate();
						
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (Exception e) {
					}
					if (con != null) {
						try {
							con.close();
						} catch (Exception e) {
						}
					}
				}
				
			}
			
		}
	}
}
