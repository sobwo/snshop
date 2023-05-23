package com.myteam.myapp.persistance;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.ProductImgVo;

public interface ShopService_Mapper {
	
	public ArrayList<GoodsVo> goodsSelectAll();
	
	public GoodsVo goodsSelectOne(int goodsNo);
	
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);
	
	public ArrayList<GoodsVo> filterList(@Param("filter") List<String> filter,@Param("value") int value);
	
	
	//관심품목
	
	public int interestCnt(int memberNo, int goodsNo);
	
	public int deleteInterest(int memberNo, int goodsNo);
	
	public int insertInterest(int memberNo, int goodsNo, String size);
	
	public int updateInterest(int goodsNo, @Param("value") int value);
	
	public ArrayList<InterestVo> selectInterestAll(int memberNo);
}
