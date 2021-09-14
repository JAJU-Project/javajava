package last.project.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.OrderlistVo;

@Repository
@Mapper
public interface OrderlistMapper {
    void insertAll(OrderlistVo orderlistVo);
}
