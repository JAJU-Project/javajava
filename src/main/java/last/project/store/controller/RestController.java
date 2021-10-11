package last.project.store.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public List<OrderListVo> order(String ostate, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("scode", scode);
        map.put("ostate", Integer.parseInt(ostate));
        log.info("#order scode: " + scode);
        log.info("#order ostate: " + ostate);
        List<OrderListVo> orList = orderListService.selectAlls(map);
        log.info("#order orList: " + orList.size());

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
    public HashMap<String, Object> test4_mo(String oseq, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        log.info("#test4 oseq: " + oseq);

        // List<OrderListVo> oList = orderListService.selectAll(map);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("scode", scode);
        map.put("oseq", Long.parseLong(oseq));
        List<OrderListVo> olist = orderListService.selectAll2(map);
        log.info("#test4 olist: " + olist);
        HashMap<String, Object> maps = new HashMap<String, Object>();
        long totalPrice = 0l;
        int count = 0;
        if (olist.get(0).getMname2() == null) {
            count = 1;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname3() == null) {
            count = 2;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname4() == null) {
            count = 3;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname5() == null) {
            count = 4;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname6() == null) {
            count = 5;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname7() == null) {
            count = 6;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname8() == null) {
            count = 7;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname9() == null) {
            count = 8;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7() + olist.get(0).getMprice8();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            mname[7] = olist.get(0).getMname8();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            mprice[7] = olist.get(0).getMprice8();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            olcount[7] = olist.get(0).getOlcount8();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname10() == null) {
            count = 9;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7() + olist.get(0).getMprice8() + olist.get(0).getMprice9();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            mname[7] = olist.get(0).getMname8();
            mname[8] = olist.get(0).getMname9();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            mprice[7] = olist.get(0).getMprice8();
            mprice[8] = olist.get(0).getMprice9();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            olcount[7] = olist.get(0).getOlcount8();
            olcount[8] = olist.get(0).getOlcount9();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else {
            count = 10;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7() + olist.get(0).getMprice8() + olist.get(0).getMprice9()
                    + olist.get(0).getMprice10();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            mname[7] = olist.get(0).getMname8();
            mname[8] = olist.get(0).getMname9();
            mname[9] = olist.get(0).getMname10();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            mprice[7] = olist.get(0).getMprice8();
            mprice[8] = olist.get(0).getMprice9();
            mprice[9] = olist.get(0).getMprice10();

            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            olcount[7] = olist.get(0).getOlcount8();
            olcount[8] = olist.get(0).getOlcount9();
            olcount[9] = olist.get(0).getOlcount10();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        }

    }
}