package com.myteam.myapp.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.ProductImgVo;
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
		
		//상품 개별 선택
		@Override
		public GoodsVo goodsSelectOne(int goodsNo) {
			
			GoodsVo gv = new GoodsVo();
			
			gv = ssm.goodsSelectOne(goodsNo);

			return gv;
		}
			

		//상품 개별 이미지
		@Override
		public ArrayList<ProductImgVo> imgSelectOne(int goodsNo) {
			
			ArrayList<ProductImgVo> pivList = ssm.imgSelectOne(goodsNo);
			
			return pivList;
		}
		
		@Override
		public ArrayList<GoodsVo>filterList(List<String> filter,int value){

			ArrayList<GoodsVo> filterResult = ssm.filterList(filter,value);
		
			return filterResult;
		}

		@Override
		public int interestCheck(int memberNo, int goodsNo, String size) {
			int cnt = ssm.interestCnt(memberNo,goodsNo);
			int value = 0;
			
			if(cnt == 0) {
				value=ssm.insertInterest(memberNo, goodsNo, size);
				ssm.updateInterest(goodsNo,1);
			}
			else {
				value=ssm.deleteInterest(memberNo, goodsNo);
				ssm.updateInterest(goodsNo,2);
			}
			
			return value;
		}

		@Override
		public ArrayList<InterestVo> selectInterestAll(int memberNo) {
			
			ArrayList<InterestVo> ilist = ssm.selectInterestAll(memberNo);
			
			return ilist;
		}


}