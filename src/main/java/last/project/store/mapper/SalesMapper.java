package last.project.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import last.project.store.domain.SalesVo;

@Mapper
public interface SalesMapper {

    List<SalesVo> selectAll(String scode, String mname);

    void updateBySales(SalesVo salesVo);

    long selectSacoin(String scode, String mname);

    int selectSacount(String scode, String mname);

    List<SalesVo> selectAll2(String scode);

}
