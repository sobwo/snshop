package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.persistance.ShopService_Mapper;

@Service("ShopServiceImpl")
public class ShopServiceImpl implements ShopService {

	private ShopService_Mapper ssm;
	@Autowired
	public ShopServiceImpl(SqlSession sqlSession) {
		
		this.ssm = sqlSession.getMapper(ShopService_Mapper.class);
		
	}
	
	@Override
	public ArrayList<GoodsVo> goodsSelectAll() {
		
		ArrayList<GoodsVo> goodsList = ssm.goodsSelectAll();
		
		return goodsList;
	}

	@Override
	public GoodsVo goodsSelectOne(int goodsNo) {
		
		GoodsVo gv = new GoodsVo();
		
		gv = ssm.goodsSelectOne(goodsNo);

		return gv;
	}

}