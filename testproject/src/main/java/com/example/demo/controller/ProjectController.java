package com.example.demo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.ProjectService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins="*")
public class ProjectController {
		
	
	private final ProjectService service;
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/main2")
	public String main2() {
		return "main2";
	}
	
	@RequestMapping("/mainpage")
	public String mainpage() {
		return "mainpage";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	
	@RequestMapping("/mate_board")
	public String mate_board() {
		return "mate_board";
	}
	
	
	@RequestMapping("/mate_detail")
	public String mate_detail() {
		return "mate_detail";
	}
	@RequestMapping("/loginpage")
	public String loginpage() {
		return "login";
	}
	
	@RequestMapping("/find_id")
	public String find_id() {
		return "find_id";
	}
	
	@RequestMapping("/find_pass")
	public String find_pass() {
		return "find_pass";
	}
	
	@RequestMapping("/run")
	public String run() {
		return "run";
	}
	
	
	@RequestMapping("/runnerdata")
	public String runnerdata(@RequestParam(value="path") String[] path,@RequestParam(value="distance") String distance,@RequestParam(value="time") String time) {
		System.out.println("runnerdata");
		for(String s: path) {
			System.out.println(s);
		}
		
		System.out.println(distance);
		System.out.println(time);
		
		return "mypage";
	}
	
	@RequestMapping("/login")
	public String login(@ModelAttribute Runner runner,HttpSession session,Model model) {
		int result=0;
		
		Runner dbrunner=service.getMember(runner.getUser_id());
		
		if(dbrunner.getUser_passwd().equals(runner.getUser_passwd())) {
			result=1;
			Member member=new Member();
			member.setUser_id(dbrunner.getUser_id());
			member.setUser_nickname(dbrunner.getUser_nickname());
			member.setUser_photo(dbrunner.getUser_photo());
			session.setAttribute("member", member);
		}else {
			result=-1;
		}
		
		model.addAttribute("result", result);
		return "loginresult";
	}
	
	@RequestMapping("/member")
	public String member() {
		return "member";
	}
	@RequestMapping("/member_idcheck")
	@ResponseBody
	public int member_idcheck(@RequestParam(value="memid") String id) {
		int result =0;
		result = service.idcheck(id);	
		return result;
	}
	
	@RequestMapping("/member_nicknamecheck")
	@ResponseBody
	public int member_nicknamecheck(@RequestParam(value="memnickname") String nickname) {
		int result =0;
		
		result = service.nicknamecheck(nickname);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/membership")
	public String membership(@ModelAttribute Runner runner,
							 @RequestParam("file1") MultipartFile mf,
							 HttpSession session,
							 HttpServletRequest request,
							 Model model) throws Exception{
		
		String filename = mf.getOriginalFilename();		// 첨부파일명
		int size = (int) mf.getSize(); 					// 첨부파일의 크기 (단위:Byte)
		int result=0;
		String newfilename = "";
		String path = session.getServletContext().getRealPath("uimg");
//		System.out.println("mf=" + mf);
//		System.out.println("filename=" + filename); 	// filename="Koala.jpg"
//		System.out.println("size=" + size);
//		System.out.println("Path=" + path);
		if(size > 0){	 		// 첨부파일이 전송된 경우	
			
			Date d= new Date();
			SimpleDateFormat sd = new SimpleDateFormat("_yyyyMMdd_HH_mm_ss");
			String newdate= sd.format(d);
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
//			System.out.println("extension:"+extension);  // extension: .jpg
			
			
			newfilename = runner.getUser_id() + newdate + extension;
//			System.out.println("newfilename:"+newfilename);		
			
			if(size > 100000){				// 100KB
				result=2;
				model.addAttribute("result", result);
				
				return "membershipresult";
				
			}else if(!extension.equals(".jpg")  &&
					 !extension.equals(".jpeg") &&
					 !extension.equals(".gif")  &&
					 !extension.equals(".png") ){
				
				result=3;
				model.addAttribute("result", result);
				
				return "membershipresult";
			}
		}	

		if (size > 0) { 	// 첨부파일 전송
			mf.transferTo(new File(path + "/" + newfilename));
		}
			
		runner.setUser_photo(newfilename);

		result=service.insert(runner);
		
		model.addAttribute("result",result);
		
		return "membershipresult";
	}
	
	@RequestMapping("/sns_board")
	public String sns_board() {
		return "sns_board";
	}
	
	@RequestMapping("/sns_detail")
	public String sns_detail(@RequestParam(value="pageNum",defaultValue="1") String pageNum,@RequestParam(value="sns_no",defaultValue="227") String sns_no,Model model) {
		
		SnsBoard board=service.getboard(Integer.parseInt(sns_no));
		Runner_data rd= service.getrdata(board.getRunner_data_no());
		Coordinate[] c= service.getcdata(board.getRunner_data_no());
		
		model.addAttribute("rd",rd);
		model.addAttribute("c",c);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("board",board);
		return "sns_detail";
	}
	
	@RequestMapping("/snslist")
	public String snslist(@RequestParam(value="pageNum",defaultValue="1") String pageNum,SnsBoard sns, Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = service.getTotal(sns); // 검색
		System.out.println("total:"+total);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		
		sns.setStartRow(startRow);
		sns.setEndRow(endRow);
		int no = total - startRow + 1;
		System.out.println("no:"+no);
		List<SnsBoard> list = service.list(sns);
		model.addAttribute("list", list);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", sns.getSearch());
		model.addAttribute("keyword", sns.getKeyword());
		
		return "snslist";
	}

	
}