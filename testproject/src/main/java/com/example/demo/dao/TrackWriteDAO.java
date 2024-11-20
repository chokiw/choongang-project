package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface TrackWriteDAO {

	int getTotalfromrd(String user_id);

	int insertSns(SnsBoard board);

	List<Runner_data> listfromrd(Runner_data rd);

	Runner_data getrd(int int1);

	Coordinate[] getc(int int1);
}
