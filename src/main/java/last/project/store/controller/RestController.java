package last.project.store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import last.project.store.domain.MenuVo;
import last.project.store.domain.OrderListVo;
import last.project.store.domain.SalesVo;
import last.project.store.service.KakaoService;
import last.project.store.service.MenuService;
import last.project.store.service.OrderListService;
import last.project.store.service.SalesService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class RestController {

    private MenuService menuService;
    private OrderListService orderListService;
    private SalesService salesService;
    private KakaoService kakaoService;

    @PostMapping("rest")
    @ResponseBody
    public List<MenuVo> request(String catgo, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        String cname = catgo;
        List<MenuVo> restMlist = menuService.selectByCname(scode, cname);
        log.info("#rest resMlist:" + restMlist);
        return restMlist;
    }

    @PostMapping("order")
    @ResponseBody
    public List<OrderListVo> order(String order, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        log.info("#order scode: " + scode);
        List<OrderListVo> orList = orderListService.selectAlls(scode);
        log.info("#order orList: " + orList);
        return orList;
    }

    @RequestMapping("salesByMenu")
    @ResponseBody
    public List<SalesVo> salesByMenu(HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        List<SalesVo> slist = salesService.selectAll2(scode);
        log.info("#salesByMenu slist: " + slist);
        return slist;
    }

    @RequestMapping("test2")
    @ResponseBody
    public boolean test2() {
        /* 1. 작년 1월 매출 실적 부터... */

        return true;
    }

    @RequestMapping("dayCustomer")
    @ResponseBody
    public int test3(HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        // long miliseconds = System.currentTimeMillis();
        // Date oldate = new Date(miliseconds);
        // log.info("#dayCustomer today: " + oldate);
        List<OrderListVo> oList = orderListService.selectByScode(scode);
        log.info("#dayCustomer oList: " + oList);
        log.info("#dayCustomer 오늘 주문한 사람의 수: " + oList.size());
        return oList.size();
    }

    @RequestMapping("age")
    @ResponseBody
    public JSONObject test4() {
        List<Integer> alist = kakaoService.selectAge();
        log.info("#test4 alist: " + alist);
        int sum10 = 0, sum20 = 0, sum30 = 0, sum40 = 0, sum50 = 0, sum60 = 0, sumetc = 0;
        HashMap<String, Integer> ageMap = new HashMap<String, Integer>();
        for (int i = 0; i < alist.size(); i++) {
            log.info("#test4 alist kage: " + alist.get(i));
        }
        for (int i = 0; i < alist.size(); i++) {
            switch (alist.get(i)) {
                case 10:
                    sum10 += 1;
                    break;
                case 20:
                    sum20 += 1;
                    break;
                case 30:
                    sum30 += 1;
                    break;
                case 40:
                    sum40 += 1;
                    break;
                case 50:
                    sum50 += 1;
                    break;
                case 60:
                    sum60 += 1;
                    break;
                default:
                    sumetc += 1;
                    break;
            }
        }
        ageMap.put("teenager", sum10);
        ageMap.put("twenties", sum20);
        ageMap.put("thirties", sum30);
        ageMap.put("forties", sum40);
        ageMap.put("fifties", sum50);
        ageMap.put("sixties", sum60);
        ageMap.put("etc", sumetc);

        JSONObject json = new JSONObject(ageMap);
        log.info("#test4 json: " + json);
        return json;
    }

    @RequestMapping("test4")
    @ResponseBody
    public String test4_mo() {
        log.info("test");
        return null;
    }
}