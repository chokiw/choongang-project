package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface MainpageDAO {

	List<Runner> rundata(Runner runner);

	List<SnsBoard> routedata();

	Runner_data getRankRd(int runner_data_no);

	Runner getRankUd(String user_id);

	Coordinate[] getRankCd(int runner_data_no);
}
