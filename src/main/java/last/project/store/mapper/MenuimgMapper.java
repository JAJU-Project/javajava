package last.project.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.MenuimgVo;

@Mapper
@Repository
public interface MenuimgMapper {

    void insertAll(MenuimgVo menuimgVo);

}
