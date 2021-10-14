package com.study.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;


public interface BoardService {

	public List<Map<String, Object>> list(Map<String, Object> map);

	public int add(Map<String, Object> map);

	public Map<String, Object> getDetail(Map<String, Object> map);

	public int update(Map<String, Object> map);

	public int updatereviewcnt(Map<String, Object> map);

	public void selectDelete(ArrayList<Integer> deleteArray);

	List<Map<String, Object>> search(Map<String, Object> map);

	Map<String, Object> pagination(Map<String, Object> map);

	public int regImg(MultipartFile mf);

	public List<Map<String, Object>> getDetail2(Map<String, Object> map);






	
	

}
