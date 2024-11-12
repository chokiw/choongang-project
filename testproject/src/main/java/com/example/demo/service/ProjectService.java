package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ProjectDAO;
import com.example.demo.model.Runner;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectService {
	
	private final ProjectDAO dao;
		
	public int getTotal(SnsBoard sns) {
		return dao.getTotal(sns);
	}

	public List<SnsBoard> list(SnsBoard sns) {
		return dao.list(sns);
	}

	public int insert(Runner runner) {
		
		return dao.insert(runner);
	}

	public Runner getMember(String user_id) {
		return dao.getMember(user_id);
	}

	public int idcheck(String id) {
		return dao.idcheck(id);
	}

	public int nicknamecheck(String nickname) {
		return dao.nicknamecheck(nickname);
	}

}
