package com.myteam.myapp.persistance;

import java.util.ArrayList;

import com.myteam.myapp.domain.GoodsVo;

public interface ShopService_Mapper {
	
	public ArrayList<GoodsVo> goodsSelectAll();
	
	public GoodsVo goodsSelectOne(int goodsNo);

}
