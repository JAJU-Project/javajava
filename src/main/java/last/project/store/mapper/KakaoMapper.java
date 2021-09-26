package last.project.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.KakaoVo;

@Repository
@Mapper
public interface KakaoMapper {
    void insertAll(KakaoVo kakaoVo);

    String selectByKid(String kid);

    List<Integer> selectAge();
}
