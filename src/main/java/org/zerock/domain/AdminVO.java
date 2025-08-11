package org.zerock.domain;

import lombok.Data;

@Data
public class AdminVO {
	private String username;
    private String password;
    private String enabled;
    private String admin_name;
    private String email;
    private String role;
    private int admin_id;
}