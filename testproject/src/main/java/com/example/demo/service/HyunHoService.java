package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.demo.dao.HyunHoDAO;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HyunHoService {

	private final HyunHoDAO dao;

	public int getTotalLiked(String user_id) {

		return dao.getTotalLiked(user_id);
	}

	public List<SnsBoard> getLikedPosts(String user_id, int startRow, int endRow) {
		// 매개변수들을 Map에 담아서 전달
		Map<String, Object> params = new HashMap<>();
		params.put("user_id", user_id);
		params.put("startRow", startRow);
		params.put("endRow", endRow);

		return dao.getLikedPosts(params);
	}
}
