package last.project.store.service;

import org.springframework.stereotype.Service;

import last.project.store.domain.ReviewimgVo;
import last.project.store.mapper.ReviewimgMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewimgServiceImpl implements ReviewimgService {

    private ReviewimgMapper reviewimgMapper;

    @Override
    public void insertAll(ReviewimgVo reviewimgVo) {
        // TODO Auto-generated method stub
        reviewimgMapper.insertAll(reviewimgVo);
    }

}
