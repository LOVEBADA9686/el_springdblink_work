package com.spring.dept.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dept.dao.DeptMapper;
import com.spring.dept.vo.DeptVO;

@Service
@Transactional
public class DeptServiceImpl implements DeptService {
	private Logger logger = Logger.getLogger(DeptServiceImpl.class);

	@Autowired
	private DeptMapper deptMapper;
		
	@Override
	public List<DeptVO> listDepartment(DeptVO param) {
		// TODO Auto-generated method stub
		logger.info("DeptServiceImpl listDepartment >>> : ");
		logger.info("DeptServiceImpl listDepartment param >>> : " + param);
		
		List<DeptVO> list = new ArrayList<DeptVO>();
		list = deptMapper.listDepartment(param);
		logger.info("DeptServiceImpl listDepartment list >>> : " + list);
		
		return list;
	}

	@Override
	public DeptVO selectDepartment(String deptid) {
		// TODO Auto-generated method stub
		return deptMapper.selectDepartment(deptid);
	}

	@Override
	public int insertDepartment(DeptVO param) {
		// TODO Auto-generated method stub
		return deptMapper.insertDepartment(param);
	}

	@Override
	public int updateDepartment(DeptVO param) {
		// TODO Auto-generated method stub
		return deptMapper.updateDepartment(param);
	}

	@Override
	public int deleteDepartment(DeptVO param) {
		// TODO Auto-generated method stub
		return deptMapper.deleteDepartment(param);
	}

}
