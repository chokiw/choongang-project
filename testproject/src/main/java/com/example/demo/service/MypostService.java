package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MypostDAO;
import com.example.demo.model.Totalpage;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypostService {
	private final MypostDAO dao;

	public Totalpage[] getSnsboard(String userId) {
		return dao.getSnsboard(userId);
	}

	public Totalpage[] getMateboard(String userId) {
		return dao.getMateboard(userId);
	}
}
