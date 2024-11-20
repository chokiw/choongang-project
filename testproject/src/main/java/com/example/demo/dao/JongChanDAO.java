package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.model.Alarm;
import com.example.demo.model.Apply;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface JongChanDAO {

	int getRunnerTrack(String user_id);

	List<Runner_data> listRunnerTrack(Runner_data runnerdata);

	void getapply(Apply apply);
	
	void getcancelapply(Apply apply);

	void getalarmB(Alarm alarm);

	void getcancelalarm(Alarm alarm);


}
