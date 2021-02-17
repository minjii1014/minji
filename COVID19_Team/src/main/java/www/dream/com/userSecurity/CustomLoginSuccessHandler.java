package www.dream.com.userSecurity;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	/**
	 * 권한에 따라 이동하는 페이지 설정
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/post/listPost?boardId=2");
		} else if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/post/listPost?boardId=3");
		} else {
			response.sendRedirect("/post/listPost?boardId=1");
		}
		
		/*
		 * if(roleNames.contains("ROLE_ADMIN")) {
		 * 
		 * response.sendRedirect("/admin"); return; }
		 * 
		 * if(roleNames.contains("ROLE_MEMBER")) { response.sendRedirect("/member");
		 * return; } response.sendRedirect("/");
		 */
		
	}

}
