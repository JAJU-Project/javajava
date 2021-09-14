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

    @GetMapping("category.do")
    public ModelAndView category(HttpSession session, String cname, String senior) {

        log.info("#category.do senior" + senior);

        String scode = (String) session.getAttribute("scode");
        log.info("#category.do 입장 scode: " + scode);
        ModelAndView mv = new ModelAndView("category");
        List<CategoryVo> clist = categoryService.selectAllByScode(scode);
        mv.addObject("clist", clist);
        if (cname != null) {
            List<MenuVo> mlist = menuService.selectByCname(scode, cname);
            log.info("#catrgory.do cname: " + cname);
            mv.addObject("mlist", mlist);
        }
        return mv;
    }

    @GetMapping("basket.do")
    public ModelAndView basket(HttpSession session) {
        String kid = (String) session.getAttribute("email");
        List<BasketVo> blist = basketService.selectByKid(kid);
        log.info("#basket.do blist: " + blist);
        ModelAndView mv = new ModelAndView("basket");
        mv.addObject("blist", blist);
        return mv;
    }

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

    @GetMapping("storeMain.do")
    public ModelAndView storeMain(HttpSession session) {

        String email = (String) session.getAttribute("email");
        String nickname = (String) session.getAttribute("nickname");

        log.info("#storeMain.do email:" + email + ", nickname:" + nickname);
        String partner_order_id = "test주문번호";
        String partner_user_id = "test가맹점회원id";
        String test = "partner_order_id=" + partner_order_id + "&partner_user_id=" + partner_user_id;
        log.info("#storeMain.do test:" + test);
        String scode = (String) session.getAttribute("scode");
        log.info("#storeMain.do scode: " + scode);
        ModelAndView mv = new ModelAndView("memberStore");
        List<CategoryVo> clist = categoryService.selectAllByScode(scode);
        List<MenuVo> mlist = menuService.selectBySucode(scode);
        String sname = storeService.selectByScode(scode);
        log.info("#storeMain.do clist: " + clist);
        log.info("#storeMain.do mlist: " + mlist);
        log.info("#storeMain.do sname: " + sname);
        mv.addObject("scode", scode);
        mv.addObject("clist", clist);
        mv.addObject("mlist", mlist);
        mv.addObject("sname", sname);
        return mv;
    }

    @PostMapping("login.do")
    public String login(String maid, String mapwd, HttpSession session) {
        log.info("#login.do maid: " + maid + ", mapwd: " + mapwd);
        String maname = managerService.selectByLogin(maid, mapwd);
        if (maname != null) {
            session.setAttribute("maid", maid);
            log.info("#login.do 아이디및 비밀번호 일치");
            return "redirect:store.do";
        } else {
            log.info("#login.do 아이디및 비밀번호 하지않음");
        }
        return null;
    }

    @GetMapping("store.do")
    public ModelAndView store(HttpSession session) {
        String maid = (String) session.getAttribute("maid");
        List<StoreVo> list = storeService.selectByMaid(maid);
        log.info("#store.do list:" + list);
        ModelAndView mv = new ModelAndView("store");
        mv.addObject("list", list);
        return mv;
    }

    @PostMapping("store_create.do")
    public String store_create(StoreVo storeVo, HttpSession session) {
        String maid = (String) session.getAttribute("maid");
        RandomCode random = new RandomCode();
        char[] num = random.ran();
        String scode = "";
        if (num == null) {
            log.info("num = null");
        } else {
            for (int i = 0; i < num.length; i++) {
                scode += Character.toString(num[i]);
            }
            scode = scode.trim();
            String sname = storeVo.getSname();
            String sintro = storeVo.getSintro();
            String sphone = storeVo.getSphone();
            log.info("#store_create.do" + sname + ", " + sintro + ", " + sphone);
            // log.info("#store_create.do num: " + num + ", length:" + num.length);
            log.info("#store_create.do sucode: " + scode + ", length:" + scode.length() + "maid: " + maid);
            storeVo.setMaid(maid);
            storeVo.setScode(scode);
            storeService.insertAll(storeVo);
            return "redirect:store.do";
        }
        return null;
    }

    @GetMapping("management.do")
    public ModelAndView storeMain(String scode, HttpSession session) {
        session.setAttribute("scode", scode);
        log.info("#management.do scode: " + scode);
        String scodes = (String) session.getAttribute("scode");
        log.info("#management.do session.scodes: " + scodes);
        List<CategoryVo> list = categoryService.selectAllByScode(scode);
        List<MenuVo> mList = menuService.selectBySucode(scode);
        // List<String> cateforyname = categoryService.selectByScode(scode);
        ModelAndView mv = new ModelAndView("managementMain");
        /*
         * for (int i = 0; i < cateforyname.size(); i++) {
         * log.info("#management.do cateforyname:" + cateforyname.get(i)); List<String>
         * menuList = menuService.selectBySucode(scode, cateforyname.get(i)); for (int j
         * = 0; j < menuList.size(); j++) { log.info("#management.do menuList:" +
         * menuList.get(j)); }
         * 
         * }
         */
        log.info("#management.do mlist: " + mList);
        log.info("#management.do list: " + list);
        // List<String> menulist = menuService.selectBySucode(scode, cname);
        mv.addObject("mList", mList);
        mv.addObject("category_list", list);
        return mv;
    }

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
