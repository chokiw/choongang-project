package com.example.demo.controller.Member;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Runner;
import com.example.demo.service.MemberService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MemberController {
	private final MemberService service;
	@Autowired
	org.springframework.security.crypto.password.PasswordEncoder passwordEncoder;
	
	@RequestMapping("/member")
	public String member() {
		return "/member/member";
	}
	
	@RequestMapping("/member_idcheck")
	@ResponseBody
	public int member_idcheck(@RequestParam(value = "memid") String id) {
		int result = 0;
		result = service.idcheck(id);
		return result;
	}
	
	@RequestMapping("/member_nicknamecheck")
	@ResponseBody
	public int member_nicknamecheck(@RequestParam(value = "memnickname") String nickname) {
		int result = 0;

		result = service.nicknamecheck(nickname);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/membership")
	public String membership(@ModelAttribute Runner runner, @RequestParam("file1") MultipartFile mf,
			HttpSession session, HttpServletRequest request, Model model) throws Exception {

		// 프로필사진 불러오기
		String filename = mf.getOriginalFilename(); // 첨부파일명
		int size = (int) mf.getSize(); // 첨부파일의 크기 (단위:Byte)
		int result = 0;
		String newfilename = "";
		String path = session.getServletContext().getRealPath("uimg");
//		System.out.println("mf=" + mf);
//		System.out.println("filename=" + filename); 	// filename="Koala.jpg"
//		System.out.println("size=" + size);
//		System.out.println("Path=" + path);
		if (size > 0) { // 첨부파일이 전송된 경우

			// 날짜에 따라서 프로플사진 이름 변경
			Date d = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("_yyyyMMdd_HH_mm_ss");
			String newdate = sd.format(d);
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
//			System.out.println("extension:"+extension);  // extension: .jpg

			newfilename = runner.getUser_id() + newdate + extension;
//			System.out.println("newfilename:"+newfilename);		

			// 용량 초과시
			if (size > 10000000) { // 100KB
				result = 2;
				model.addAttribute("result", result);

				return "/member/membershipresult";
				// 지정된 확장자가 아니면
			} else if (!extension.equals(".jpg") && !extension.equals(".jpeg") && !extension.equals(".gif")
					&& !extension.equals(".png")) {

				result = 3;
				model.addAttribute("result", result);

				return "/member/membershipresult";
			}
		}

		if (size > 0) { // 첨부파일 전송
			mf.transferTo(new File(path + "/" + newfilename));
		}
		
		if(newfilename == null || newfilename.equals("")) runner.setUser_photo("Default.png");
		else runner.setUser_photo(newfilename);
		
		String encPasswd = passwordEncoder.encode(runner.getUser_passwd());
		
		runner.setUser_passwd(encPasswd);

		result = service.insert(runner);

		model.addAttribute("result", result);

		return "/member/membershipresult";
	}
}
