package last.project.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.SalesVo;
import last.project.store.mapper.SalesMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SalesServiceImpl implements SalesService {

    private SalesMapper salesMapper;

    @Override
    public List<SalesVo> selectAll(String scode, String mname) {
        // TODO Auto-generated method stub
        return salesMapper.selectAll(scode, mname);
    }

    @Override
    public void updateBySales(SalesVo salesVo) {
        // TODO Auto-generated method stub
        salesMapper.updateBySales(salesVo);
    }

    @Override
    public long selectSacoin(String scode, String mname) {
        // TODO Auto-generated method stub
        return salesMapper.selectSacoin(scode, mname);
    }

    @Override
    public int selectSacount(String scode, String mname) {
        // TODO Auto-generated method stub
        return salesMapper.selectSacount(scode, mname);
    }

    @Override
    public List<SalesVo> selectAll2(String scode) {
        // TODO Auto-generated method stub
        return salesMapper.selectAll2(scode);
    }

}
