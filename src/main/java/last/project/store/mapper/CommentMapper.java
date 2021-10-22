package last.project.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import last.project.store.domain.CommentVo;

@Mapper
@Repository
public interface CommentMapper {

    List<CommentVo> selectAll(String scode);

    void insertAll(CommentVo commentVo);

}
