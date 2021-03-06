package last.project.store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.CategoryVo;
import last.project.store.domain.CommentVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.OrderListVo;
import last.project.store.service.CategoryService;
import last.project.store.service.CommentService;
import last.project.store.service.MenuService;
import last.project.store.service.OrderListService;
import last.project.store.service.ReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class AdminRedirectController {

    private MenuService menuService;
    private CategoryService categoryService;
    private OrderListService orderListService;
    private ReviewService reviewService;
    private CommentService commentService;

    @GetMapping("sign_up.do") // 회원가입
    public String sign_up() {
        return "sign_up"; // 회원가입 페이지 이동.
    }

    @GetMapping("store_create.do") // 매장생성
    public String store_create() {
        return "store_create"; // 매장 생성 페이지 이동
    }

    @GetMapping("category_in.do") // 카테고리생성
    public String category_in() {
        return "category_in"; // 카테고리 생성 페이지 이동
    }

    @GetMapping("updateC")
    public String updateC(String catgo) {
        log.info("#updateC catgo : " + catgo);
        return "admin/updateC";
    }

    @GetMapping("updateM")
    public ModelAndView updateM(long mseq, HttpSession session) {
        String scode = (String) session.getAttribute("scode");

        // List<MenuVo> mList = (List<MenuVo>) menuVo;
        log.info("#updateM mseq: " + mseq);
        List<MenuVo> mlist = menuService.selectByMseq(mseq);

        ModelAndView mv = new ModelAndView("admin/updateM");
        mv.addObject("mlist", mlist);
        log.info("#updateM mlist: " + mlist);
        return mv;
    }

    @RequestMapping("index")
    public String home() {
        return "admin/index";
    }

    @RequestMapping("insert")
    public String insert() {
        return "admin/insert";
    }

    @RequestMapping("insertC")
    public String insertC() {
        return "admin/insertC";
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

}
