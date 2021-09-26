package last.project.store.service;

import java.util.List;

import last.project.store.domain.KakaoVo;

public interface KakaoService {
    void insertAll(KakaoVo kakaoVo);

    String selectByKid(String kid);

    List<Integer> selectAge();
}
