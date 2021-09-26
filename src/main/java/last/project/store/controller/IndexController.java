package last.project.store.controller;

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
    public String empty() {
        return "admin/empty";
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
}