package com.example.demo.controller.Track;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Good;
import com.example.demo.model.Member;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.TrackDetailService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class TrackDetailController {
	private final TrackDetailService service;

	@RequestMapping("/sns_detail")
	public String sns_detail(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum,
			@RequestParam(value = "sns_no") String sns_no, Model model, HttpSession session) {
		// 글 정보 불러오기
		SnsBoard board = service.getboard(Integer.parseInt(sns_no));

		// 굿 정보 불러오기
		List<Good> goodList = service.get_good(Integer.parseInt(sns_no));

		// 글 작성한 사람의 사진 불러오기
		String userphoto = service.getUserPhoto(Integer.parseInt(sns_no));
		String nickname = service.getNickName(Integer.parseInt(sns_no));

		// 맵에 경로 표현을 위한 데이터 불러오기
		Runner_data rd = service.getrdata(board.getRunner_data_no());
		// 좌표값 불러오기
		Coordinate[] c = service.getcdata(board.getRunner_data_no());
		
		service.read(sns_no);

		model.addAttribute("rd", rd);
		model.addAttribute("c", c);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("board", board);
		model.addAttribute("goodList", goodList);
		model.addAttribute("userphoto", userphoto);
		model.addAttribute("nickname", nickname);

		return "/track/trackDetail/sns_detail";
	}
	// 추천 상태 확인 및 토글을 모두 처리
    @PostMapping("/toggleGood")
    @ResponseBody
    public Integer toggleGood(HttpSession session, @RequestParam("sns_no") int sns_no) {
        Member member = (Member) session.getAttribute("member");

        if (member == null) {
            throw new IllegalStateException("로그인이 필요합니다.");
        }

        String user_id = member.getUser_id();
        // sns_no를 요청 파라미터로 받아 사용
        int result=0;
        if(service.toggleGood(user_id, sns_no)==true) result=1;
        
        return result;
    }
}
