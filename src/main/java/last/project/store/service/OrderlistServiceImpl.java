package last.project.store.service;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import last.project.store.domain.OrderListVo;
import last.project.store.mapper.OrderListMapper;

@Service
@AllArgsConstructor
@Log
public class OrderListServiceImpl implements OrderListService {
    private OrderListMapper orderListMapper;

    @Override
    public void insertBy1(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy1(orderListVo);
    }

    @Override
    public void insertBy2(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy2(orderListVo);
    }

    @Override
    public void insertByTest(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertByTest(orderListVo);
    }
}
