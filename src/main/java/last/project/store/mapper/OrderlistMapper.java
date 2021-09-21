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

    List<OrderListVo> selectAll(String scode);

    List<Map<String, Object>> select1(String scode);

    void insertBy1(OrderListVo orderListVo);

    void insertBy2(OrderListVo orderListVo);

    void insertByTest(OrderListVo orderListVo);

    void insertBy3(OrderListVo orderListVo);

    void updateCancel(long oseq);

}
