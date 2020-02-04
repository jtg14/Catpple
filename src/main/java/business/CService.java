package business;

import java.util.ArrayList;

import vo.BoardVO;
import vo.CartVO;
import vo.PageVO;

public interface CService {
	int infoToCart(CartVO vo);
	
	CartVO findDupGoods(CartVO vo);
}
