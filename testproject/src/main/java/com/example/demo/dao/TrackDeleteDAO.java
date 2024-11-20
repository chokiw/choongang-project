package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.SnsBoard;

@Mapper
public interface TrackDeleteDAO {

	SnsBoard getboard(int sns_no);

	int deleteboard(SnsBoard sns);

}
