package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface JongChanDAO {

	int getRunnerTrack(String user_id);

	List<Runner_data> listRunnerTrack(Runner_data runnerdata);




}
