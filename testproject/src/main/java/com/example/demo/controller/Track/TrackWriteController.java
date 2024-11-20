package com.example.demo.controller.Track;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Coordinate;
import com.example.demo.model.Member;
import com.example.demo.model.Runner_data;
import com.example.demo.model.SnsBoard;
import com.example.demo.service.PagingPgm;
import com.example.demo.service.TrackWriteService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class TrackWriteController {
	private final TrackWriteService service;

	@RequestMapping("/sns_write")
	public String sns_write() {
		return "track/trackWrite/sns_write";
	}

	// sns글 쓸때 자신의 데이터를 게시판 형태로 보기위한 서비스코드
	@RequestMapping("/sns_write_list")
	public String sns_write_list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		Runner_data rd = new Runner_data();
		rd.setUser_id(member.getUser_id());
		final int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);

		int total = service.getTotalfromrd(member.getUser_id());
		System.out.println("total:" + total);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

		rd.setStartRow(startRow);
		rd.setEndRow(endRow);
		int no = total - startRow + 1;
		System.out.println("no:" + no);
		List<Runner_data> list = service.listfromrd(rd);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);

		return "track/trackWrite/sns_write_list";
	}

	// 트랙 글쓰기
	@RequestMapping("/sns_writing")
	public String sns_writing(SnsBoard board, Model model) {

		int result = service.insertSns(board);

		model.addAttribute("result", result);
		return "track/trackWrite/sns_writingresult";
	}

	// 트랙과 모집에 글쓰기할때 지도에 데이터를 불러오기 위해서 필요한 컨트롤러
	@RequestMapping("/getMyData")
	@ResponseBody
	public List getMyData(@RequestParam(value = "runner_data_no") String runner_data_no) {
		List list = new ArrayList();

		Runner_data rd = service.getrd(Integer.parseInt(runner_data_no));
		Coordinate[] cd = service.getc(Integer.parseInt(runner_data_no));

		String[] cdarr = new String[cd.length * 2];

		int i = -1;
		for (Coordinate c : cd) {
			cdarr[++i] = c.getLat();
			cdarr[++i] = c.getLng();
		}

		list.add(cdarr);
		list.add(rd.getRunner_data_distance());
		list.add(rd.getRunner_data_time());

		return list;
	}
}
