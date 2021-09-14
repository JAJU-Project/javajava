package last.project.store.service;

import org.springframework.stereotype.Service;

import last.project.store.domain.OrderlistVo;
import last.project.store.mapper.OrderlistMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderlistServiceImpl implements OrderlistService {

    private OrderlistMapper orderlistMapper;

    @Override
    public void insertAll(OrderlistVo orderlistVo) {
        // TODO Auto-generated method stub
        orderlistMapper.insertAll(orderlistVo);
    }

}
