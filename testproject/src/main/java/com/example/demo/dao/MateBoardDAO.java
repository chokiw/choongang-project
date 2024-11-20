package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.RecruitBoard;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface MateBoardDAO {

	int getrecruitTotal(RecruitBoard recruit);

	List<SnsBoard> recruitList(RecruitBoard recruit);

}
