package last.project.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import last.project.store.domain.BasketVo;
import last.project.store.domain.CategoryVo;
import last.project.store.domain.ManagerVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.RandomCode;
import last.project.store.domain.StoreVo;
import last.project.store.service.BasketService;
import last.project.store.service.CategoryService;
import last.project.store.service.ManagerService;
import last.project.store.service.MenuService;
import last.project.store.service.SalesService;
import last.project.store.service.StoreService;
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
    private StoreService storeService;
    private SalesService salesService;

    @PostMapping("sign_up.do") // 관리자 회원 가입을 위한
    public String sign_up(ManagerVo managerVo) { // 아이디 유효성검사 할 예정.
        String maid = managerVo.getMaid();
        log.info("#sign_up.do post maid: " + maid);
        managerService.insertAll(managerVo);
        return "redirect:/";
    }

    @PostMapping("inset_catego")
    public String category_in(CategoryVo categoryVo, HttpSession session) { // 페이지에서 카테고리명을 받아온다.
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드(scode) 선언.
        log.info("#category_in.do cname: " + categoryVo.getCname() + ", scode: " + scode);
        categoryVo.setScode(scode); // Vo에 scode를 set해준다.
        categoryService.insertAll(categoryVo); // Table에 insert 시켜준다.
        return "redirect:menu"; // 메뉴 페이지로
        // redirect해준다.
    }

    @PostMapping("inset_menu")
    public String menu_in(HttpSession session, MenuVo menuVo) { // 페이지에서 메뉴 정보를 받아온다.
        log.info("#inset_menu:" + menuVo);
        String mname = menuVo.getMname();
        log.info("#inset_menu mname: " + mname);
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드(scode) 선언.
        log.info("#menu_in.do scode: " + scode);
        menuVo.setScode(scode); // Vo에 scode를 set해준다.
        menuService.insertAll(menuVo); // 관리자가 입력한 메뉴 insert
        salesService.insertAll(mname, scode);
        return "redirect:menu"; // 매장관리 페이지로 다시 이동.
    }

    @PostMapping("basket_in.do")
    public String basket_in(HttpSession session, int bcount, String cname, String mname, int mprice) { // 장바구니 담기 클릭시
        BasketVo basketVo = new BasketVo(); // BasketVo 객체 생성
        String kid = (String) session.getAttribute("email"); // session에 유지되고 있는 고객 id값 가져오기.
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드값 가져오기

        log.info("#category.do Post kid:" + kid + ", scode:" + scode + ", senior:" + bcount + ", cname:" + cname);
        log.info("#category.do Post mname: " + mname);
        log.info("#category.do Post mprice: " + mprice);

        List<BasketVo> blist = basketService.selectByMname(kid, mname);
        log.info("#basket_in.do bcount1: " + bcount);
        log.info("#basket_in.do blist.size: " + blist.size());
        mprice = mprice * bcount; // 상품가격 = 상품가격 * 상품의개수
        if (blist.size() != 0) {
            int get_bcount = blist.get(0).getBcount();
            int get_mprice = blist.get(0).getMprice();
            bcount = bcount + get_bcount;
            mprice = mprice + get_mprice;
            basketVo.setBcount(bcount);
            basketVo.setKid(kid);
            basketVo.setMname(mname);
            basketVo.setMprice(mprice);
            basketService.updateAll(basketVo);
            log.info("#basket_in.do bcount2: " + bcount);
            return "redirect:client_category.do";
        } else {
            basketVo.setMname(mname);
            basketVo.setBcount(bcount);
            basketVo.setMprice(mprice);
            basketVo.setKid(kid);
            basketService.insertAll(basketVo); // 장바구니에 추가
            return "redirect:client_category.do"; // 카테고리로 다시 이동
        }
    }

    @PostMapping("store_create.do") // 매장생성
    public String store_create(StoreVo storeVo, HttpSession session) {
        String maid = (String) session.getAttribute("maid"); // 테스트용으로 일단 관리자가 로그인하면 매장생성 하도록함 추후에는 개발자가 매장 생성.
                                                             // (추후에 session값 대신 직접 값 대입)
        RandomCode random = new RandomCode(); // 매장 코드를 생성하기 위한 객체생성
        char[] num = random.ran();
        String scode = ""; // 선초
        if (num == null) {
            log.info("num = null");
        } else {
            for (int i = 0; i < num.length; i++) {
                scode += Character.toString(num[i]);
            }
            scode = scode.trim();
            String sname = storeVo.getSname(); // 그
            String sintro = storeVo.getSintro();// 냥
            String sphone = storeVo.getSphone();// 찍
            log.info("#store_create.do" + sname + ", " + sintro + ", " + sphone);// 어
            log.info("#store_create.do sucode: " + scode + ", length:" + scode.length() + "maid: " + maid);// 봄
            storeVo.setMaid(maid);
            storeVo.setScode(scode); // 랜덤으로 만들어진 매장코드 set
            storeService.insertAll(storeVo); // insert
            return "redirect:store.do";
        }
        return null;
    }

}
