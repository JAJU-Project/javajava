package last.project.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.ReviewimgVo;

@Mapper
@Repository
public interface ReviewimgMapper {

    void insertAll(ReviewimgVo reviewimgVo);

}
