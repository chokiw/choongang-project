package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.UserPostDAO;
import com.example.demo.model.SnsBoard;
import com.example.demo.model.Totalpage;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserPostService {

    private final UserPostDAO userPostDAO;

    public int getTotalByUserId(String userId) {
        return userPostDAO.getTotalByUserId(userId);
    }

    public List<SnsBoard> listByUserId(String userId, int startRow, int endRow) {
        return userPostDAO.listByUserId(userId, startRow, endRow);
    }

	public Totalpage[] getSnsboard(String userId) {
		
		return userPostDAO.getSnsboard(userId);
	}

	public Totalpage[] getMateboard(String userId) {
		return userPostDAO.getMateboard(userId);
	}
}