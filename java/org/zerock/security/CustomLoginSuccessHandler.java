package org.zerock.security;

/* 
   AuthenticationSuccessHandler 인터페이스 사용 구현 클래스
    = 로그인 성공시 자동 호출되어 사용자 권한에 따라 다른 URL로 리다이렉트
   Authentication 객체 = 인증정보 (사용자, 권한 포함)
 */ 
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		log.warn("Login Succ");
/* 권한 리스트 수집 */
		List<String> roleNames = new ArrayList<String>();
/* 핵심 API = Authentication.getAuthorities()로 권한 추출 */
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : " + roleNames);

/* 로그인 성공 후 권한에 따라 다른 URL로 리다이렉트 */
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/resident/list");
			return;
		}
		
		response.sendRedirect("/404");		
	}
}
