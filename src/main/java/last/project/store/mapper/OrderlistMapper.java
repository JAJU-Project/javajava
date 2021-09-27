package last.project.store.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.OrderListVo;

@Repository
@Mapper
public interface OrderListMapper {
    void updateByOseq(long oseq);

    void updateCancel(long oseq);

    List<OrderListVo> selectAll(String scode);

    List<OrderListVo> selectAlls(String scode);

    List<Map<String, Object>> select1(String scode);

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

}
