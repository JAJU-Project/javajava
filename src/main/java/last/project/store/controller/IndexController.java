package last.project.store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import last.project.store.service.CategoryService;
import last.project.store.service.MenuService;
import last.project.store.service.OrderListService;

import last.project.store.domain.CategoryVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.OrderListVo;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@AllArgsConstructor
@Log
public class IndexController {

    private MenuService menuService;
    private CategoryService categoryService;
    private OrderListService orderListService;

    @RequestMapping("index")
    public String home() {
        return "admin/index";
    }

    @RequestMapping("review")
    public String review() {
        return "admin/review";
    }

    @RequestMapping("menu")
    public ModelAndView menu(HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        session.setAttribute("scode", scode); // session에 매장코드 저장.
        log.info("#menu.do scode: " + scode);
        List<CategoryVo> list = categoryService.selectAllByScode(scode); // 매장코드에
        // 해당하는 카테고리 리스트를 가져옴.
        List<MenuVo> mlist = menuService.selectBySucode(scode); // 매장코드에 해당하는 메뉴 리스트를 가져옴.
        ModelAndView mv = new ModelAndView("admin/menu"); // managementMain.jsp로 이동
        log.info("#menu.do mlist: " + mlist);
        log.info("#menu.do list: " + list);
        mv.addObject("mlist", mlist); // 메뉴 리스트 전송
        mv.addObject("list", list); // 카테고리 리스트 전송
        return mv;
    }

    @RequestMapping("insert")
    public String insert() {
        return "admin/insert";
    }

    @RequestMapping("empty")
    public ModelAndView empty(HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("scode", scode);
        map.put("ostate", 1);
        List<OrderListVo> olist1 = orderListService.selectAll(map);
        map.put("ostate", 2);
        List<OrderListVo> olist2 = orderListService.selectAll(map);
        map.put("ostate", 3);
        List<OrderListVo> olist3 = orderListService.selectAll(map);
        map.put("ostate", 4);
        List<OrderListVo> olist4 = orderListService.selectAll(map);
        ModelAndView mv = new ModelAndView("admin/empty");
        mv.addObject("olist1", olist1);
        log.info("#empty scode: " + scode);
        log.info("#empty olist1: " + olist1.size());
        log.info("#empty olist2: " + olist2.size());
        log.info("#empty olist3: " + olist3.size());
        log.info("#empty olist4: " + olist4.size());
        return mv;
    }

    @RequestMapping("insertC")
    public String insertC() {
        return "admin/insertC";
    }

    @RequestMapping("receipt")
    public String in(long oseq) {
        orderListService.updateByOseq(oseq);
        log.info("#receipt oseq: " + oseq);
        return "redirect:empty";
    }

    @RequestMapping("cancel")
    public String cancel(long oseq) {
        orderListService.updateCancel(oseq);
        log.info("#cancel oseq: " + oseq);
        return "redirect:empty";
    }

    @RequestMapping("completion")
    public String completion(long oseq) { // 3으로
        orderListService.updateCompletion(oseq);
        return "redirect:empty";
    }

    @RequestMapping("user")
    public String user() {
        return "examples/user";
    }

    @RequestMapping("table")
    public String table() {
        return "examples/table";
    }

    @RequestMapping("typography")
    public String typography() {
        return "examples/typography";
    }

    @RequestMapping("icons")
    public String icons() {
        return "examples/icons";
    }

    @RequestMapping("maps")
    public String maps() {
        return "examples/maps";
    }

    @RequestMapping("notifications")
    public String notifications() {
        return "examples/notifications";
    }
}