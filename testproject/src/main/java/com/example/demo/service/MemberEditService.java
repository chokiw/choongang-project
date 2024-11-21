package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.MemberEditDAO;
import com.example.demo.model.Runner;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberEditService {
	private final MemberEditDAO membereditDAO;
	
	public Runner membereditview(String user_id) {		
		return membereditDAO.membereditview(user_id);
	}
	
	@Transactional
	public int membereditupdate(Runner runner){
		return membereditDAO.membereditupdate(runner);
	}
	
}
