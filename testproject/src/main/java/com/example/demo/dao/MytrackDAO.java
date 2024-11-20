package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;

@Mapper
public interface MytrackDAO {

	int getRunnerTrack(String user_id);

	List<Runner_data> listRunnerTrack(Runner_data runnerdata);

	Runner_data getRunnerData(int runner_data_no);

	Coordinate[] getCoordData(int runner_data_no);

}
