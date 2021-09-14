package last.project.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.AddressVo;

@Repository
@Mapper
public interface AddressMapper {
    List<AddressVo> selectAll();
}
