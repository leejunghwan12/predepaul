package com.study.project.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.study.project.dao.BoardDao;
import com.study.project.service.BoardService;


@Service("service")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name="dao")
	private BoardDao boardDao;

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.list(map);
	}

	@Override
	public int add(Map<String, Object> map) {
		
		return boardDao.add(map);
	}

	@Override
	public Map<String, Object> getDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.getDetail(map);
	}

	@Override
	public int update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.update(map);
	}



	@Override
	public int updatereviewcnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.updatereviewcnt(map);
	}

	@Override
	public void selectDelete(ArrayList<Integer> deleteArray) {
		// TODO Auto-generated method stub
		boardDao.selectDelete(deleteArray);
	}

	@Override
	public List<Map<String, Object>> search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.search(map);
	}

	@Override
	public Map<String, Object> pagination(Map<String, Object> map) {

		int curPage = Integer.parseInt(map.get("pageNo").toString()); 
		int PAGE_SCALE = Integer.parseInt(map.get("listSize").toString());
		int BLOCK_SCALE = 5;
		
		int count = boardDao.count(map);
		
		int totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
		int totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
        int curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
        int blockBegin = (curBlock-1)*BLOCK_SCALE+1;
        int blockEnd = blockBegin+BLOCK_SCALE-1;
        if(blockEnd > totPage) blockEnd = totPage;
        int prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
        int nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
        if(nextPage >= totPage) nextPage = totPage;
        
       
        Map<String, Object> pageMap = new HashMap<String, Object>();
        pageMap.put("curPage", curPage);
        pageMap.put("PAGE_SCALE", PAGE_SCALE);
        pageMap.put("BLOCK_SCALE", BLOCK_SCALE);
        pageMap.put("count", count);
        pageMap.put("totPage", totPage);
        pageMap.put("totBlock", totBlock);
        pageMap.put("curBlock", curBlock);
        pageMap.put("blockBegin", blockBegin);
        pageMap.put("blockEnd", blockEnd);
        pageMap.put("prevPage", prevPage);
        pageMap.put("nextPage", nextPage);
       
		
		return pageMap;
	}

	@Override
	public int regImg(MultipartFile mf) {
		// TODO Auto-generated method stub
		return boardDao.regImg(mf);
	}

	@Override
	public List<Map<String, Object>> getDetail2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.getDetail2(map);
	}

	






	
	
}
