package com.myteam.myapp.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.myapp.domain.GoodsInterestDto;
import com.myteam.myapp.domain.GoodsVo;
import com.myteam.myapp.domain.InterestVo;
import com.myteam.myapp.domain.InventoryVo;
import com.myteam.myapp.domain.LikesDto;
import com.myteam.myapp.domain.ProductDto;
import com.myteam.myapp.domain.ProductImgVo;
import com.myteam.myapp.domain.SizeDto;
import com.myteam.myapp.domain.SizeVo;
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
		public ArrayList<ProductDto> filterList(List<String> filter, int value, int page,int price) {

			HashMap<String, Object> hashMap = new HashMap<String, Object>();

			hashMap.put("filter", filter);
			hashMap.put("value", value);
			hashMap.put("page", page);
			hashMap.put("price", price);
			
			List<Integer> goodsNoList = ssm.searchResult(hashMap);
			
			int index =0;
			
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("list", goodsNoList);
			data.put("align",index);

			ArrayList<ProductDto> filterResult = ssm.filterList(data);

			return filterResult;
		}
		@Override
		public int goodsTotal(List<String> filter, int value, int page, int price) {
			
			int total;
			
			HashMap<String, Object> hashMap = new HashMap<String, Object>();

			hashMap.put("filter", filter);
			hashMap.put("value", value);
			hashMap.put("page", page);
			hashMap.put("price", price);
			
			total = ssm.goodsTotal(hashMap);
			
			return total;
		}
		@Override
		public ArrayList<ProductDto> priceAlign(List<String> filter, int value, int page, int price) {
			
			HashMap<String,Object>  hashMap = new HashMap<String,Object>();
			hashMap.put("filter",filter);
			hashMap.put("value",value);
			hashMap.put("page",page);
			hashMap.put("index",null);
			hashMap.put("price", price);
			
			List<Integer> goodsNoList = ssm.searchResult(hashMap);
			
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			data.put("list", goodsNoList);
			data.put("align",null);

			ArrayList<ProductDto> priceAlign = ssm.filterList(data);
			
			return priceAlign;
		}
		@Override
		public ArrayList<ProductDto> alignList(List<String> filter, int value, int index, int page) {

			HashMap<String, Object> hashMap = new HashMap<String, Object>();

			hashMap.put("filter", filter);
			hashMap.put("value", value);
			hashMap.put("page", page);
			
			List<Integer> goodsNoList = ssm.searchResult(hashMap);
			
			HashMap<String, Object> data = new HashMap<String, Object>();			
			
			data.put("list", goodsNoList);
			data.put("align",index);

			ArrayList<ProductDto> alignList = ssm.filterList(data);

			return alignList;
		}
		
		@Override
		public ProductDto sellSelect(int goodsNo) {
			
			ProductDto pd = ssm.sellSelect(goodsNo);
			
			return pd;
		}
		
		@Override
		public ArrayList<LikesDto> shopReviewList(int goodsNo) {
			
			ArrayList<LikesDto> reviewList = ssm.shopReviewList(goodsNo);
			
			return reviewList;
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
		public ArrayList<SizeDto> sizeListAll(int goodsNo) {
			
			ArrayList<SizeDto> sizeList = ssm.sizeListAll(goodsNo);
			return sizeList;
			
		}

		@Override
		public int interestAction(InterestVo iv) {
			int value = ssm.interestListCnt(iv);
			int value2 = 0;
			int result = 0;
			int result2 = 0;
			
			if(value == 0)
				value2 = ssm.insertInterest(iv);
			else
				value2 = ssm.updateInterest(iv);
			
			if(value2 == 1) {
				int cnt = ssm.selectCheckM(iv.getGoodsNo());
				if(cnt==3)
					result = ssm.minusCheckM(iv.getGoodsNo());
				else
					result = ssm.plusCheckM(iv.getGoodsNo());
				
				System.out.println("checkM result : "+result);
				result2 = ssm.updateGoodsInterest(iv.getGoodsNo());
			}
			
			
			return result+result2;
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
		
		@Transactional
		@Override
		public int goodsInsert(GoodsVo gv, String size, int quantity) {
			int value = ssm.goodsInsert(gv);
			int value2 = 0;
			int value3 = 0;
			
			SizeVo sv = new SizeVo();
			InventoryVo iv = new InventoryVo(); 
			
			if(value==1) {
				int goodsNo = ssm.goodsNoSelect(gv.getMemberNo());
				System.out.println("goodsNo = "+goodsNo);
				sv.setGoodsNo(goodsNo);
				sv.setSizeName(size);
				value2 = ssm.sizeInsert(sv);
				
				if(value2 == 1) {
					int sizeNo = ssm.sizeNoSelect(sv);
					System.out.println("sizeNo = "+sizeNo);
					iv.setGoodsNo(goodsNo);
					iv.setSizeNo(sizeNo);
					iv.setQuantity(quantity);
					int cnt = ssm.inventoryCheck(iv);
					
					
					if(cnt == 0)
						value3 = ssm.inventoryInsert(iv);
					else
						value3 = ssm.inventoryUpdate(iv);
				}
			}
			
			return value3;
		}

		
//		@Override
//		public int interestCancel(int memberNo, int goodsNo) {
//			int value = ssm.interestCancel(memberNo, goodsNo);
//			int result = 0;
//			if(value == 1) {
//				int value2 = ssm.selectCheckM(goodsNo);
//				
//				if(value2 == 0)
//					 result = ssm.updateCheckM(goodsNo);
//			}
//			
//			return result;
//		}

//		@Override
//		public int interestCnt(int goodsNo) {
//			int value = ssm.interestCnt(goodsNo);
//			return value;
//		}
}