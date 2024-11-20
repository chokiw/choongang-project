package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Runner;
import com.example.demo.model.SnsBoard;

@Mapper
public interface MainpageDAO {

	List<Runner> rundata(Runner runner);

	List<SnsBoard> routedata(SnsBoard sns);
}
