package last.project.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import last.project.store.domain.MenuVo;

@Mapper
public interface MenuMapper {
    void insertAll(MenuVo menuVo);

    List<MenuVo> selectBySucode(String scode);

    List<MenuVo> selectByCname(String scode, String cname);

    void deleteByMseq(long mseq);

    void updateByMseq(MenuVo menuVo);

    List<MenuVo> selectByMseq(long mseq);

}
