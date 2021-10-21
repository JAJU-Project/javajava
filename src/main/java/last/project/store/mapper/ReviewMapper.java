package last.project.store.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.ReviewVo;

@Mapper
@Repository
public interface ReviewMapper {

    void insertAll(ReviewVo reviewVo);

    long selectRseq(HashMap<String, Object> map);

    List<HashMap<String, Object>> selectByScode(String scode);

}
