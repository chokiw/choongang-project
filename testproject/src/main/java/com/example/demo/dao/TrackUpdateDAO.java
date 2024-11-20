package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface TrackUpdateDAO {

	SnsBoard getboard(int int1);

	Runner_data getrdata(int runner_data_no);

	Coordinate[] getcdata(int runner_data_no);

	int updateboard(SnsBoard sns);
}
