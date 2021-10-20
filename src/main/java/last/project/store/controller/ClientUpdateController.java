package last.project.store.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import last.project.store.domain.BasketVo;
import last.project.store.service.BasketService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class ClientUpdateController {

    private BasketService basketService;

    @RequestMapping("countUp")
    @ResponseBody
    public void countUp(long baseq) {
        // 0 => seq , 1 = count
        log.info("#countUp baseq: " + baseq);
        List<BasketVo> blist = basketService.selectByBaseq(baseq);
        int basicprice = blist.get(0).getBasicprice();
        int mprice = blist.get(0).getMprice();
        mprice = mprice + basicprice;
        int bcount = blist.get(0).getBcount();
        bcount = bcount + 1;
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("mprice", mprice);
        map.put("bcount", bcount);
        map.put("baseq", baseq);
        basketService.updateByMap(map);
        log.info("countUp basicprice: " + basicprice);
    }

    @RequestMapping("countDown")
    @ResponseBody
    public void countDown(long baseq) {
        List<BasketVo> blist = basketService.selectByBaseq(baseq);
        int basicprice = blist.get(0).getBasicprice();
        int mprice = blist.get(0).getMprice();

        mprice = mprice - basicprice;
        int bcount = blist.get(0).getBcount();
        bcount = bcount - 1;
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("mprice", mprice);
        map.put("bcount", bcount);
        map.put("baseq", baseq);
        basketService.updateByMap(map);
        log.info("countDown basicprice: " + basicprice);

    }
}
