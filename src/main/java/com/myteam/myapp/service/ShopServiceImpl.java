package com.myteam.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.GoodsInterestDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeDto;
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
		public ArrayList<ProductDto>filterList(
				List<String> filter,int value,int page){
			
			HashMap<String,Object> hashMap =new HashMap<String, Object>();
			
			hashMap.put("filter",filter);
			hashMap.put("value", value);
			hashMap.put("page", page);

			ArrayList<ProductDto> filterResult = ssm.filterList(hashMap);
		
			return filterResult;
		}
		
		@Override
		public ArrayList<ProductDto> alignList(
				List<String> filter, int value, int index,int page){
			
			HashMap<String,Object> hashMap =new HashMap<String, Object>();
			
			hashMap.put("filter",filter);
			hashMap.put("value", value);
			hashMap.put("index", index);
			
			ArrayList<ProductDto> alignList = ssm.alignList(hashMap);
			
			return alignList;
		}

		@Override
		public ArrayList<ProductDto> recommentList(GoodsVo gv) {

			HashMap<String, Object> hashMap = new HashMap<String, Object>();

			hashMap.put("categoryName", gv.getCategoryName());
			hashMap.put("goodsNo", gv.getGoodsNo());
			
			ArrayList<ProductDto>recommentList = ssm.recommentList(hashMap);

			return recommentList;
		}

		@Override
		public ArrayList<SizeDto> sizeList(int goodsNo) {
			
			ArrayList<SizeDto> sizeList = ssm.sizeList(goodsNo);
			return sizeList;
			
		}

		@Override
		public int interestAction(InterestVo iv) {
			int value = ssm.interestListCnt(iv);
			int value2 = 0;
			int result = 0;
			
			if(value == 0)
				value2 = ssm.insertInterest(iv);
			else
				value2 = ssm.updateInterest(iv);
			
			if(value2 == 1)
				result = ssm.updateGoodsInterest(iv.getGoodsNo());
			
			return result;
		}

		@Override
		public int interestCheck(InterestVo iv) {
			int value = ssm.interestCheck(iv);
			
			return value;
		}

		@Override
		public int interestGoodsCheck(int goodsNo, int memberNo) {
			int value = ssm.interestGoodsCheck(goodsNo, memberNo);
			
			return value;
		}

		@Override
		public ArrayList<GoodsInterestDto> selectInterestAll(int memberNo) {
			ArrayList<GoodsInterestDto> glist = ssm.selectInterestAll(memberNo);
			
			return glist;
		}

		@Override
		public ArrayList<ProductDto> trandList() {
			ArrayList<ProductDto> trandList = ssm.trandList();
			return trandList;
		}

//		@Override
//		public int interestCnt(int goodsNo) {
//			int value = ssm.interestCnt(goodsNo);
//			return value;
//		}
}