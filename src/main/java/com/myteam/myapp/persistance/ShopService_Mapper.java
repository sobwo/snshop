package com.myteam.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestDto;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeVo;

public interface ShopService_Mapper {
		//상품 전체
	public ArrayList<GoodsVo> goodsSelectAll();
	
		//상품 개별 선택
	public GoodsVo goodsSelectOne(int goodsNo);
		//개별 상품 이미지
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);
		//카테고리 필터
	public ArrayList<ProductDto> filterList(@Param("filter") List<String> filter,@Param("value") int value);
		//상품정렬필터
	public ArrayList<ProductDto>alignList(@Param("filter") List<String> filter,@Param("value") int value,@Param("index") int index);
		//추천상품 
	public ArrayList<ProductDto>recommentList(HashMap<String, Object> hashMap);
		//개별 상품 사이즈
	public ArrayList<SizeVo>sizeList(int goodsNo);
		//관심품목
	
	public int interestCnt(int memberNo, int goodsNo);
	
	public int deleteInterest(int memberNo, int goodsNo);
	
	public int insertInterest(int memberNo, int goodsNo, String size);
	
	public int updateInterest(int goodsNo, @Param("value") int value);
	
	public ArrayList<InterestDto> selectInterestAll(int memberNo);
}
