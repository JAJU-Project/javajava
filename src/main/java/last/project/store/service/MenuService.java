package last.project.store.service;

import java.util.HashMap;
import java.util.List;

import last.project.store.domain.MenuVo;

public interface MenuService {
    void insertAll(MenuVo menuVo);

    List<MenuVo> selectBySucode(String scode);

    List<HashMap<String, Object>> selectByCname(HashMap<String, Object> map);

    void deleteByMseq(long mseq);

    void updateByMseq(MenuVo menuVo);

    List<MenuVo> selectByMseq(long mseq);

    long selectByCaseq(HashMap<String, Object> map);

    List<HashMap<String, Object>> selectJoin(String scode);

    List<HashMap<String, Object>> selectJoinBymseq(long mseq);
}
