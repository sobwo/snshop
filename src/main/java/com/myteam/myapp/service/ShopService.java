package com.myteam.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeVo;

public interface ShopService {
		//상품 전체
	public ArrayList<GoodsVo> goodsSelectAll();
		//상품 개별 선택
	public GoodsVo goodsSelectOne(int goodsNo);
		//개별 상품 이미지	
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);
		//카테고리 필터	
	public ArrayList<GoodsVo>filterList(List<String> filter,int value);
		//상품정렬필터
	public ArrayList<GoodsVo>alignList(List<String> filter, int value, int index);
		//추천상품 
	public ArrayList<GoodsVo>recommentList(GoodsVo gv);
		//개별 상품 사이즈
	public ArrayList<SizeVo>sizeList(int goodsNo);
	
	public int interestCheck(int memberNo, int goodsNo,String size);
	
	public ArrayList<InterestVo> selectInterestAll(int memberNo);
}
