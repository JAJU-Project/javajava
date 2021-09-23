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
import last.project.store.domain.SalesVo;
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
        log.info("#order scode: " + scode);
        List<OrderListVo> orList = orderListService.selectAlls(scode);
        log.info("#order orList: " + orList);
        return orList;
        /*
         * if (orList.get(0).getMname3() == null) { List<Map<String, Object>> olist =
         * orderListService.select1(scode); log.info("#order olist: " + olist); return
         * orList; } else { log.info("#order orList: " + orList);
         * 
         * ModelAndView mv = new ModelAndView("order"); mv.addObject("orList", orList);
         * return null; }
         */
    }

    @RequestMapping("test1")
    @ResponseBody
    public List<SalesVo> test1(HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        List<SalesVo> slist = salesService.selectAll2(scode);
        log.info("#test1 slist: " + slist);
        return slist;
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