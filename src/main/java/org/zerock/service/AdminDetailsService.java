package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.zerock.domain.AdminVO;
import org.zerock.mapper.AdminMapper;

@Service
public class AdminDetailsService implements UserDetailsService {

    @Autowired
    private AdminMapper adminMapper; // MyBatis 또는 JPA 사용 가능

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AdminVO admin = adminMapper.findByAdminName(username);
        if (admin == null) {
            throw new UsernameNotFoundException("관리자를 찾을 수 없음");
        }

        return User.builder()
                .username(admin.getAdmin_name())
                .password(admin.getPassword())
                .roles(admin.getRole()) // 예: ADMIN
                .build();
    }
}