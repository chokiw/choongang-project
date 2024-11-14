package com.example.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner_data;

@Mapper
public interface SJLDAO {

	Runner_data getrd(int runner_data_no);

	Coordinate[] getc(int runner_data_no);

}
