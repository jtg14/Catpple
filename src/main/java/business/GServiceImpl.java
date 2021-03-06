package business;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import criteria.Criteria;
import dao.GoodsDAO;
import vo.GoodsVO;

@Service
public class GServiceImpl implements GService {
	
	@Autowired
	GoodsDAO dao;
	
	@Override
	public int goodsInsert(GoodsVO vo) {
		return dao.goodsInsert(vo);
	}
	@Override
	public ArrayList<GoodsVO> goodsSearch(String keyword) {
		return dao.goodsSearch(keyword);
	}
	@Override
	public GoodsVO goodsDetail(GoodsVO vo) {
		
		return dao.goodsDetail(vo);
	}
	@Override
	public ArrayList<GoodsVO> myGoodsList(GoodsVO vo) {
		return dao.myGoodsList(vo);
	}
	@Override
	public int goodsUpdate(GoodsVO vo) {
		return dao.goodsUpdate(vo);
	}
	@Override
	public ArrayList<GoodsVO> homeGoodsList() {
		return dao.homeGoodsList();
	}
	@Override
	public ArrayList<GoodsVO> homeRecomList() {
		return dao.homeRecomList();
	}
	
	//게시글의 개수
	@Override
	public int listCount() {
		return dao.listCount();
	}
	
	//내가 등록한 상품
	@Override
	public ArrayList<GoodsVO> goodsMyListCri(Criteria cri) {
		return dao.goodsMyListCri(cri);
	}
	
	
}
