package last.project.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.StoreVo;

@Repository
@Mapper
public interface StoreMapper {
    void insertAll(StoreVo storeVo);

    List<StoreVo> selectByMaid(String maid);

    String selectByScode(String scode);

}
