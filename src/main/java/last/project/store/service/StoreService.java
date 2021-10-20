package last.project.store.service;

import java.util.HashMap;
import java.util.List;

import last.project.store.domain.StoreVo;

public interface StoreService {
    void insertAll(StoreVo storeVo);

    List<StoreVo> selectByMaid(String maid);

    String selectByScode(String scode);

    List<HashMap<String, Object>> selectJoin(String maid);
}
