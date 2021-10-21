package last.project.store.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.ReviewVo;
import last.project.store.mapper.ReviewMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

    private ReviewMapper reviewMapper;

    @Override
    public void insertAll(ReviewVo reviewVo) {
        // TODO Auto-generated method stub
        reviewMapper.insertAll(reviewVo);
    }

    @Override
    public long selectRseq(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return reviewMapper.selectRseq(map);
    }

    @Override
    public List<HashMap<String, Object>> selectByScode(String scode) {
        // TODO Auto-generated method stub
        return reviewMapper.selectByScode(scode);
    }

    @Override
    public List<HashMap<String, Object>> selectByRseq(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return reviewMapper.selectByRseq(map);
    }

}
