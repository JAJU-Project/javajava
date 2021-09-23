package last.project.store.service;

import java.util.List;
import java.util.Map;

import last.project.store.domain.OrderListVo;

public interface OrderListService {

    List<OrderListVo> selectAll(String scode);

    List<OrderListVo> selectAlls(String scode);

    List<Map<String, Object>> select1(String scode);

    void updateByOseq(long oseq);

    void updateCancel(long oseq);

    void insertBy1(OrderListVo orderListVo);

    void insertBy2(OrderListVo orderListVo);

    void insertBy3(OrderListVo orderListVo);

    void insertBy4(OrderListVo orderListVo);

    void insertBy5(OrderListVo orderListVo);

    void insertBy6(OrderListVo orderListVo);

    void insertBy7(OrderListVo orderListVo);

    void insertBy8(OrderListVo orderListVo);

    void insertBy9(OrderListVo orderListVo);

    void insertBy10(OrderListVo orderListVo);

}
