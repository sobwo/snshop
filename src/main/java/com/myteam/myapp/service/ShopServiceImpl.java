package com.myteam.myapp.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.persistance.ShopService_Mapper;

@Service("ShopServiceImpl")
public class ShopServiceImpl implements ShopService {

	private ShopService_Mapper ssm;
	@Autowired
	public ShopServiceImpl(SqlSession sqlSession) {
		
		this.ssm = sqlSession.getMapper(ShopService_Mapper.class);
		
	}
	
	//상품 전체 리스트 출력
		@Override
		public ArrayList<GoodsVo> goodsSelectAll() {
			
			ArrayList<GoodsVo> goodsList = ssm.goodsSelectAll();
			
			return goodsList;
		}

			//상품 개별 선택
		@Override
		public GoodsVo goodsSelectOne(int goodsNo) {
			
			GoodsVo gv = new GoodsVo();
			
			gv = ssm.goodsSelectOne(goodsNo);

			return gv;
		}
			
			//상품 이미지 전체 출력
		@Override
		public ArrayList<ProductImgVo> imgSelectAll() {
			
			ArrayList<ProductImgVo> imgList = ssm.imgSelectAll();
			
			return imgList;
		}
			
			//상품 개별 이미지
		@Override
		public ArrayList<ProductImgVo> imgSelectOne(int goodsNo) {
			
			ArrayList<ProductImgVo> pivList = ssm.imgSelectOne(goodsNo);
			
			return pivList;
		}

}