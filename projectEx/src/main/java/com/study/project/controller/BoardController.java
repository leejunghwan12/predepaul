package com.study.project.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.project.service.BoardService;
import com.tobesoft.platform.PlatformRequest;
import com.tobesoft.platform.PlatformResponse;
import com.tobesoft.platform.data.ColumnInfo;
import com.tobesoft.platform.data.Dataset;
import com.tobesoft.platform.data.DatasetList;
import com.tobesoft.platform.data.VariableList;

@Controller("controller")
public class BoardController {
	


	
	@Inject
	SqlSessionTemplate sqlSession;
	
	private final static String filePath = "C:\\Users\\dev\\Desktop\\chumbu\\";

	//리소스는 이름으로 찾음 (빈)
	@Resource(name ="service")
	private BoardService boardService;
	
	@RequestMapping("excel")
    public String excel(@RequestParam Map<String, Object> map, HttpServletResponse response, Model model) throws IOException {

	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	list = boardService.list(map);
    model.addAttribute("list", list);
    return "board/excelView";
}
	
	@RequestMapping("list")
	public String list(@RequestParam Map<String, Object> map,Model model) {
		
	if (map.get("pageNo")== null) {
		map.put("pageNo", 1);
		map.put("listSize", 10);
	}	
	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	list = boardService.search(map);
	Map<String, Object> pageMap = boardService.pagination(map);

	model.addAttribute("list", list);
	model.addAttribute("map", map);
	model.addAttribute("pageMap", pageMap);
	
		return "board/list";
		
	}
	
	@RequestMapping("milist")
	public void milist(@RequestParam Map<String, Object> map,HttpServletResponse rep) throws IOException {
		
/*	if (map.get("pageNo")== null) {
		map.put("pageNo", 1);
		map.put("listSize", 10);
	}*/	
	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	list = boardService.list(map);

	Dataset ds = new Dataset("javaDs");
	ds.addColumn("seq", ColumnInfo.COLTYPE_INT, 100);
	ds.addColumn("memId", ColumnInfo.COLTYPE_STRING, 100);
	ds.addColumn("boardSubject", ColumnInfo.COLTYPE_STRING, 100);
	ds.addColumn("regDate", ColumnInfo.COLTYPE_STRING, 100);
	ds.addColumn("viewCnt", ColumnInfo.COLTYPE_INT, 100);
	
	for (int i = 0; i < list.size(); i++) {
		int row = ds.appendRow(); //칸 추가하는 그거다. mi플랫폼 애드로우와 완전히 동일한 기능
		ds.setColumn(row, "seq", list.get(i).get("seq").toString());
		ds.setColumn(row, "memId", list.get(i).get("memId").toString());
		ds.setColumn(row, "boardSubject", list.get(i).get("boardSubject").toString());
		ds.setColumn(row, "regDate", list.get(i).get("regDate").toString());
		ds.setColumn(row, "viewCnt", list.get(i).get("viewCnt").toString());
		
	}
	
	DatasetList dsl = new DatasetList();
	dsl.add(ds);
	
	VariableList vl = new VariableList();
	
	PlatformResponse pRes = new PlatformResponse(rep,PlatformRequest.XML,"UTF-8");
	pRes.sendData(vl,dsl);
	
	
	
		
	}
	
	
	
	
	@RequestMapping("searchlist")
	public String list2(@RequestParam Map<String, Object> map,Model model) {
		
		if (map.get("pageNo")== null) {
			map.put("pageNo", 1);
			map.put("listSize", 10);
		}		

	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	list = boardService.search(map);
	Map<String, Object> pageMap = boardService.pagination(map);

	model.addAttribute("list", list);
	model.addAttribute("pageMap", pageMap);
	
		return "board/searchlist" ;
		
	}
	
	@RequestMapping("misearchlist")
	public void misearchlist(@RequestParam Map<String, Object> map, HttpServletResponse rep) throws IOException {
		
		if (map.get("pageNo")== null) {
			map.put("pageNo", 1);
			map.put("listSize", 10);
		}		
System.out.println("-----------------------------------------");
		System.out.println(map.get("searchType"));
		System.out.println(map.get("searchTxt"));
		System.out.println("-----------------------------------------");

		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	list = boardService.search(map);
	
	Dataset ds = new Dataset("javaDs");
	ds.addColumn("seq", ColumnInfo.COLTYPE_INT, 100);
	ds.addColumn("memId", ColumnInfo.COLTYPE_STRING, 100);
	ds.addColumn("boardSubject", ColumnInfo.COLTYPE_STRING, 100);
	ds.addColumn("regDate", ColumnInfo.COLTYPE_STRING, 100);
	ds.addColumn("viewCnt", ColumnInfo.COLTYPE_INT, 100);
	
	for (int i = 0; i < list.size(); i++) {
		int row = ds.appendRow(); //칸 추가하는 그거다. mi플랫폼 애드로우와 완전히 동일한 기능
		ds.setColumn(row, "seq", list.get(i).get("seq").toString());
		ds.setColumn(row, "memId", list.get(i).get("memId").toString());
		ds.setColumn(row, "boardSubject", list.get(i).get("boardSubject").toString());
		ds.setColumn(row, "regDate", list.get(i).get("regDate").toString());
		ds.setColumn(row, "viewCnt", list.get(i).get("viewCnt").toString());
		
	}
	
	DatasetList dsl = new DatasetList();
	dsl.add(ds);
	
	VariableList vl = new VariableList();
	
	PlatformResponse pRes = new PlatformResponse(rep,PlatformRequest.XML,"UTF-8");
	pRes.sendData(vl,dsl);
	
	
	
		
	}
	
	
	/*@RequestMapping("list")
	public String list(Map<String, Object> map,Model model) {

	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	list = boardService.list(map);
	model.addAttribute("list", list);
	
		return "board/list";
		
	}*/
	
