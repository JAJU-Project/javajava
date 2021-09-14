package last.project.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.CategoryVo;
import last.project.store.mapper.CategoryMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private CategoryMapper categoryMapper;

    @Override
    public List<CategoryVo> selectAllByScode(String scode) {
        // TODO Auto-generated method stub
        return categoryMapper.selectAllByScode(scode);
    }

    @Override
    public void insertAll(CategoryVo categoryVo) {
        // TODO Auto-generated method stub
        categoryMapper.insertAll(categoryVo);
    }

    @Override
    public List<String> selectByScode(String scode) {
        // TODO Auto-generated method stub
        return categoryMapper.selectByScode(scode);
    }

}
