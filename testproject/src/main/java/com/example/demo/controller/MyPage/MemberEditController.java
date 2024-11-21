package com.example.demo.controller.MyPage;

import java.io.File;
import java.security.Provider.Service;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.service.MemberEditService;
import com.example.demo.service.MypageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberEditController {
	
	private final MemberEditService memberEditService;
	private final MypageService projectservice;
	
	@RequestMapping("/memberedit")
	public String membereditview(HttpSession session, Model model){
		
	    Member member = (Member) session.getAttribute("member");
	     
	    String user_id = member.getUser_id();
		
		Runner memberinfo = memberEditService.membereditview(user_id);
		
		model.addAttribute("memberinfo", memberinfo);
		
		return "/mypage/myedit/memberedit";
	}
	
		
	@PostMapping("/membereditupdate")
	public String membership(@ModelAttribute Runner runner, @RequestParam(value="file1") MultipartFile mf,
			HttpSession session, HttpServletRequest request, @RequestParam(value="basicPhoto",defaultValue = "") String basicPhoto ,Model model) throws Exception {

		// 프로필사진 불러오기
		String filename = mf.getOriginalFilename(); // 첨부파일명
		int size = (int) mf.getSize(); // 첨부파일의 크기 (단위:Byte)
		int result = 0;
		String newfilename = "";
		String path = session.getServletContext().getRealPath("uimg");
//		System.out.println("mf=" + mf);
		
		if (size > 0) { // 첨부파일이 전송된 경우

			// 날짜에 따라서 프로플사진 이름 변경
			Date d = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("_yyyyMMdd_HH_mm_ss");
			String newdate = sd.format(d);
			
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());

			newfilename = runner.getUser_id() + newdate + extension;

			// 용량 초과시
			if (size > 100000) { // 100KB
				result = 2;
				model.addAttribute("result", result);

				return "/mypage/myedit/membereditresult";
				// 지정된 확장자가 아니면
			} else if (!extension.equals(".jpg") && !extension.equals(".jpeg") && !extension.equals(".gif")
					&& !extension.equals(".png")) {

				result = 3;
				model.addAttribute("result", result);

				return "/mypage/myedit/membereditresult";
			}
		}

		if (size > 0) { // 첨부파일 전송
			mf.transferTo(new File(path + "/" + newfilename));
		}

		Member member = (Member) session.getAttribute("member");	     
	  
		Runner runner1 = projectservice.getMember(member.getUser_id());		
	    
	    if(size > 0) {			// 첨부파일 수정한 경우
	    	runner.setUser_photo(newfilename);	    	
	    }else {					// 첨부파일 수정하지 않은 경우
	    	if(basicPhoto.equals("basic")) runner.setUser_photo("Default.png");
	    	else runner.setUser_photo(runner1.getUser_photo());	    	
	    }

		result = memberEditService.membereditupdate(runner);
		
		
		session.removeAttribute("member");
		
		member.setUser_id(runner.getUser_id());
		member.setUser_nickname(runner.getUser_nickname());
		member.setUser_photo(runner.getUser_photo());
		
		session.setAttribute("member", member);
		
		model.addAttribute("result", result);

		return "/mypage/myedit/membereditresult";
	}

}