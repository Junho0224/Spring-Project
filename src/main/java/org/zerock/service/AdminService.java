package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.zerock.domain.AdminVO;
import org.zerock.mapper.AdminMapper;

public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	public void registerAdmin(AdminVO admin) {
	    String encodedPassword = passwordEncoder.encode(admin.getPassword());
	    admin.setPassword(encodedPassword);
	    adminMapper.insert(admin);
	}
}
