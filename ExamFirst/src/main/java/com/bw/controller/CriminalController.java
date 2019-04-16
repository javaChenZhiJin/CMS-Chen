package com.bw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.entity.Criminal;
import com.bw.service.CriminalService;
import com.bw.utils.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class CriminalController {
        @Autowired
        private CriminalService service;
        
        
        @RequestMapping("list")
        public String getList(@RequestParam(defaultValue="")String cname,@RequestParam(defaultValue="1")Integer cpage,HttpServletRequest request){
        	PageHelper.startPage(cpage, 2);
        	List list = service.getList(cname);
        	PageInfo info = new PageInfo(list);
        	PageUtils page = new PageUtils(cpage, (int) info.getTotal(), 2, "list?cname="+cname, request);
        	request.setAttribute("list", info.getList());
        	request.setAttribute("cname", cname);
        	return "list";
        }
        
        
        
        @RequestMapping("SaveRole")
        @ResponseBody
        public Boolean SaveRole(Criminal c){
        	try {
				service.saveRole(c);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
        }
        
        
        
        @RequestMapping("getOne")
        @ResponseBody
        public Object getOne(int cid){
			Criminal c = service.getOne(cid);
			return c;
        }
        
        
        
        @RequestMapping("updateRole")
        @ResponseBody
        public Boolean updateRole(Criminal c){
        	try {
				service.updateRole(c);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
        }
        
        
        
        
        @RequestMapping("delRole")
        @ResponseBody
        public Boolean delRole(int  cid){
        	try {
				service.delRole(cid);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
        }
}