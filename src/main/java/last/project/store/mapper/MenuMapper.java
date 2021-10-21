package last.project.store.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import last.project.store.domain.MenuVo;

@Mapper
public interface MenuMapper {
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
