package com.spring.dept.service;

import java.util.List;

import com.spring.dept.vo.DeptVO;

public interface DeptService {
	public List<DeptVO> listDepartment(DeptVO param);
	public DeptVO selectDepartment(String deptid);
	public int insertDepartment(DeptVO param);
	public int updateDepartment(DeptVO param);
	public int deleteDepartment(DeptVO param);
}
