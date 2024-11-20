package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.LoginDAO;
import com.example.demo.model.Runner;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginService {
	private final LoginDAO dao;

	public Runner findid(Runner runner) {
		return dao.findid(runner);
	}

	public Runner findpass(Runner runner) {
		return dao.findpass(runner);
	}

	public Runner getMember(String user_id) {
		return dao.getMember(user_id);
	}
}
