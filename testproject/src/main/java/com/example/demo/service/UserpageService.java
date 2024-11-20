package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.UserpageDAO;
import com.example.demo.model.Runner;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserpageService {
	private final UserpageDAO dao;

	public Runner getMemberB(String user_id) {
		return dao.getMemberB(user_id);
	}
}
