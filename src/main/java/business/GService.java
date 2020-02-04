package business;

import java.util.ArrayList;

import vo.GoodsVO;

public interface GService {
	
	int goodsInsert(GoodsVO vo);
	
	ArrayList<GoodsVO> goodsSearch(String keyword);
	
	ArrayList<GoodsVO> myGoodsList(GoodsVO vo);
	
	GoodsVO goodsDetail (GoodsVO vo);
	
	int goodsUpdate(GoodsVO vo);
}
