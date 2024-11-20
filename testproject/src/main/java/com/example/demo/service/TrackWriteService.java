package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.TrackWriteDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrackWriteService {
	private final TrackWriteDAO dao;

	public int getTotalfromrd(String user_id) {
		return dao.getTotalfromrd(user_id);
	}

	public int insertSns(SnsBoard board) {
		return dao.insertSns(board);
	}

	public List<Runner_data> listfromrd(Runner_data rd) {
		return dao.listfromrd(rd);
	}

	public Runner_data getrd(int int1) {
		return dao.getrd(int1);
	}

	public Coordinate[] getc(int int1) {
		return dao.getc(int1);
	}
}
