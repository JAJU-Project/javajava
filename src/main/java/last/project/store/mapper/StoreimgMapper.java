package last.project.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.StoreimgVo;

@Repository
@Mapper
public interface StoreimgMapper {
    void insertAll(StoreimgVo storeimgVo);

    List<StoreimgVo> selectByScode(String scode);

}
