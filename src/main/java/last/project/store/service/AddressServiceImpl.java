package last.project.store.service;

import java.util.List;

import org.springframework.stereotype.Service;

import last.project.store.domain.AddressVo;
import last.project.store.mapper.AddressMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AddressServiceImpl implements AddressService {

    private AddressMapper addressMapper;

    @Override
    public List<AddressVo> selectAll() {
        // TODO Auto-generated method stub
        return addressMapper.selectAll();
    }

}
