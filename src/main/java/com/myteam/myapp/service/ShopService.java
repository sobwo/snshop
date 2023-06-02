package com.myteam.myapp.service;

import java.util.ArrayList;
import java.util.List;

import com.myteam.myapp.domain.GoodsInterestDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeDto;

public interface ShopService {
		//상품 전체
	public ArrayList<GoodsVo> goodsSelectAll();
		//상품 개별 선택
	public GoodsVo goodsSelectOne(int goodsNo);
		//개별 상품 이미지	
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);
	//트렌드 상품 리스트
	public ArrayList<ProductDto> trandList();
		//카테고리 필터	
	public ArrayList<ProductDto>filterList(List<String> filter,int value,int page);
		//상품정렬필터
	public ArrayList<ProductDto>alignList(List<String> filter, int value, int index, int page);
		//추천상품 
	public ArrayList<ProductDto>recommentList(GoodsVo gv);
		//개별 상품 사이즈
	public ArrayList<SizeDto>sizeList(int goodsNo);
	
	
	//관심품목
	public int interestAction(InterestVo iv);
	public int interestCheck(InterestVo iv);
//	public int interestCnt(int goodsNo);
	public int interestGoodsCheck(int goodsNo, int memberNo);
	public ArrayList<GoodsInterestDto> selectInterestAll(int memberNo);
}
