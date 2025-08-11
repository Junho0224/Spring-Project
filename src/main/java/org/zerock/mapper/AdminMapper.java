package org.zerock.mapper;

import org.zerock.domain.AdminVO;

public interface AdminMapper {
    AdminVO findByAdminName(String username);
    public void insert(AdminVO admin);
}
