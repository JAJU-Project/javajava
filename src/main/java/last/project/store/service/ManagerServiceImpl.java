package last.project.store.service;

import org.springframework.stereotype.Service;

import last.project.store.domain.ManagerVo;
import last.project.store.mapper.ManagerMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ManagerServiceImpl implements ManagerService {

    private ManagerMapper managerMapper;

    @Override
    public void insertAll(ManagerVo managerVo) {
        managerMapper.insertAll(managerVo);
    }

    @Override
    public String selectByLogin(String maid, String mapwd) {
        return managerMapper.selectByLogin(maid, mapwd);
    }

}
