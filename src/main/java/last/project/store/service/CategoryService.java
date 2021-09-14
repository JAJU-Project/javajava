package last.project.store.service;

import java.util.List;

import last.project.store.domain.CategoryVo;

public interface CategoryService {
    List<CategoryVo> selectAllByScode(String scode);

    void insertAll(CategoryVo categoryVo);

    List<String> selectByScode(String scode);
}
