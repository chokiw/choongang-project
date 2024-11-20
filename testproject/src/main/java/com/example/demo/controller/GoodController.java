package com.example.demo.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Member;
import com.example.demo.service.GoodService;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@RestController
@AllArgsConstructor
@RequestMapping("/good")
public class GoodController {

    private final GoodService goodService;

    // 추천 상태 확인 및 토글을 모두 처리
    @PostMapping("/toggleGood")
    public boolean toggleGood(HttpSession session, @RequestParam("sns_no") int sns_no) {
        Member member = (Member) session.getAttribute("member");

        if (member == null) {
            throw new IllegalStateException("로그인이 필요합니다.");
        }

        String user_id = member.getUser_id();

        // sns_no를 요청 파라미터로 받아 사용
        return goodService.toggleGood(user_id, sns_no);
    }

}

