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

    List<HashMap<String, Object>> selectByRseq(HashMap<String, Object> map);

    List<HashMap<String, Object>> selectByJoin(HashMap<String, Object> map);

}
