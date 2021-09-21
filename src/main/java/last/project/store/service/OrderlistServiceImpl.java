package last.project.store.service;

import java.util.List;
import java.util.Map;

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

    @Override
    public List<OrderListVo> selectAll(String scode) {
        // TODO Auto-generated method stub
        return orderListMapper.selectAll(scode);
    }

    @Override
    public List<Map<String, Object>> select1(String scode) {
        // TODO Auto-generated method stub
        return orderListMapper.select1(scode);
    }

    @Override
    public void insertBy3(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy3(orderListVo);
    }

    @Override
    public void updateByOseq(long oseq) {
        // TODO Auto-generated method stub
        orderListMapper.updateByOseq(oseq);
    }

    @Override
    public void updateCancel(long oseq) {
        // TODO Auto-generated method stub
        orderListMapper.updateCancel(oseq);
    }
}
