package last.project.store.service;

import last.project.store.domain.KakaoVo;

public interface KakaoService {
    void insertAll(KakaoVo kakaoVo);

    String selectByKid(String kid);
}
