package last.project.store.service;

import java.util.List;

import last.project.store.domain.CommentVo;

public interface CommentService {
    List<CommentVo> selectAll(String scode);

    void insertAll(CommentVo commentVo);
}
