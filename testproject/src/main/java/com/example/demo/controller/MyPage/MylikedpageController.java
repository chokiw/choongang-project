package com.example.demo.controller.MyPage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Member;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.MylikedpageService;
import com.example.demo.service.PagingPgm;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MylikedpageController {
	private final  MylikedpageService service;
	
	//내가 좋아요 누른 게시판페이지
	@RequestMapping("/liked_board")
	public String liked_board() {
		return "mypage/myliked/liked_board";
	}
	
	//내가 좋아요 누른 게시글 불러오기
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
			SnsBoard  sb = new SnsBoard();
			sb.setUser_id(userId);
			sb.setStartRow(startRow);
			sb.setEndRow(endRow);

			// 사용자가 좋아요한 게시글 목록을 페이징 처리하여 가져오기
			List<SnsBoard> likedPosts = service.getLikedPosts(sb);
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

		return "mypage/myliked/liked_list";

	}
}
