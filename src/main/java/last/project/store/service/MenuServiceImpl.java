package last.project.store.service;

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

}
