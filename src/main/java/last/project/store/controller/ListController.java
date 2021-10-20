package last.project.store.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.BasketVo;
import last.project.store.domain.CategoryVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.StoreVo;
import last.project.store.service.BasketService;
import last.project.store.service.CategoryService;
import last.project.store.service.MenuService;
import last.project.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@AllArgsConstructor
@Log
public class ListController {

    private CategoryService categoryService;
    private MenuService menuService;
    private BasketService basketService;
    private StoreService storeService;

    @GetMapping("store.do") // 관리자 매장 리스트
    public ModelAndView store(HttpSession session) {
        String maid = (String) session.getAttribute("maid"); // 로그인한 관리자 아이디 session값 가져옴
        List<StoreVo> list = storeService.selectByMaid(maid); // 관리자의 매장 정보 전부 가져옴.
        log.info("#store.do list:" + list);
        ModelAndView mv = new ModelAndView("store"); // store.jsp로 이동
        mv.addObject("list", list); // 매장 리시트 전송
        return mv;
    }

    @GetMapping("management.do") // 매장관리 페이지
    public String storeMain(String scode, HttpSession session) { // 매장 들어갈때 파라미터 매장코드 가져옴
        session.setAttribute("scode", scode); // session에 매장코드 저장.
        log.info("#management.do scode: " + scode);
        return "admin/index"; // admin/index.jsp로 이동
    }

    @GetMapping("menu_in") // 메뉴추가 버튼을 누르면 카테고리를 보내주기 위한 용도
    public ModelAndView menu_in(HttpSession session) {
        String scode = (String) session.getAttribute("scode"); // session에서 매장코드 가쟈옴
        log.info("#menu_in.do scode:" + scode);
        List<CategoryVo> list = categoryService.selectAllByScode(scode); // 매장코드를 이용해 카테고리 리스트 불러옴.
        log.info("#menu_in.do list:" + list);
        ModelAndView mv = new ModelAndView("admin/insert"); // admin/insert로 이동
        mv.addObject("list", list); // 카테고리 리스트 보내줌.
        return mv;
    }
}
