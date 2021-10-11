package last.project.store.service;

import java.util.HashMap;
import java.util.List;

import last.project.store.domain.BasketVo;

public interface BasketService {
    void insertAll(BasketVo basketVo);

    List<BasketVo> selectByKid(String kid);

    void deleteBykid(String kid);

    List<BasketVo> selectByMname(String kid, String mname);

    void updateAll(BasketVo basketVo);

    List<BasketVo> selectByBaseq(long baseq);

    void updateByMap(HashMap<String, Object> map);
}
