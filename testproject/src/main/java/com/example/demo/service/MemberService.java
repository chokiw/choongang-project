package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDAO;
import com.example.demo.model.Runner;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberDAO dao;

	public int idcheck(String id) {
		return dao.idcheck(id);
	}

	public int nicknamecheck(String nickname) {
		return dao.nicknamecheck(nickname);
	}

	public int insert(Runner runner) {
		return dao.insert(runner);
	}
}
