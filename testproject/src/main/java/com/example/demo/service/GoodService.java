package com.example.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dao.GoodDAO;
import com.example.demo.model.Good;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GoodService {

    private final GoodDAO goodDAO;
    
    public Good get_good(int sns_no) {
    	return goodDAO.get_good(sns_no);
    }
    
    @Transactional
    public boolean toggleGood(String user_id, int sns_no) {
        boolean hasLiked = goodDAO.checkGood(user_id, sns_no) > 0;
        System.out.println("user_id: " + user_id + ", sns_no: " + sns_no);

        if (hasLiked) {
            int deleteResult = goodDAO.good_delete(user_id, sns_no);
            int minusResult = goodDAO.good_minus(user_id, sns_no);

            if (deleteResult > 0 && minusResult > 0) {
                return false; // 추천 취소 상태
            } else {
                throw new RuntimeException("좋아요 취소에 실패했습니다.");
            }
        } else {
            int insertResult = goodDAO.good_insert(user_id, sns_no);
            int plusResult = goodDAO.good_plus(user_id, sns_no);
            System.out.println("insertResult: " + insertResult + ", plusResult: " + plusResult);
            if (insertResult > 0 && plusResult > 0) {
                return true; // 추천 상태
            } else {
                throw new RuntimeException("좋아요 추가에 실패했습니다.");
            }
        }
    }
}
