package last.project.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.MenuVo;
import last.project.store.service.MenuService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class AdminRedirectController {
    private MenuService menuService;

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
}
