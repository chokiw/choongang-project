package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.MylikedpageDAO;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MylikedpageService {
	private final MylikedpageDAO dao;

	public List<SnsBoard> getLikedPosts(SnsBoard sb) {
		return dao.getLikedPosts(sb);
	}

	public int getTotalLiked(String userId) {
		return dao.getTotalLiked(userId);
	}
}
