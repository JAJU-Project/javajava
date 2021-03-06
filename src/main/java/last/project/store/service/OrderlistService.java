package last.project.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import last.project.store.domain.OrderListVo;

public interface OrderListService {

    List<OrderListVo> selectAll(HashMap<String, Object> map);

    List<OrderListVo> selectAlls(HashMap<String, Object> map);

    List<Map<String, Object>> select1(String scode);

    List<OrderListVo> selectAll2(HashMap<String, Object> map);

    void updateByOseq(long oseq);

    void updateCancel(long oseq);

    void updateCompletion(long oseq);

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

    List<OrderListVo> selectByScode(String scode);

    List<OrderListVo> selectByKid(String scode, String kid);

    List<OrderListVo> selectAllClient(HashMap<String, Object> map);
}
