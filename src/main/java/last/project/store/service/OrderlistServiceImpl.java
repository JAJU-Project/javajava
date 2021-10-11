package last.project.store.service;

import java.util.HashMap;
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
    public List<OrderListVo> selectAll(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return orderListMapper.selectAll(map);
    }

    @Override
    public List<OrderListVo> selectAlls(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return orderListMapper.selectAlls(map);
    }

    @Override
    public List<Map<String, Object>> select1(String scode) {
        // TODO Auto-generated method stub
        return orderListMapper.select1(scode);
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
    public void insertBy3(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy3(orderListVo);
    }

    @Override
    public void insertBy4(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy4(orderListVo);
    }

    @Override
    public void insertBy5(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy5(orderListVo);
    }

    @Override
    public void insertBy6(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy6(orderListVo);
    }

    @Override
    public void insertBy7(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy7(orderListVo);
    }

    @Override
    public void insertBy8(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy8(orderListVo);
    }

    @Override
    public void insertBy9(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy9(orderListVo);
    }

    @Override
    public void insertBy10(OrderListVo orderListVo) {
        // TODO Auto-generated method stub
        orderListMapper.insertBy10(orderListVo);
    }

    @Override
    public List<OrderListVo> selectByScode(String scode) {
        // TODO Auto-generated method stub
        return orderListMapper.selectByScode(scode);
    }

    @Override
    public List<OrderListVo> selectAll2(HashMap<String, Object> map) {
        // TODO Auto-generated method stub
        return orderListMapper.selectAll2(map);
    }
}
