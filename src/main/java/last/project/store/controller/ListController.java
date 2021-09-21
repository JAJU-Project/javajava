package last.project.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("basket.do") // 고객의 장바구니 리스트
    public ModelAndView basket(HttpSession session) {
        String kid = (String) session.getAttribute("email"); // 해당고객의 아이디 가져옴.
        List<BasketVo> blist = basketService.selectByKid(kid); // 아이디를 통해서 장바구니 리스트를 가져온다.
        log.info("#basket.do blist: " + blist);
        ModelAndView mv = new ModelAndView("basket"); // basket.jsp 이동
        mv.addObject("blist", blist); // 장바구니 리스트 전송
        return mv;
    }

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
    public ModelAndView storeMain(String scode, HttpSession session) { // 매장 들어갈때 파라미터 매장코드 가져옴
        session.setAttribute("scode", scode); // session에 매장코드 저장.

        log.info("#management.do scode: " + scode);
        List<CategoryVo> list = categoryService.selectAllByScode(scode); // 매장코드에 해당하는 카테고리 리스트를 가져옴.
        List<MenuVo> mList = menuService.selectBySucode(scode); // 매장코드에 해당하는 메뉴 리스트를 가져옴.
        ModelAndView mv = new ModelAndView("admin/index"); // managementMain.jsp로 이동
        // log.info("#management.do mlist: " + mList);
        // log.info("#management.do list: " + list);
        // mv.addObject("mList", mList); // 메뉴 리스트 전송
        // mv.addObject("category_list", list); // 카테고리 리스트 전송
        return mv;
    }

    @GetMapping("menu_in.do") // 메뉴추가 버튼을 누르면 카테고리를 보내주기 위한 용도
    public ModelAndView menu_in(HttpSession session) {
        String scode = (String) session.getAttribute("scode"); // session에서 매장코드 가쟈옴
        log.info("#menu_in.do scode:" + scode);
        List<CategoryVo> list = categoryService.selectAllByScode(scode); // 매장코드를 이용해 카테고리 리스트 불러옴.
        log.info("#menu_in.do list:" + list);
        ModelAndView mv = new ModelAndView("menu_in"); // menu_in.jsp로 이동
        mv.addObject("list", list); // 카테고리 리스트 보내줌.
        return mv;
    }
}
