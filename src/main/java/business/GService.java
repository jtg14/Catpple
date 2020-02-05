package business;

import java.util.ArrayList;

import vo.GoodsVO;

public interface GService {
	
	int goodsInsert(GoodsVO vo);
	
	ArrayList<GoodsVO> goodsSearch(String keyword);
	
	ArrayList<GoodsVO> myGoodsList(GoodsVO vo);
	
	GoodsVO goodsDetail (GoodsVO vo);
	
	int goodsUpdate(GoodsVO vo);
	
	ArrayList<GoodsVO> homeGoodsList();//업로드순 상품
	
	ArrayList<GoodsVO> homeRecomList();//추천리스트
}
