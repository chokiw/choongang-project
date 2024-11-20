package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.TrackboardDAO;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrackboardService {
	private final TrackboardDAO dao;

	public List<SnsBoard> listBest(SnsBoard sns) {
		return dao.listBest(sns);
	}

	public int getTotal(SnsBoard sns) {
		return dao.getTotal(sns);
	}

	public List<SnsBoard> list(SnsBoard sns) {
		return dao.list(sns);
	}
}
