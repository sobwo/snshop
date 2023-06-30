package com.myteam.myapp.persistance;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.myteam.myapp.domain.GoodsInterestDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.InventoryVo;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeDto;
import com.myteam.myapp.domain.SizeVo;

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
	public ArrayList<SizeDto>sizeList(int memberNo, int goodsNo);
	
	public ArrayList<SizeDto>sizeListAll(int goodsNo);	
	
	public ArrayList<LikesDto> shopReviewList(HashMap<String, Object> hm);
	
	public ArrayList<ProductDto> trandList();
	public ArrayList<ProductDto> trandImgList();
	
	public int ReviewTotal(int goodsNo);
	
	public ProductDto sellSelect(int goodsNo);
	
	public int goodsTotal(HashMap<String, Object> hashMap);
	
	public int goodsDelete(int goodsNo);
	
	//관심품목
	public int interestListCnt(InterestVo iv);
	public int insertInterest(InterestVo iv);
	public int updateInterest(InterestVo iv);
	public int updateGoodsInterest(InterestVo iv);
	public int interestCheck(InterestVo iv);
	public int interestGoodsCheck(int goodsNo, int memberNo);
	public ArrayList<GoodsInterestDto> selectInterestAll(int memberNo);
	public int interestCancel(int memberNo, int goodsNo);
	public int plusCheckM(InterestVo iv);
	public int minusCheckM(InterestVo iv);
	public int selectCheckM(InterestVo iv);
	public int countInterest(InterestVo iv);
	//상품 등록
	public int goodsInsert(GoodsVo gv);
	public int goodsNoSelect(int memberNo);
	public int sizeInsert(SizeVo sv);
	public int sizeNoSelect(SizeVo sv);
	public int inventoryCheck(InventoryVo iv);
	public int inventoryInsert(InventoryVo iv);
	public int inventoryUpdate(InventoryVo iv);
}
