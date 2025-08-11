package org.zerock.security;
/* AuthenticationSuccessHandler 인터페이스 사용 구현 클래스
 	= 로그인 성공시 자동 호출되어 사용자 권한에 따라 다른 URL로 리다이렉트
 	
Authentication 객체 = 인증정보(사용자, 권한 포함)
*/

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.zerock.domain.AdminVO;
import org.zerock.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	AdminMapper adminMapper;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		log.info("auth => " + auth);
		
		
		// 1. 인증된 사용자 정보 꺼내기 (UserDetails)
        User user = (User) auth.getPrincipal();
        String username = user.getUsername();
        log.info("로그인한 사용자: " + username);

        // 2. DB에서 AdminVO 가져오기
        AdminVO admin = adminMapper.findByAdminName(username);
        log.info("DB에서 가져온 관리자: " + admin);

        // 3. 세션에 저장
        HttpSession session = request.getSession();
        session.setAttribute("loginAdmin", admin);

        // 4. 리다이렉트
        response.sendRedirect("/");
		
	}

}
