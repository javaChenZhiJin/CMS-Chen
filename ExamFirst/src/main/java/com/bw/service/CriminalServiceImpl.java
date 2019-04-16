package com.bw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bw.entity.Criminal;
import com.bw.mapper.CriminalMapper;

@Service
@Transactional
public class CriminalServiceImpl implements CriminalService{
         @Autowired
         private CriminalMapper mapper;

		public List getList(String cname) {
			return mapper.getList(cname);
		}

		public void saveRole(Criminal c) {
			mapper.saveRole(c);
		}

		public Criminal getOne(int cid) {
			return mapper.getOne(cid);
		}

		public void updateRole(Criminal c) {
			mapper.updateRole(c);
		}

		public void delRole(int cid) {
			mapper.delRole(cid);
		}

		
}