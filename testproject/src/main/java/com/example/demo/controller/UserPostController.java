package com.example.demo.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;  // javax.servlet 대신 jakarta.servlet 사용

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.Member;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.UserPostService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserPostController {

    private final UserPostService userPostService;

    @RequestMapping("/userPostList")  
    public String getUserPosts(HttpSession session,  
                               @RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
                               Model model) {

        // 세션에서 Member 객체 가져오기
        Member member = (Member) session.getAttribute("member");

        // 테스트용: 세션에 member가 없으면 임의로 Member 객체를 추가
        if (member == null) {
        	  return "redirect:/loginpage";
        }

        // Member 객체에서 userId 가져오기
        String userId = member.getUser_id(); 

        final int rowPerPage = 10;
        int currentPage = Integer.parseInt(pageNum);

        // 사용자의 총 게시글 수
        int total = userPostService.getTotalByUserId(userId);
        int startRow = (currentPage - 1) * rowPerPage + 1;
        int endRow = startRow + rowPerPage - 1;

        // 페이징 객체 생성
        PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

        // 사용자 게시글 목록 가져오기
        List<SnsBoard> list = userPostService.listByUserId(userId, startRow, endRow);
        int no = total - startRow + 1;

        // 모델에 데이터 추가
        model.addAttribute("list", list);
        model.addAttribute("no", no);
        model.addAttribute("pp", pp);
        model.addAttribute("userId", userId);

        // userPostList.jsp 페이지로 반환
        return "userPostList";
    }
    
	@RequestMapping("/mywriting")
	public String mywriting() {
		return "mywriting";
	}

}
