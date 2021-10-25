package last.project.store.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.CategoryVo;
import last.project.store.domain.CommentVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.StoreVo;
import last.project.store.service.CategoryService;
import last.project.store.service.CommentService;
import last.project.store.service.MenuService;
import last.project.store.service.ReviewService;
import last.project.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@AllArgsConstructor
@Log
public class AdminListController {

    private StoreService storeService;
    private ReviewService reviewService;
    private CommentService commentService;
    private CategoryService categoryService;
    private MenuService menuService;

    @RequestMapping("store.do") // 관리자 매장 리스트(10/24)
    public ModelAndView store(HttpSession session) {

        String maid = (String) session.getAttribute("maid"); // 로그인한 관리자 아이디 session값 가져옴
        List<HashMap<String, Object>> maplist = storeService.selectJoin(maid);
        log.info("maplist: " + maplist);
        log.info("maplist.size: " + maplist.size());
        ModelAndView mv = new ModelAndView("admin/storeList"); // store.jsp로 이동
        // mv.addObject("list", list); // 매장 리시트 전송
        mv.addObject("maplist", maplist);

        return mv;
    }

    @GetMapping("management.do") // 매장관리 페이지 (10/24)
    public String storeMain(String scode, HttpSession session) { // 매장 들어갈때 파라미터 매장코드 가져옴
        session.setAttribute("scode", scode); // session에 매장코드 저장.
        log.info("#management.do scode: " + scode);
        return "admin/index"; // admin/index.jsp로 이동
    }

    @RequestMapping("review")
    public ModelAndView review(HttpSession session) { // 리뷰 페이지 (10/24)
        String scode = (String) session.getAttribute("scode");
        List<HashMap<String, Object>> maplist = reviewService.selectByScode(scode);
        int maplistSize = maplist.size();
        List<CommentVo> clist = commentService.selectAll(scode);
        log.info("#review maplist: " + maplist);
        log.info("#review clist: " + clist);
        ModelAndView mv = new ModelAndView("admin/review");
        mv.addObject("maplist", maplist);
        mv.addObject("commentsNumber", maplistSize);
        mv.addObject("clist", clist);
        return mv;
    }

    @RequestMapping("menu")
    public ModelAndView menu(HttpSession session) { // 메뉴 페이지 (10/24)
        String scode = (String) session.getAttribute("scode");
        session.setAttribute("scode", scode); // session에 매장코드 저장.
        log.info("#menu.do scode: " + scode);
        List<CategoryVo> list = categoryService.selectAllByScode(scode);
        ModelAndView mv = new ModelAndView("admin/menu"); // managementMain.jsp로 이동
        List<HashMap<String, Object>> maplist = menuService.selectJoin(scode);

        log.info("#menu.do list: " + list);
        mv.addObject("list", list); // 카테고리 리스트 전송
        mv.addObject("maplist", maplist);
        log.info("maplist: " + maplist);
        return mv;
        // return null;
    }
}
