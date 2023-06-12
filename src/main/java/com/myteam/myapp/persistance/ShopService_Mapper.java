package com.myteam.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.myteam.myapp.domain.GoodsInterestDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeDto;

public interface ShopService_Mapper {
		//상품 전체
	public ArrayList<GoodsVo> goodsSelectAll();
		//상품 개별 선택
	public GoodsVo goodsSelectOne(int goodsNo);
		//개별 상품 이미지
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);
		//카테고리 필터
	public ArrayList<ProductDto> filterList(HashMap<String, Object> data);
	
	public ArrayList<Integer> searchResult(HashMap<String, Object> hashMap);
		//상품정렬필터
	public ArrayList<ProductDto>alignList(HashMap<String, List<Integer>> data);
		//추천상품 
	public ArrayList<ProductDto>recommentList(HashMap<String, Object> hashMap);
		//개별 상품 사이즈
	public ArrayList<SizeDto>sizeList(int goodsNo);
	
	public ArrayList<ProductDto> trandList();
	
	public ProductDto sellSelect(int goodsNo);
	
	public int goodsTotal(HashMap<String, Object> hashMap);	
	//관심품목
	public int interestListCnt(InterestVo iv);
	public int insertInterest(InterestVo iv);
	public int updateInterest(InterestVo iv);
	public int updateGoodsInterest(int goodsNo);
	public int interestCheck(InterestVo iv);
	public int interestGoodsCheck(int goodsNo, int memberNo);
	public ArrayList<GoodsInterestDto> selectInterestAll(int memberNo);
	public int interestCancel(int memberNo, int goodsNo);
	public int plusCheckM(int goodsNo);
	public int minusCheckM(int goodsNo);
	public int selectCheckM(int goodsNo);
}
