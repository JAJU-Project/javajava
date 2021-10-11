package last.project.store.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.BasketVo;

@Repository
@Mapper
public interface BasketMapper {

    void insertAll(BasketVo basketVo);

    List<BasketVo> selectByKid(String kid);

    void deleteBykid(String kid);

    List<BasketVo> selectByMname(String kid, String mname);

    void updateAll(BasketVo basketVo);

    List<BasketVo> selectByBaseq(long baseq);

    void updateByMap(HashMap<String, Object> map);

}
