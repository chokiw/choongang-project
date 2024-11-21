package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MateDeleteDao;
import com.example.demo.model.RecruitBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MateDeleteService {
	private final MateDeleteDao dao;

	public RecruitBoard getrecruitD(int recruit_no) {
		return dao.getrecruitD(recruit_no);
	}

	public int deleteRecruit(int recruit_no) {
		return dao.deleteRecruit(recruit_no);
	}
}	
