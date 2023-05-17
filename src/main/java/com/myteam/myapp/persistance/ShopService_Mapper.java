package com.myteam.myapp.persistance;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.ProductImgVo;

public interface ShopService_Mapper {
	
	public ArrayList<GoodsVo> goodsSelectAll();
	
	public GoodsVo goodsSelectOne(int goodsNo);
	
	public ArrayList<ProductImgVo> imgSelectAll();
	
	public ArrayList<ProductImgVo> imgSelectOne(int goodsNo);
	
	public ArrayList<GoodsVo> filterList(@Param("filter") List<String> filter,@Param("value") int value);
	
}