	@RequestMapping("write.go")
	public String writeGo(HttpServletRequest req) {
		req.setAttribute("reg", "reg");
		return "board/write";
		
	}
	
	@RequestMapping("update.go")
	public String updateGo(@RequestParam Map<String, Object> map,HttpServletRequest req,Model model) {
		req.setAttribute("upt", "upt");
		return "board/write";
	}

	@RequestMapping("update.do")
	public String updateDo(@RequestParam Map<String, Object> map,HttpServletRequest req,Model model) {
	
		boardService.update(map);
		
		return "redirect:list";
		
	}

	
	//삭제 해오기
	@RequestMapping(value = "write.do", method = RequestMethod.POST)
	public String writeDo(@RequestParam Map<String, Object> map,MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException {


		Iterator<String> itr = mRequest.getFileNames();
		//인풋 파일태그를 가져와서 배열에 담아준다. 
		
		int seq = sqlSession.selectOne("mapper.maxSeq");
		//시퀸스값을 가져온다. 각각의 값들에게 등록을동시에 해주고자함 
		
		
		while(itr.hasNext()) {
			MultipartFile mFile = mRequest.getFile(itr.next());
			
			if(mFile.getSize() > 0) {
				UUID ui = UUID.randomUUID(); //랜덤값 만들어준다. 
				String realFile = mFile.getOriginalFilename();
				String saveFile = ui + "_" + realFile;
				
				
				mFile.transferTo(new File(filePath + saveFile));
				
				Map<String, Object> fileMap = new HashMap<String, Object>();
				fileMap.put("REAL_NAME", realFile);
				fileMap.put("SAVE_NAME", saveFile);
				fileMap.put("SAVE_PATH", filePath);
				fileMap.put("LIST_SEQ", seq);
				
				int fileInsert = sqlSession.insert("mapper.fileInsert", fileMap);
				
			}
			
			
		}
		
		map.put("seq", seq);
		int insert = boardService.add(map);
		
		if(insert == 0) {
			
		}else {
			
		}
    	
 
		return "redirect:list";
		
	}
	
	@RequestMapping("detail.go")
	public String detailGo(@RequestParam Map<String, Object> map,Model model) {
		Map<String, Object> detail = new HashMap<String, Object>();
		boardService.updatereviewcnt(map);
	 	detail = boardService.getDetail(map);
		List<Map<String, Object>> detail2 = new ArrayList<Map<String,Object>>();
	 	detail2 =boardService.getDetail2(map);
		model.addAttribute("detail",detail);
		model.addAttribute("detail2",detail2);
		return "board/detail";
		
	}
	

	@RequestMapping("down")
	public void down(@RequestParam String saveFile, @RequestParam String realFile
						, HttpServletResponse response,
						HttpServletRequest request) throws IOException {

		String saveDir = filePath;
		String fileName = saveFile;
		File file = new File(saveDir + "/" + fileName);
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			sos = response.getOutputStream();
			String reFilename = "";
			
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1
					|| request.getHeader("user-agent").indexOf("Trident") != -1;
			if (isMSIE) {
				reFilename = URLEncoder.encode(realFile, "utf-8");
				reFilename = realFile.replaceAll("\\+", "%20");
			} else {
				reFilename = new String(realFile.getBytes("utf-8"), "ISO-8859-1");
			}
			
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attachment;filename=\"" + reFilename + "\"");
			response.setContentLength((int) file.length());
			int read = 0;
			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				sos.close();
				bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String selectDelete(@RequestParam(value="valueArr") List<Integer>deleteList, HttpServletRequest request) throws Exception {

		ArrayList<Integer> deleteArray = new ArrayList<Integer>();
		for(int i=0; i<deleteList.size(); i++) {
        	deleteArray.add(deleteList.get((i)));
        }
		System.out.println(deleteArray);
		boardService.selectDelete(deleteArray);
		
        return "redirect:list";
    }
	
}
