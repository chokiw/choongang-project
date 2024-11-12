package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface ProjectDAO {

	int getTotal(SnsBoard sns);

	List<SnsBoard> list(SnsBoard sns);

	int insert(Runner runner);

	Runner getMember(String user_id);

	int idcheck(String id);

	int nicknamecheck(String nickname);

	SnsBoard getboard(int int1);

	Runner_data getrdata(int runner_data_no);

	Coordinate[] getcdata(int runner_data_no);

}
