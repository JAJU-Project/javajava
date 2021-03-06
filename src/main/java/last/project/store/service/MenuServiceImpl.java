package last.project.store.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.MenuVo;
import last.project.store.mapper.MenuMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MenuServiceImpl implements MenuService {
    private MenuMapper menuMapper;

    @Override
    public void insertAll(MenuVo menuVo) {
        // TODO Auto-generated method stub
        menuMapper.insertAll(menuVo);
    }

    @Override
    public List<MenuVo> selectBySucode(String scode) {
        // TODO Auto-generated method stub
        return menuMapper.selectBySucode(scode);
    }

    @Override
    public List<HashMap<String, Object>> selectByCname(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return menuMapper.selectByCname(map);
    }

    @Override
    public void deleteByMseq(long mseq) {
        // TODO Auto-generated method stub
        menuMapper.deleteByMseq(mseq);
    }

    @Override
    public void updateByMseq(MenuVo menuVo) {
        // TODO Auto-generated method stub
        menuMapper.updateByMseq(menuVo);
    }

    @Override
    public List<MenuVo> selectByMseq(long mseq) {
        // TODO Auto-generated method stub
        return menuMapper.selectByMseq(mseq);
    }

    @Override
    public long selectByCaseq(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return menuMapper.selectByCaseq(map);
    }

    @Override
    public List<HashMap<String, Object>> selectJoin(String scode) {
        // TODO Auto-generated method stub
        return menuMapper.selectJoin(scode);
    }

    @Override
    public List<HashMap<String, Object>> selectJoinBymseq(long mseq) {
        // TODO Auto-generated method stub
        return menuMapper.selectJoinBymseq(mseq);
    }

}
