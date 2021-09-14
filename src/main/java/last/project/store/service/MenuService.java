package last.project.store.service;

import java.util.List;

import last.project.store.domain.MenuVo;

public interface MenuService {
    void insertAll(MenuVo menuVo);

    List<MenuVo> selectBySucode(String scode);

    List<MenuVo> selectByCname(String scode, String cname);
}
