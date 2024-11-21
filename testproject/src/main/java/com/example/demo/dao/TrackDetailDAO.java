package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Good;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

@Mapper
public interface TrackDetailDAO {

   SnsBoard getboard(int int1);

   List<Good> get_good(@Param("sns_no") int sns_no);

   String getUserPhoto(int int1);

   String getNickName(int int1);

   Runner_data getrdata(int runner_data_no);

   Coordinate[] getcdata(int runner_data_no);

   int checkGood(@Param("user_id") String user_id, @Param("sns_no") int sns_no);

   int good_minus(@Param("user_id") String user_id, @Param("sns_no") int sns_no);

   int good_delete(@Param("user_id") String user_id, @Param("sns_no") int sns_no);

   int good_insert(@Param("user_id") String user_id, @Param("sns_no") int sns_no);

   int good_plus(@Param("user_id") String user_id, @Param("sns_no") int sns_no);

   void read(String sns_no);

}
