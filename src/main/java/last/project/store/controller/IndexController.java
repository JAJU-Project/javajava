package last.project.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.BasketVo;
import last.project.store.domain.CategoryVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.RandomCode;
import last.project.store.domain.StoreVo;

import last.project.store.service.BasketService;
import last.project.store.service.CategoryService;
import last.project.store.service.ManagerService;
import last.project.store.service.MenuService;
import last.project.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class IndexController {

    private ManagerService managerService;
    private StoreService storeService;
    private CategoryService categoryService;
    private MenuService menuService;
    private BasketService basketService;

    @GetMapping("kakao.do")
    public String kakaoString(HttpSession session, String scode, String kakao_account) {
        String test1 = (String) session.getAttribute("test1");
        log.info("#kakao.do test:" + test1);
        session.setAttribute("scode", scode);
        log.info("#kakao.do kakao_account: " + kakao_account);
        log.info("#kakao.do scode: " + scode);
        log.info("#kakao.do session.scode: " + session.getAttribute("scode"));
        return "kakao_login";
        // return "redirect:storeMain.do";
    }
    /*
     * @GetMapping("storeMain.do") public ModelAndView storeMain(HttpSession
     * session) {
     * 
     * String email = (String) session.getAttribute("email"); String nickname =
     * (String) session.getAttribute("nickname");
     * 
     * log.info("#storeMain.do email:" + email + ", nickname:" + nickname);
     * 
     * String scode = (String) session.getAttribute("scode");
     * log.info("#storeMain.do scode: " + scode); ModelAndView mv = new
     * ModelAndView("memberStore"); List<CategoryVo> clist =
     * categoryService.selectAllByScode(scode); List<MenuVo> mlist =
     * menuService.selectBySucode(scode); String sname =
     * storeService.selectByScode(scode); log.info("#storeMain.do clist: " + clist);
     * log.info("#storeMain.do mlist: " + mlist); log.info("#storeMain.do sname: " +
     * sname); mv.addObject("scode", scode); mv.addObject("clist", clist);
     * mv.addObject("mlist", mlist); mv.addObject("sname", sname); return mv; }
     */

    @GetMapping("menu_in.do")
    public ModelAndView menu_in(HttpSession session) {
        String scode = (String) session.getAttribute("scode");
        log.info("#menu_in.do scode:" + scode);
        List<CategoryVo> list = categoryService.selectAllByScode(scode);
        log.info("#menu_in.do list:" + list);
        ModelAndView mv = new ModelAndView("menu_in");
        mv.addObject("list", list);
        return mv;
    }

}
