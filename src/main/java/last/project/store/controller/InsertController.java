package last.project.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import last.project.store.domain.BasketVo;
import last.project.store.domain.CategoryVo;
import last.project.store.domain.ManagerVo;
import last.project.store.domain.MenuVo;
import last.project.store.service.BasketService;
import last.project.store.service.CategoryService;
import last.project.store.service.ManagerService;
import last.project.store.service.MenuService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class InsertController { // 각각의 정보를 추가할때 쓰이는 컨트롤러

    private ManagerService managerService;
    private CategoryService categoryService;
    private MenuService menuService;
    private BasketService basketService;

    @PostMapping("sign_up.do") // 관리자 회원 가입을 위한
    public String sign_up(ManagerVo managerVo) {
        managerService.insertAll(managerVo);
        return "redirect:/";
    }

    @PostMapping("category_in.do")
    public String category_in(CategoryVo categoryVo, HttpSession session) { // 페이지에서 카테고리명을 받아온다.
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드(scode) 선언.
        log.info("#category_in.do cname: " + categoryVo.getCname() + ", scode: " + scode);
        categoryVo.setScode(scode); // Vo에 scode를 set해준다.
        categoryService.insertAll(categoryVo); // Table에 insert 시켜준다.
        return "redirect:management.do?scode=" + scode + ""; // 매장관리 페이지로 redirect해준다.
    }

    @PostMapping("menu_in.do")
    public String menu_in(HttpSession session, MenuVo menuVo) { // 페이지에서 메뉴 정보를 받아온다.
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드(scode) 선언.
        log.info("#menu_in.do scode: " + scode);
        menuVo.setScode(scode); // Vo에 scode를 set해준다.
        menuService.insertAll(menuVo); // 관리자가 입력한 메뉴 insert
        return "redirect:management.do?scode=" + scode + ""; // 매장관리 페이지로 다시 이동.
    }

    @PostMapping("basket_in.do")
    public String basket_in(HttpSession session, int bcount, String cname, String mname, int mprice) { // 장바구니 담기 클릭시
        BasketVo basketVo = new BasketVo(); // BasketVo 객체 생성
        String kid = (String) session.getAttribute("email"); // session에 유지되고 있는 고객 id값 가져오기.
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드값 가져오기

        log.info("#category.do Post kid:" + kid + ", scode:" + scode + ", senior:" + bcount + ", cname:" + cname);
        log.info("#category.do Post mname: " + mname);
        log.info("#category.do Post mprice: " + mprice);
        basketVo.setMname(mname);
        basketVo.setBcount(bcount);
        mprice = mprice * bcount; // 상품가격 = 상품가격 * 상품의개수
        basketVo.setMprice(mprice);
        basketVo.setKid(kid);
        basketService.insertAll(basketVo); // 장바구니에 추가
        return "redirect:client_category.do"; // 카테고리로 다시 이동
    }

}
