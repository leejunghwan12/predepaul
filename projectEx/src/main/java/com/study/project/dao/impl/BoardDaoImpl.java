package com.study.project.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.study.project.dao.BoardDao;


@Repository("dao")
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.list", map);
	}


	@Override
	public int add(Map<String, Object> map) {

		
		return sqlSession.insert("mapper.insert", map);
		
		
	}


	@Override
	public Map<String, Object> getDetail(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.detail", map);
	}


	@Override
	public int update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.update", map);
	}


	@Override
	public int updatereviewcnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.updatereviewcnt", map);
	}


	@Override
	public void selectDelete(ArrayList<Integer> deleteArray) {

		for (int i = 0; i < deleteArray.size(); i++) {
			int seq = deleteArray.get(i);
			sqlSession.delete("mapper.selectdelete", seq);
		}
		
	}


	@Override
	public List<Map<String, Object>> search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.search", map);
	}


	@Override
	public int count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.total", map);
	}


	@Override
	public int regImg(MultipartFile mf) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.regImg", mf);
		
	}


	@Override
	public List<Map<String, Object>> getDetail2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.detail2", map);
		
	}








	
}
