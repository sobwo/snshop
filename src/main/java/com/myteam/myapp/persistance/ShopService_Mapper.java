package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.ProductImgVo;

public interface ShopService_Mapper {
	
	public ArrayList<GoodsVo> goodsSelectAll();
	
	public GoodsVo goodsSelectOne(int goodsNo);
	
	public ArrayList<ProductImgVo> imgSelectAll();
	
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);

}
