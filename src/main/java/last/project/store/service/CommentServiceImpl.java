package last.project.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.CommentVo;
import last.project.store.mapper.CommentMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommentServiceImpl implements CommentService {

    private CommentMapper commentMapper;

    @Override
    public List<CommentVo> selectAll(String scode) {
        // TODO Auto-generated method stub
        return commentMapper.selectAll(scode);
    }

    @Override
    public void insertAll(CommentVo commentVo) {
        // TODO Auto-generated method stub
        commentMapper.insertAll(commentVo);
    }

}
