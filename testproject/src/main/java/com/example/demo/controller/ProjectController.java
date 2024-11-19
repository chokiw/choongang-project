package com.example.demo.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.Alarm;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Good;
import com.example.demo.model.Member;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.GoodService;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.ProjectService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class ProjectController {

	private final ProjectService service; 
	private final GoodService good_service;

	// 메인페이지로 이동
	@RequestMapping("/mainpage")
	public String mainpage(Runner runner, Model model, Runner_data data, SnsBoard sns ) {
		List <Runner> rundata = service.rundata(runner);
		
		//  달린거리가 가장 많은 랭킹 5명
		 // 최대 5개의 닉네임을 개별적으로 가져옵니다.
	    for (int i = 0; i < Math.min(5, rundata.size()); i++) {
	        String nickname = rundata.get(i).getUser_nickname();
	        model.addAttribute("userNickname" + (i + 1), nickname);
	    }
	    
	    // 5개의 달린거리를 가져온다.
	    for (int i = 0; i < Math.min(5, rundata.size()); i++) {
	    	double distanceInMeters = Double.parseDouble(rundata.get(i).getDistance());	// distance가 m값이라 km값으로 바꾸기 위해 double로 형변환
	    	
	    	 double distanceInKm = distanceInMeters / 1000.0;
	         // 소수점 둘째 자리까지 반올림
	         String formattedDistance = String.format("%.2f", distanceInKm);
	         model.addAttribute("userDistance" + (i + 1), formattedDistance);
	    }
	    
	    // 5개의 프로필이미지를 가져온다.
	    for (int i = 0; i < Math.min(5, rundata.size()); i++) {
	        String userprofileimg = rundata.get(i).getUser_photo();
	        model.addAttribute("userProfileimg" + (i + 1), userprofileimg);
	    }
	    
	    
	    	model.addAttribute("rundata", rundata);
	    	
	    	
	    	
	    // 추천수를 가장 많이 받은 글 3개
	   // 	List<SnsBoard> routedata = service.routedata(sns);
	    	
	    	
	   
		return "mainpage";
	}

	// 마이페이지로 이동
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Alarm alarm, Runner runner, Model model) {

		Member member = (Member) session.getAttribute("member");

		if (member == null) {
			return "redirect:/loginpage";
		}

		String user_id = member.getUser_id();
		Runner dbrunner = service.getMember(user_id);
		Alarm[] dbalarm = service.getAlarm(user_id);


		model.addAttribute("runner", dbrunner);
		model.addAttribute("dbalarm", dbalarm);

		return "mypage";
	}
	
	//모집게시판
	@RequestMapping("/mate_board")
	public String mate_board() {
		return "mate_board";
	}

	
	//로그인 페이지로 이동
	@RequestMapping("/loginpage")
	public String loginpage() {
		return "login";
	}
	//아이디 찾기 창으로 이동
	@RequestMapping("/find_id")
	public String find_id() {
		return "find_id";
	}

	//비번찾기창으로 이동
	@RequestMapping("/find_pass")
	public String find_pass() {
		return "find_pass";
	}

	//측정페이지로 이동
	@RequestMapping("/run")
	public String run() {
		return "run";
	}
	
	//회원가입 창으로 이동
	@RequestMapping("/member")
	public String member() {
		return "member";
	}
	
	@RequestMapping("/sns_board")
	public String sns_board() {
		return "sns_board";
	}

	@RequestMapping("/sns_write")
	public String sns_write() {
		return "sns_write";
	}

	// 아이디 찾기 액션
	@RequestMapping(value = "find_id_ok", method = RequestMethod.POST)
	public String find_id_ok(@ModelAttribute Runner runner, Model model) {
		Runner run = service.findid(runner);

		if (run == null) {
			return "id_result";
		} else {
			String id = run.getUser_id();

			model.addAttribute("id", id);
			return "id_ok";
		}
	}

	// 비번찾기 : email로 전송
	@RequestMapping(value = "find_pass_ok", method = RequestMethod.POST)
	public String pwd_find_ok(@ModelAttribute Runner runner, Model model) {

		Runner run = service.findpass(runner);

		if (run == null) {
			return "id_result";

		} else {

			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "wnduddud97@naver.com";
			String hostSMTPpwd = "ymsgksmf82"; // 비밀번호 입력해야함

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "wnduddud97@naver.com";
			String fromName = "관리자";
			String subject = "비밀번호 찾기";

			// 받는 사람 E-Mail 주소
			String mail = run.getUser_emailid() + "@" + run.getUser_domain();

			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);
				email.setSmtpPort(587);

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호:"
						+ run.getUser_passwd() + "</div>");
				email.send();
			} catch (Exception e) {
				System.out.println(e);
			}

			return "pass_ok";

		}
	}
	
	
	
	//로그인 서비스
	@RequestMapping("/login")
	public String login(@ModelAttribute Runner runner, HttpSession session, Model model) {
		int result = 0;

		Runner dbrunner = service.getMember(runner.getUser_id());

		if (dbrunner.getUser_passwd().equals(runner.getUser_passwd())) {
			result = 1;
			Member member = new Member();
			member.setUser_id(dbrunner.getUser_id());
			member.setUser_nickname(dbrunner.getUser_nickname());
			member.setUser_photo(dbrunner.getUser_photo());
			session.setAttribute("member", member);
		} else {
			result = -1;
		}

		model.addAttribute("result", result);
		return "loginresult";
	}
	
	//회원가입 아이디 중복확인
	@RequestMapping("/member_idcheck")
	@ResponseBody
	public int member_idcheck(@RequestParam(value = "memid") String id) {
		int result = 0;
		result = service.idcheck(id);
		return result;
	}

	//회원가입 닉네임확인
	@RequestMapping("/member_nicknamecheck")
	@ResponseBody
	public int member_nicknamecheck(@RequestParam(value = "memnickname") String nickname) {
		int result = 0;

		result = service.nicknamecheck(nickname);
		System.out.println(result);
		return result;
	}
	
	//회원가입 진행
	@RequestMapping("/membership")
	public String membership(@ModelAttribute Runner runner, @RequestParam("file1") MultipartFile mf,
			HttpSession session, HttpServletRequest request, Model model) throws Exception {
		
		//프로필사진 불러오기
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
			
			//날짜에 따라서 프로플사진 이름 변경
			Date d = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("_yyyyMMdd_HH_mm_ss");
			String newdate = sd.format(d);
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
//			System.out.println("extension:"+extension);  // extension: .jpg

			newfilename = runner.getUser_id() + newdate + extension;
//			System.out.println("newfilename:"+newfilename);		

			//용량 초과시
			if (size > 100000) { // 100KB
				result = 2;
				model.addAttribute("result", result);

				return "membershipresult";
			//지정된 확장자가 아니면
			} else if (!extension.equals(".jpg") && !extension.equals(".jpeg") && !extension.equals(".gif")
					&& !extension.equals(".png")) {

				result = 3;
				model.addAttribute("result", result);

				return "membershipresult";
			}
		}

		if (size > 0) { // 첨부파일 전송
			mf.transferTo(new File(path + "/" + newfilename));
		}

		runner.setUser_photo(newfilename);

		result = service.insert(runner);

		model.addAttribute("result", result);

		return "membershipresult";
	}

	

	@RequestMapping("/sns_detail")
	public String sns_detail(@RequestParam(value = "pageNum") String pageNum,
	                         @RequestParam(value = "sns_no") String sns_no, 
	                         Model model, HttpSession session) {
	    // 글 정보 불러오기
		SnsBoard board = service.getboard(Integer.parseInt(sns_no));
		
		// 굿 정보 불러오기
		Good good_board = good_service.get_good(Integer.parseInt(sns_no));
		
	    // 맵에 경로 표현을 위한 데이터 불러오기
	    Runner_data rd = service.getrdata(board.getRunner_data_no());
	    // 좌표값 불러오기
	    Coordinate[] c = service.getcdata(board.getRunner_data_no());

	    model.addAttribute("rd", rd);
	    model.addAttribute("c", c);
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("board", board);
	    model.addAttribute("good_board", good_board);
	    
	    return "sns_detail";
	}


	@RequestMapping("/snslist")
	public String snslist(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, SnsBoard sns,
			Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		//전체데이터 갯수
		int total = service.getTotal(sns); 
		//System.out.println("total:" + total);
		//페이지 이동에 따라서 10개의 데이터를 어디서 어디까지 가져올지 알기위한 변수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		//페이지 이동 변수들을 담아놓는 DTO에 저장
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		
		//DTO에 페이지 변수가져가는 이유는 mapper파일 이동시 매개변수는 1개만 가져갈 수 있다.
		//따라서  map같은 거에 많은 데이터를 한번에 가져가야한다.
		sns.setStartRow(startRow);
		sns.setEndRow(endRow);
		int no = total - startRow + 1;
		//System.out.println("no:" + no);
		//불러온 게시판 데이터 리스트에 담기
		List<SnsBoard> list = service.list(sns);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", sns.getSearch());
		model.addAttribute("keyword", sns.getKeyword());

		return "snslist";
	}
	
	//sns글 쓸때 자신의 데이터를 게시판 형태로 보기위한 서비스코드
	@RequestMapping("/sns_write_list")
	public String sns_write_list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		System.out.println(member.getUser_id());
		System.out.println(member.getUser_nickname());
		Runner_data rd = new Runner_data();
		rd.setUser_id(member.getUser_id());
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = service.getTotalfromrd(member.getUser_id());
		System.out.println("total:" + total);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		rd.setStartRow(startRow);
		rd.setEndRow(endRow);
		int no = total - startRow + 1;
		System.out.println("no:" + no);
		List<Runner_data> list = service.listfromrd(rd);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);

		return "sns_write_list";
	}


//sns 리스트에서 인기글목록 순으로 나타내 기위한 컨트롤러
	@RequestMapping("/snslist/best")
	public String snslistBest(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, SnsBoard sns,
			Model model) {
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// 전체 데이터 갯수
		int total = service.getTotal(sns);
		// 페이지 이동에 따라서 10개의 데이터를 어디서 어디까지 가져올지 알기 위한 변수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// 페이지 이동 변수들을 담아놓는 DTO에 저장
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		sns.setStartRow(startRow);
		sns.setEndRow(endRow);
		int no = total - startRow + 1;
		// 불러온 추천수 순으로 정렬된 게시판 데이터를 리스트에 담기
		List<SnsBoard> list = service.listBest(sns);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		model.addAttribute("search", sns.getSearch());
		model.addAttribute("keyword", sns.getKeyword());
		model.addAttribute("best", true); // 인기글 목록임을 표시하는 플래그 추가

		return "snslist";
	}

}