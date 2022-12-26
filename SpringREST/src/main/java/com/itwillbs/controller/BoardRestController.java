package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BoardVO;

@RestController
@RequestMapping("/boards")
public class BoardRestController {
	// 이 컨트롤러의 역할? 
	// Board 데이터에 대한 정보를 (주로 JSON 형태로)처리해주는 객체
	
	private static final Logger mylog = LoggerFactory.getLogger(BoardRestController.class);
	
	
	
	// 글쓰기 메서드 		POST방식, /boards+데이터
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> addBoard(@RequestBody BoardVO vo) throws Exception {
		mylog.debug("addBoard() 실행");
		mylog.debug("서비스 객체 - 글쓰기 메서드 호출");
		
		mylog.debug("글쓰기 정보(전달정보) : " + vo); 
		
		mylog.debug("service.insertBoard(vo) 호출");
		
		if(vo == null) {	// 글쓰기 실패
			return new ResponseEntity<String>("X", HttpStatus.BAD_REQUEST);
		} else {
			// vo != null 
			// 글쓰기 성공!
			return new ResponseEntity<String>("O", HttpStatus.OK);
		}
		
	}
	
	
	// 글 조회 메서드 		GET방식, /boards/100
	@RequestMapping(value="/{bno}", method=RequestMethod.GET)
	public BoardVO getBoard(@PathVariable("bno") int bno) throws Exception{
		mylog.debug("getBoard() 호출");
		
		mylog.debug("서비스 - getBoard("+bno+") 호출");
		// 리턴 결과 (vo)
		BoardVO resultVO = new BoardVO();
		resultVO.setBno(bno);
		resultVO.setTitle("100번 글 제목");
		resultVO.setContent("100번 글 내용");
		resultVO.setWriter("100번 글 작성자");

		
		return resultVO;
	}
	
	
	// 글 리스트
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public List<BoardVO> getBoardList() throws Exception{
		
		mylog.debug("getBoardList()호출 완");
		
		// 서비스에 있는 getBoardList() 호출 정보 리턴!
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		for(int i = 100; i <110; i++) {
			BoardVO resultVO = new BoardVO();
			resultVO.setBno(i);
			resultVO.setTitle(i+"번 글 제목");
			resultVO.setContent(i+"번 글 내용");
			resultVO.setWriter(i+"번 글 작성자");
			boardList.add(resultVO);
			
		}
		
		return boardList;
	}
	
}
