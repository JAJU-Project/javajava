package last.project.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.BasketVo;
import last.project.store.mapper.BasketMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BasketServiceImpl implements BasketService {

    private BasketMapper basketMapper;

    @Override
    public void insertAll(BasketVo basketVo) {
        // TODO Auto-generated method stub
        basketMapper.insertAll(basketVo);
    }

    @Override
    public List<BasketVo> selectByKid(String kid) {
        // TODO Auto-generated method stub
        return basketMapper.selectByKid(kid);
    }

    @Override
    public void deleteBykid(String kid) {
        // TODO Auto-generated method stub
        basketMapper.deleteBykid(kid);
    }

    @Override
    public List<BasketVo> selectByMname(String kid, String mname) {
        // TODO Auto-generated method stub
        return basketMapper.selectByMname(kid, mname);
    }

    @Override
    public void updateAll(BasketVo basketVo) {
        // TODO Auto-generated method stub
        basketMapper.updateAll(basketVo);
    }

}
