package last.project.store.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import last.project.store.domain.CategoryVo;

@Mapper
public interface CategoryMapper {
    List<CategoryVo> selectAllByScode(String scode);

    void insertAll(CategoryVo categoryVo);

    List<String> selectByScode(String scode);

    void deleteByCname(String scode, String cname);

    void updateByCname(HashMap<String, Object> map);

    String selectByCaseq(long caseq);

}
