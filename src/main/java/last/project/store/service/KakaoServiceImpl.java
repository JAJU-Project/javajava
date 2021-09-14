package last.project.store.service;

import org.springframework.stereotype.Service;

import last.project.store.domain.KakaoVo;
import last.project.store.mapper.KakaoMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class KakaoServiceImpl implements KakaoService {
    private KakaoMapper kakaoMapper;

    @Override
    public void insertAll(KakaoVo kakaoVo) {
        // TODO Auto-generated method stub
        kakaoMapper.insertAll(kakaoVo);
    }

    @Override
    public String selectByKid(String kid) {
        // TODO Auto-generated method stub
        return kakaoMapper.selectByKid(kid);
    }

}
