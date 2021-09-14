package last.project.store.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.ManagerVo;

@Repository
@Mapper
public interface ManagerMapper {
    void insertAll(ManagerVo managerVo);

    String selectByLogin(String maid, String mapwd);
}
