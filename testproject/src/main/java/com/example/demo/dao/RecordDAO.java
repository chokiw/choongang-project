package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;

@Mapper
public interface RecordDAO {

	int setRunnerdata(Runner_data rd);

	void setCoordinate(Coordinate coord);

	Runner getMember_SJL(String user_id);

	void updateRunnerdata(Runner runner);
}
