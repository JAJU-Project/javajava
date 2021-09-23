package last.project.store.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.MenuVo;
import last.project.store.domain.OrderListVo;
import last.project.store.service.MenuService;
import last.project.store.service.OrderListService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class RestController {

    private MenuService menuService;
    private OrderListService orderListService;

    @PostMapping("rest")
    @ResponseBody
    public List<MenuVo> request(String catgo, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        String cname = catgo;
        List<MenuVo> restMlist = menuService.selectByCname(scode, cname);
        log.info("#rest resMlist:" + restMlist);
        // log.info("#rest catego :" + catgo);
        // ModelAndView mv = new ModelAndView("catgo");
        // mv.addObject("resMlist", restMlist);
        return restMlist;
    }

    @PostMapping("order")
    @ResponseBody
    public List<OrderListVo> order(String order, HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        List<OrderListVo> orList = orderListService.selectAll(scode);
        if (orList.get(0).getMname3() == null) {
            List<Map<String, Object>> olist = orderListService.select1(scode);
            log.info("#order olist: " + olist);
            return orList;
        } else {
            log.info("#order orList: " + orList);

            ModelAndView mv = new ModelAndView("order");
            mv.addObject("orList", orList);
            return null;
        }
    }

    @RequestMapping("test1")
    @ResponseBody
    public boolean test1(HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        log.info("#test1 scode: " + scode);
        List<OrderListVo> olist = orderListService.selectAll(scode);
        log.info(("#test1 olost: " + olist));
        int olist_size = olist.size();
        String[] mname1 = new String[olist_size];
        String[] mname2 = new String[olist_size];
        String[] mname3 = new String[olist_size];
        String[] mname4 = new String[olist_size];
        for (int i = 0; i < olist_size; i++) {
            mname1[i] = olist.get(i).getMname1();
            mname2[i] = olist.get(i).getMname2();
            mname3[i] = olist.get(i).getMname3();
            mname4[i] = olist.get(i).getMname4();
        }
        for (int i = 0; i < olist_size; i++) {
            log.info("mname1[" + i + "]" + mname1[i]);
            log.info("mname2[" + i + "]" + mname2[i]);
            log.info("mname3[" + i + "]" + mname3[i]);
            log.info("mname4[" + i + "]" + mname4[i]);
        }
        return true;
    }

    @RequestMapping("test2")
    @ResponseBody
    public boolean test2() {
        return true;
    }

    @RequestMapping("test3")
    @ResponseBody
    public boolean test3() {
        return true;
    }

    @RequestMapping("test4")
    @ResponseBody
    public boolean test4() {
        return true;
    }
}