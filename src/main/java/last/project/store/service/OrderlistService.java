package last.project.store.service;

import java.util.List;
import java.util.Map;

import last.project.store.domain.OrderListVo;

public interface OrderListService {
    void insertBy1(OrderListVo orderListVo);

    void insertBy2(OrderListVo orderListVo);

    void insertByTest(OrderListVo orderListVo);

    void insertBy3(OrderListVo orderListVo);

    List<OrderListVo> selectAll(String scode);

    List<Map<String, Object>> select1(String scode);

    void updateByOseq(long oseq);

    void updateCancel(long oseq);
}
