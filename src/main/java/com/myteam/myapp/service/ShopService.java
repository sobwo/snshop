package com.myteam.myapp.service;

import java.util.ArrayList;

import com.myteam.myapp.domain.GoodsVo;

public interface ShopService {
	
	public ArrayList<GoodsVo> goodsSelectAll();

	public GoodsVo goodsSelectOne(int goodsNo);
	
}
