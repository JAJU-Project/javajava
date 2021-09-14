package last.project.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.CategoryVo;
import last.project.store.domain.MenuVo;
import last.project.store.service.CategoryService;
import last.project.store.service.MenuService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@AllArgsConstructor
@Log
public class ListController {

    private CategoryService categoryService;
    private MenuService menuService;

    @GetMapping("client_category.do") // 고객에게 카테고리 보여주기
    public ModelAndView category(HttpSession session, String cname) {
        String scode = (String) session.getAttribute("scode"); // session에서 매장 코드값 가져옴.
        log.info("#client_category.do 입장 scode: " + scode);
        ModelAndView mv = new ModelAndView("client_category"); // client_category.jsp로 이동
        List<CategoryVo> clist = categoryService.selectAllByScode(scode); // 해당 매장에 카테고리를 보여줌
        mv.addObject("clist", clist); // 해당매장의 카테고리 리스트를 보내준다.
        if (cname != null) { // (임시용) 카테고리를 클릭하면 쓰여지는 if문
            List<MenuVo> mlist = menuService.selectByCname(scode, cname); // 매장코드와 카테고리 이름을 통해서 메뉴의 정보를 불러온다.
            log.info("#catrgory.do cname: " + cname);
            mv.addObject("mlist", mlist); // 메뉴정보를 jsp로 넘겨준다.
        }
        return mv;
    }
}
