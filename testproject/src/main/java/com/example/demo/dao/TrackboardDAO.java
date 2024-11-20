package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.SnsBoard;

@Mapper
public interface TrackboardDAO {
	List<SnsBoard> listBest(SnsBoard sns);

	int getTotal(SnsBoard sns);

	List<SnsBoard> list(SnsBoard sns);
}
