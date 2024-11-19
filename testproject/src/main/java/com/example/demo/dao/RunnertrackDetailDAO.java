package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;

@Mapper
public interface RunnertrackDetailDAO {

	Runner_data getRunnerData(int runner_data_no);

	Coordinate[] getCoordData(int runner_data_no);

}
