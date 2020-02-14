package business;

import java.util.ArrayList;

import criteria.Criteria;
import vo.GoodsVO;

public interface GService {
	
	int goodsInsert(GoodsVO vo);
	
	ArrayList<GoodsVO> goodsSearch(String keyword);
	
	ArrayList<GoodsVO> myGoodsList(GoodsVO vo);
	
	GoodsVO goodsDetail (GoodsVO vo);
	
	int goodsUpdate(GoodsVO vo);
	
	ArrayList<GoodsVO> homeGoodsList();//업로드순 상품
	
	ArrayList<GoodsVO> homeRecomList();//추천리스트
	
	//게시글의 개수
	int listCount();
	
	//내가 등록한 상품
	ArrayList<GoodsVO> goodsMyListCri(Criteria cri);
}
