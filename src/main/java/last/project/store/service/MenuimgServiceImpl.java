package last.project.store.service;

import org.springframework.stereotype.Service;

import last.project.store.domain.MenuimgVo;
import last.project.store.mapper.MenuimgMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MenuimgServiceImpl implements MenuimgService {

    private MenuimgMapper menuimgMapper;

    @Override
    public void insertAll(MenuimgVo menuimgVo) {
        menuimgMapper.insertAll(menuimgVo);
    }

}
