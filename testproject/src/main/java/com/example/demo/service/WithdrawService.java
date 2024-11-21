package com.example.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.WithdrawDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WithdrawService {

	private final WithdrawDAO withdrawDAO;
	
	public int runner_delete(String user_id) {
	    int runner_delete = withdrawDAO.runner_delete(user_id);

	    if (runner_delete > 0) {
	        return 1; // 성공
	    } else {
	        throw new RuntimeException("회원 탈퇴 중 오류 발생");
	    }
	}
	}
	
