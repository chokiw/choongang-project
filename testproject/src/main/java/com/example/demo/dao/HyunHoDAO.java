package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.SnsBoard;

@Mapper
public interface HyunHoDAO {

	int getTotalLiked(String user_id);

	List<SnsBoard> getLikedPosts(Map<String, Object> params);

}
