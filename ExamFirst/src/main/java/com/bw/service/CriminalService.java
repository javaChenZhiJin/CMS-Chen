package com.bw.service;

import java.util.List;

import com.bw.entity.Criminal;

public interface CriminalService {

	List getList(String cname);

	void saveRole(Criminal c);

	Criminal getOne(int cid);

	void updateRole(Criminal c);

	void delRole(int cid);

}