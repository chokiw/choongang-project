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
@CrossOrigin(origins = "*")
public class ProjectController {

	private final ProjectService service;

	// 메인페이지로 이동
	@RequestMapping("/mainpage")
	public String mainpage() {
		return "mainpage";
	}

	// 마이페이지로 이동
	@RequestMapping("/mypage")
	public String mypage() {
		return "mypage";
	}

	// 모집게시판
	@RequestMapping("/mate_board")
	public String mate_board() {
		return "mate_board";
	}

	// 모집 글상세
	@RequestMapping("/mate_detail")
	public String mate_detail() {
		return "mate_detail";
	}

	// 로그인 페이지로 이동
	@RequestMapping("/loginpage")
	public String loginpage() {
		return "login";
	}

	// 아이디 찾기 창으로 이동
	@RequestMapping("/find_id")
	public String find_id() {
		return "find_id";
	}

	// 비번찾기창으로 이동
	@RequestMapping("/find_pass")
	public String find_pass() {
		return "find_pass";
	}

	// 측정페이지로 이동
	@RequestMapping("/run")
	public String run() {
		return "run";
	}

	// 회원가입 창으로 이동
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

	// test용 서비스 ->지워도됌 최종때는 반드시 지워야함
	@RequestMapping("/runnerdata")
	public String runnerdata(@RequestParam(value = "path") String[] path,
			@RequestParam(value = "distance") String distance, @RequestParam(value = "time") String time) {
		System.out.println("runnerdata");
		for (String s : path) {
			System.out.println(s);
		}

		System.out.println(distance);
		System.out.println(time);

		return "mypage";
	}

	// 로그인 서비스
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

	// 회원가입 아이디 중복확인
	@RequestMapping("/member_idcheck")
	@ResponseBody
	public int member_idcheck(@RequestParam(value = "memid") String id) {
		int result = 0;
		result = service.idcheck(id);
		return result;
	}

	// 회원가입 닉네임확인
	@RequestMapping("/member_nicknamecheck")
	@ResponseBody
	public int member_nicknamecheck(@RequestParam(value = "memnickname") String nickname) {
		int result = 0;

		result = service.nicknamecheck(nickname);
		System.out.println(result);
		return result;
	}

	// 회원가입 진행
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
			if (size > 100000) { // 100KB
				result = 2;
				model.addAttribute("result", result);

				return "membershipresult";
				// 지정된 확장자가 아니면
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
	public String sns_detail(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@RequestParam(value = "sns_no", defaultValue = "227") String sns_no, Model model) {
		// 글정보 불러오기
		SnsBoard board = service.getboard(Integer.parseInt(sns_no));
		// 맵에 경로 표현을 위한 테이터 불러오기
		Runner_data rd = service.getrdata(board.getRunner_data_no());
		// 좌표값 불러오기
		Coordinate[] c = service.getcdata(board.getRunner_data_no());

		model.addAttribute("rd", rd);
		model.addAttribute("c", c);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
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
		// 전체데이터 갯수
		int total = service.getTotal(sns);
		// System.out.println("total:" + total);
		// 페이지 이동에 따라서 10개의 데이터를 어디서 어디까지 가져올지 알기위한 변수
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		// 페이지 이동 변수들을 담아놓는 DTO에 저장
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		// DTO에 페이지 변수가져가는 이유는 mapper파일 이동시 매개변수는 1개만 가져갈 수 있다.
		// 따라서 map같은 거에 많은 데이터를 한번에 가져가야한다.
		sns.setStartRow(startRow);
		sns.setEndRow(endRow);
		int no = total - startRow + 1;
		// System.out.println("no:" + no);
		// 불러온 게시판 데이터 리스트에 담기
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

	// sns글 쓸때 자신의 데이터를 게시판 형태로 보기위한 서비스코드
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

	
	// 마이페이지 > 나의 추천 글 목록 게시판
	@RequestMapping("/liked_board")
	public String liked_board() {
		return "liked_board";
	}
	// 나의 추천글 목록 리스트
	@RequestMapping("/liked_list")
	public String likedPosts(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, HttpSession session,
			Model model) {
		final int rowPerPage = 10; // 한 페이지당 보여줄 게시글 수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1"; // 페이지 번호가 없거나 빈 경우 기본값으로 1 설정
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호

		Member member = (Member) session.getAttribute("member"); // 세션에서 사용자 정보를 가져옴
		if (member == null) { // 사용자가 로그인되어 있지 않은 경우 로그인 페이지로 리다이렉트
			return "redirect:/loginpage";
		}

		String userId = member.getUser_id(); // 세션에서 사용자 ID를 가져옴

		try {
			int total = service.getTotalLiked(userId); // 사용자가 좋아요한 총 게시글 수 가져오기
			System.out.println("total liked posts: " + total);

			int startRow = (currentPage - 1) * rowPerPage + 1; // 현재 페이지의 시작 행 번호 계산
			int endRow = startRow + rowPerPage - 1; // 현재 페이지의 끝 행 번호 계산
			PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage); // 페이징 객체 생성

			// 사용자가 좋아요한 게시글 목록을 페이징 처리하여 가져오기
			List<SnsBoard> likedPosts = service.getLikedPosts(userId, startRow, endRow);
			System.out.println("likedPosts: " + likedPosts);
			if (likedPosts.isEmpty()) { // 좋아요한 게시글이 없는 경우 로그 출력
				System.out.println("No liked posts found for user: " + userId);
			}

			int no = total - startRow + 1; // 게시글 번호 계산 (페이징을 고려한 번호)
			model.addAttribute("likedPosts", likedPosts); // 모델에 좋아요한 게시글 목록 추가
			model.addAttribute("pageNum", pageNum); // 모델에 현재 페이지 번호 추가
			model.addAttribute("no", no); // 모델에 게시글 번호 추가
			model.addAttribute("pp", pp); // 모델에 페이징 객체 추가
		} catch (Exception e) { // 예외 발생 시 로그 출력 및 에러 페이지로 리다이렉트
			System.out.println("Error retrieving liked posts: " + e.getMessage());
			e.printStackTrace(); // 스택 트레이스를 출력하여 문제의 원인을 정확하게 파악
			return "errorPage"; // 에러 페이지로 리다이렉트 (필요시)
		}

		return "liked_list";

	}

}