package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.TrackDetailDAO;
import com.example.demo.model.Coordinate;
import com.example.demo.model.Good;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrackDetailService {
	private final TrackDetailDAO dao;

	public SnsBoard getboard(int int1) {
		return dao.getboard(int1);
	}

	public List<Good> get_good(int int1) {
		return dao.get_good(int1);
	}
	
	@Transactional
    public boolean toggleGood(String user_id, int sns_no) {
        boolean hasLiked = true;
        if(dao.checkGood(user_id, sns_no) > 0) {
        	hasLiked=true;
        }else hasLiked=false;
        if (hasLiked) {
            int deleteResult = dao.good_delete(user_id, sns_no);
            int minusResult = dao.good_minus(user_id, sns_no);
            if (deleteResult > 0 && minusResult > 0) {
                return false; // 추천 취소 상태
            } else {
                throw new RuntimeException("좋아요 취소에 실패했습니다.");
            }
            
        } else {
            int insertResult = dao.good_insert(user_id, sns_no);
            int plusResult = dao.good_plus(user_id, sns_no);
            System.out.println("insertResult: " + insertResult + ", plusResult: " + plusResult);
            if (insertResult > 0 && plusResult > 0) {
                return true; // 추천 상태
            } else {
                throw new RuntimeException("좋아요 추가에 실패했습니다.");
            }
        }
    }

	public String getUserPhoto(int int1) {
		return dao.getUserPhoto(int1);
	}

	public String getNickName(int int1) {
		return dao.getNickName(int1);
	}

	public Runner_data getrdata(int runner_data_no) {
		return dao.getrdata(runner_data_no);
	}

	public Coordinate[] getcdata(int runner_data_no) {
		return dao.getcdata(runner_data_no);
	}

	public void read(String sns_no) {
		dao.read(sns_no);
	}
}
