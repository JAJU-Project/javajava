package last.project.store.service;

import java.util.List;

import last.project.store.domain.SalesVo;

public interface SalesService {
    List<SalesVo> selectAll(String scode, String mname);

    void updateBySales(SalesVo salesVo);

    long selectSacoin(String scode, String mname);

    int selectSacount(String scode, String mname);

    List<SalesVo> selectAll2(String scode);

    void insertAll(String mname, String scode);
}
