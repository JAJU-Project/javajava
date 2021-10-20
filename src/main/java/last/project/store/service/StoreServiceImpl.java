package last.project.store.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.StoreVo;
import last.project.store.mapper.StoreMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {
    private StoreMapper storeMapper;

    @Override
    public void insertAll(StoreVo storeVo) {
        storeMapper.insertAll(storeVo);
    }

    @Override
    public List<StoreVo> selectByMaid(String maid) {
        // TODO Auto-generated method stub
        return storeMapper.selectByMaid(maid);
    }

    @Override
    public String selectByScode(String scode) {
        // TODO Auto-generated method stub
        return storeMapper.selectByScode(scode);
    }

    @Override
    public List<HashMap<String, Object>> selectJoin(String maid) {
        // TODO Auto-generated method stub
        return storeMapper.selectJoin(maid);
    }

}
