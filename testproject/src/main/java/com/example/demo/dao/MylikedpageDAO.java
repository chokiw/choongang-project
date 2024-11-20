package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.SnsBoard;

@Mapper
public interface MylikedpageDAO {

	List<SnsBoard> getLikedPosts(SnsBoard sb);

	int getTotalLiked(String userId);

}
