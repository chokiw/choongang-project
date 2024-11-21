package com.example.demo.controller.MainPage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Runner;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.MainpageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class MainpageController {
	private final MainpageService service;

	// 메인페이지로 이동
	@RequestMapping("/mainpage")
	public String mainpage(Runner runner, Model model, Runner_data data, SnsBoard sns) {
		List<Runner> rundata = service.rundata(runner);

		// 달린거리가 가장 많은 랭킹 5명
		// 최대 5개의 닉네임을 개별적으로 가져옵니다.
		for (int i = 0; i < Math.min(5, rundata.size()); i++) {
			String nickname = rundata.get(i).getUser_nickname();
			model.addAttribute("userNickname" + (i + 1), nickname);
		}

		// 5개의 달린거리를 가져온다.
		for (int i = 0; i < Math.min(5, rundata.size()); i++) {
			double distanceInMeters = Double.parseDouble(rundata.get(i).getDistance()); // distance가 m값이라 km값으로 바꾸기 위해
																						// double로 형변환

			double distanceInKm = distanceInMeters / 1000.0;
			// 소수점 둘째 자리까지 반올림
			String formattedDistance = String.format("%.2f", distanceInKm);
			model.addAttribute("userDistance" + (i + 1), formattedDistance);
		}

		// 5개의 프로필이미지를 가져온다.
		for (int i = 0; i < Math.min(5, rundata.size()); i++) {
			String userprofileimg = rundata.get(i).getUser_photo();
			model.addAttribute("userProfileimg" + (i + 1), userprofileimg);
		}

		model.addAttribute("rundata", rundata);

		// 추천수를 가장 많이 받은 글 3개
		List<SnsBoard> routedata = service.routedata();
		int RankNum = routedata.size();
		List<Runner_data> rankRd = new ArrayList<Runner_data>();
		List<Runner> rankUd = new ArrayList<Runner>();
		for(int i=0;i<RankNum;i++) {
			
			rankRd.add(service.getRankRd(routedata.get(i).getRunner_data_no()));
			rankUd.add(service.getRankUd(routedata.get(i).getUser_id()));
		}
		
		List<Coordinate[]> c = new ArrayList<Coordinate[]>();
		for(int i=0;i<RankNum;i++) {
			c.add(service.getRankCd(routedata.get(i).getRunner_data_no()));
		}
		
		model.addAttribute("RankNum",RankNum);
		model.addAttribute("routedata",routedata);
		model.addAttribute("rankRd",rankRd);
		model.addAttribute("rankUd",rankUd);
		for(int i=0;i<RankNum;i++) {
			model.addAttribute("c"+i,c.get(i));
		}
		return "/mainpage/mainpage";
	}
}
