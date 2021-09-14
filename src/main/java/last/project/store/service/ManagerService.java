package last.project.store.service;

import last.project.store.domain.ManagerVo;

public interface ManagerService {
    void insertAll(ManagerVo managerVo);

    String selectByLogin(String maid, String mapwd);
}
