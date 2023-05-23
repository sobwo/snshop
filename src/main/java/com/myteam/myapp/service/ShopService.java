package com.myteam.myapp.service;

import java.util.ArrayList;
import java.util.List;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.ProductImgVo;

public interface ShopService {
	
	public ArrayList<GoodsVo> goodsSelectAll();
	
	public GoodsVo goodsSelectOne(int goodsNo);
	
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);
	
	public ArrayList<GoodsVo>filterList(List<String> filter,int value);
	
	public int interestCheck(int memberNo, int goodsNo,String size);
	
	public ArrayList<InterestVo> selectInterestAll(int memberNo);
}
