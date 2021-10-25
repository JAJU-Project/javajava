package last.project.store.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import last.project.store.domain.CategoryVo;
import last.project.store.domain.CommentVo;
import last.project.store.domain.ManagerVo;
import last.project.store.domain.MenuVo;
import last.project.store.domain.MenuimgVo;
import last.project.store.domain.RandomCode;
import last.project.store.domain.StoreVo;
import last.project.store.domain.StoreimgVo;
import last.project.store.service.CategoryService;
import last.project.store.service.CommentService;
import last.project.store.service.FileUploadService;
import last.project.store.service.ManagerService;
import last.project.store.service.MenuService;
import last.project.store.service.MenuimgService;
import last.project.store.service.SalesService;
import last.project.store.service.StoreService;
import last.project.store.service.StoreimgService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class AdminInsertController {

    private ManagerService managerService;
    private CategoryService categoryService;
    private MenuService menuService;
    private SalesService salesService;
    private StoreService storeService;
    private FileUploadService fileUploadService;
    private StoreimgService storeimgService;
    private MenuimgService menuimgService;
    private CommentService commentService;

    @PostMapping("sign_up.do") // 관리자 회원 가입을 위한
    public String sign_up(ManagerVo managerVo) { // 아이디 유효성검사 할 예정.
        String maid = managerVo.getMaid();
        log.info("#sign_up.do post maid: " + maid);
        managerService.insertAll(managerVo);
        return "redirect:/";
    }

    @PostMapping("inset_catego") // 카테고리 추가
    public String category_in(String catego, HttpSession session) { // 페이지에서 카테고리명을 받아온다.
        CategoryVo categoryVo = new CategoryVo();
        String cname = catego;
        categoryVo.setCname(cname);
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드(scode) 선언.
        log.info("#category_in.do cname: " + categoryVo.getCname() + ", scode: " + scode);
        categoryVo.setScode(scode); // Vo에 scode를 set해준다.
        categoryService.insertAll(categoryVo); // Table에 insert 시켜준다.
        return "redirect:menu"; // 메뉴 페이지로
        // redirect해준다.
    }

    @PostMapping("inset_menu") // 메뉴 추가
    public String menu_in(HttpSession session, MenuVo menuVo, MultipartFile file, String caseq) { // 페이지에서 메뉴 정보를 받아온다.
        MenuimgVo menuimgVo = new MenuimgVo();
        String ofname = file.getOriginalFilename();
        String mimg = "";

        if (ofname != null)
            ofname = ofname.trim();
        if (ofname.length() != 0) {
            mimg = fileUploadService.saveMenu(file);
            log.info("#simg: " + mimg);
        }
        log.info("#inset_menu:" + menuVo);
        String mname = menuVo.getMname();
        String scode = (String) session.getAttribute("scode");
        menuVo.setScode(scode); // Vo에 scode를 set해준다.
        menuVo.setCaseq(Long.parseLong(caseq));
        menuService.insertAll(menuVo); // 관리자가 입력한 메뉴 insert
        salesService.insertAll(mname, scode);

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("scode", scode);
        map.put("caseq", Long.parseLong(caseq));
        map.put("mname", mname);
        long mseq = menuService.selectByCaseq(map);
        log.info("mseq: " + mseq);
        menuimgVo.setMseq(mseq);
        menuimgVo.setMimg("menuimg/" + mimg);
        menuimgService.insertAll(menuimgVo);
        return "redirect:menu"; // 매장관리 페이지로 다시 이동.
    }

    @PostMapping("store_create.do") // 매장생성
    public String store_create(StoreVo storeVo, HttpSession session, MultipartFile file) {
        StoreimgVo storeimgVo = new StoreimgVo();

        String ofname = file.getOriginalFilename();
        String simg = "";
        // String fname = file.getName();
        if (ofname != null)
            ofname = ofname.trim();
        if (ofname.length() != 0) {
            simg = fileUploadService.saveStore(file);
            log.info("#simg: " + simg);
        }

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
            storeimgVo.setScode(scode);
            storeimgVo.setSimg("storeimg/" + simg);
            storeimgService.insertAll(storeimgVo);
            return "redirect:store.do";
        }
        return null;
    }

    @RequestMapping("commentReply") // 관리자 댓글 남기기(10/24)
    public String commentReply(String cocontent, HttpSession session) {
        CommentVo commentVo = new CommentVo();
        long rseq = (Long) session.getAttribute("rseq");
        String scode = (String) session.getAttribute("scode");
        String maid = (String) session.getAttribute("maid");
        commentVo.setCocontent(cocontent);
        commentVo.setMaid(maid);
        commentVo.setRseq(rseq);
        commentVo.setScode(scode);
        log.info("t:" + rseq);
        log.info("t:" + cocontent);
        log.info("scode:" + scode);
        log.info("maid:" + maid);
        commentService.insertAll(commentVo);

        session.removeAttribute("rseq");

        return "redirect:review";
    }
}
