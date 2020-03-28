package com.njwb.service;

import java.util.List;

import com.njwb.pojo.Province;

public interface ProvinceService {
	/**
	 * 查询所有省份
	 * @return
	 */
	List<Province> selectAllProv();
}
