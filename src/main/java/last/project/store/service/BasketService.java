package last.project.store.service;

import java.util.List;

import last.project.store.domain.BasketVo;

public interface BasketService {
    void insertAll(BasketVo basketVo);

    List<BasketVo> selectByKid(String kid);

    void deleteBykid(String kid);
}
