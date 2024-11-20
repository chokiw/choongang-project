package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Alarm;
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

	int getTotalfromrd(String user_id);

	List<Runner_data> listfromrd(Runner_data rd);
	
	Runner findid(Runner runner);

	Runner findpass(Runner runner);

	Alarm[] getAlarm(String user_id);

	List<Runner> rundata(Runner runner);

	List<SnsBoard> listBest(SnsBoard sns);

	List<SnsBoard> routedata(SnsBoard sns);

	String getUserPhoto(int sns_no);

	String getNickName(int sns_no);

}
