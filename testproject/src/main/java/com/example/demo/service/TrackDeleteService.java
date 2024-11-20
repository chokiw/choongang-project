package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.TrackDeleteDAO;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrackDeleteService {
	private final TrackDeleteDAO dao;

	public SnsBoard getboard(int sns_no) {
		return dao.getboard(sns_no);
	}

	public int deleteboard(SnsBoard sns) {
		return dao.deleteboard(sns);
	}
	
}
