package org.zerock.security;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	public UserDetailsService userDetailsService(DataSource dataSource) {
	    JdbcUserDetailsManager manager = new JdbcUserDetailsManager(dataSource);
	    manager.setUsersByUsernameQuery(
	        "SELECT username, password, enabled FROM admin WHERE username = ?"
	    );
	    manager.setAuthoritiesByUsernameQuery(
	        "SELECT username, role FROM admin_auth WHERE username = ?"
	    );
	    return manager;
	}
}
