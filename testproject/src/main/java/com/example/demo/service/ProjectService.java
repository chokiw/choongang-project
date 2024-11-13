package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ProjectDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
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

	public SnsBoard getboard(int int1) {
		return dao.getboard(int1);
	}

	public Runner_data getrdata(int runner_data_no) {
		return dao.getrdata(runner_data_no);
	}

	public Coordinate[] getcdata(int runner_data_no) {
		return dao.getcdata(runner_data_no);
	}

	public int getTotalfromrd(String user_id) {
		return dao.getTotalfromrd(user_id);
	}

	public List<Runner_data> listfromrd(Runner_data rd) {
		return dao.listfromrd(rd);
	}

	public Runner findid(Runner runner) {

		return dao.findid(runner);
	}

	public Runner findpass(Runner runner) {

		return dao.findpass(runner);
	}

	public List<SnsBoard> getLikedPostsByUserId(String user_id) {
		return dao.getLikedPostsByUserId(user_id);
	}

}
