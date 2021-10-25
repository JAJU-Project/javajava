package last.project.store.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.BasketVo;
import last.project.store.domain.CategoryVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.StoreVo;
import last.project.store.domain.StoreimgVo;
import last.project.store.service.BasketService;
import last.project.store.service.CategoryService;
import last.project.store.service.MenuService;
import last.project.store.service.StoreService;
import last.project.store.service.StoreimgService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@AllArgsConstructor
@Log
public class ListController {

    private CategoryService categoryService;

    @GetMapping("menu_in") // 메뉴추가 버튼을 누르면 카테고리를 보내주기 위한 용도
    public ModelAndView menu_in(HttpSession session) {
        String scode = (String) session.getAttribute("scode"); // session에서 매장코드 가쟈옴
        log.info("#menu_in.do scode:" + scode);
        List<CategoryVo> list = categoryService.selectAllByScode(scode); // 매장코드를 이용해 카테고리 리스트 불러옴.
        log.info("#menu_in.do list:" + list);
        ModelAndView mv = new ModelAndView("admin/insert"); // admin/insert로 이동
        mv.addObject("list", list); // 카테고리 리스트 보내줌.
        log.info("menu_in list: " + list);
        return mv;
    }
}
