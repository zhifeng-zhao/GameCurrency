package com.njwb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwb.mapper.ProvinceMapper;
import com.njwb.pojo.Province;
import com.njwb.service.ProvinceService;

@Service("provinceService")
public class ProvinceServiceImpl implements ProvinceService{
	@Autowired
	ProvinceMapper provinceMapper;
	public List<Province> selectAllProv() {
		return provinceMapper.selectAllProv();
	}

}
