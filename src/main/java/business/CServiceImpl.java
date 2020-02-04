package business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CartDAO;
import vo.CartVO;

@Service
public class CServiceImpl implements CService {
	@Autowired
	CartDAO dao;	
	
	@Override
	public int infoToCart(CartVO vo) {
		return dao.infoToCart(vo);
	}
	@Override
	public CartVO findDupGoods(CartVO vo) {
		return dao.findDupGoods(vo);
	}
}
