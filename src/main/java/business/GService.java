package business;

import java.util.ArrayList;

import vo.GoodsVO;

public interface GService {
	
	int goodsInsert(GoodsVO vo);
	
	ArrayList<GoodsVO> goodsSearch(String keyword);
	
	GoodsVO goodsDetail (GoodsVO vo);
}
