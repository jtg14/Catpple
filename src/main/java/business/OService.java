package business;

import vo.OrderVO;

public interface OService {

	int insertOrder(OrderVO vo);
	
	OrderVO findOrder(int oNum);
}
