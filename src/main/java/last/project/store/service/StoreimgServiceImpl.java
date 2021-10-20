package last.project.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.StoreimgVo;
import last.project.store.mapper.StoreimgMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class StoreimgServiceImpl implements StoreimgService {
    private StoreimgMapper storeimgMapper;

    @Override
    public void insertAll(StoreimgVo storeimgVo) {
        // TODO Auto-generated method stub
        storeimgMapper.insertAll(storeimgVo);
    }

}
