package dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import criteria.Criteria;
import vo.GoodsVO;

@Repository
public class GoodsDAO {
	
	@Autowired
	private SqlSession dao;
	private final static String NS ="portfolio.mapper.GoodsMapper.";
	
	public int goodsInsert(GoodsVO vo) {
		return dao.insert(NS+"goodsInsert", vo);
	}
	public ArrayList<GoodsVO> goodsSearch(String keyword){
		return (ArrayList)dao.selectList(NS+"goodsSearch",keyword);
	}
	public GoodsVO goodsDetail(GoodsVO vo) {
		return dao.selectOne("goodsDetail",vo);
	}
	public ArrayList<GoodsVO> myGoodsList(GoodsVO vo){
		return (ArrayList)dao.selectList(NS+"myGoodsList", vo);
	}
	public int goodsUpdate(GoodsVO vo) {
		return dao.update(NS+"goodsUpdate", vo);
	}
	public ArrayList<GoodsVO> homeGoodsList(){
		return (ArrayList)dao.selectList(NS+"homeGoodsList");
	}
	public ArrayList<GoodsVO> homeRecomList(){
		return (ArrayList)dao.selectList(NS+"homeRecomList");
	}
	
	//게시글 갯수
	public int listCount() {
		return dao.selectOne(NS+"listCount");
	}
	
	//내가 등록한 상품
	public ArrayList<GoodsVO> goodsMyListCri(Criteria cri) {
		return (ArrayList)dao.selectList(NS+"goodsMyListCri", cri);
	}
}
