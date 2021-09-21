package last.project.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.OrderListVo;

@Repository
@Mapper
public interface OrderListMapper {
    void insertBy1(OrderListVo orderListVo);

    void insertBy2(OrderListVo orderListVo);

    void insertByTest(OrderListVo orderListVo);
}
