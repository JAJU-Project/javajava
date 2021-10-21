package last.project.store.service;

import java.util.HashMap;
import java.util.List;

import last.project.store.domain.ReviewVo;

public interface ReviewService {
    void insertAll(ReviewVo reviewVo);

    long selectRseq(HashMap<String, Object> map);

    List<HashMap<String, Object>> selectByScode(String scode);
}
