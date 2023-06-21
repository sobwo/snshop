package com.myteam.myapp.service;


import java.util.ArrayList;

import com.myteam.myapp.domain.BoardVo;
import com.myteam.myapp.domain.HashTagVo;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.LikesVo;

public interface BoardService {

	public int boardInsert(BoardVo bv);

	public ArrayList<LikesDto> boardList(int memberNo);
	
	public int likesList(LikesVo lv);

	public int likesCnt(int memberNo, int boardNo);

	public int insertLike(LikesVo lv);
	
	public int updateLike(LikesVo lv);

	public int likesTotalCntUpdate(int boardNo);

	public int likesTotalCnt(int boardNo);

	public BoardVo boardSelectOne(int boardNo);

	public int boardModifyUpdate(BoardVo bv);

	public int hashTagInsert(HashTagVo hv);

	public int hashTagList(HashTagVo hv);

	public int tagCntUpdate(HashTagVo hv);

	public int insertBoardHashTag(int boardNo, int hashTagNo);

	public int hashTagList2(HashTagVo hv);

//	public ArrayList<HashTagVo> hashtagBoard(int boardNo);




	
}
