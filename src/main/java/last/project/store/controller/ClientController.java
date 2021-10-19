package last.project.store.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import last.project.store.domain.BasketVo;
import last.project.store.service.BasketService;
import last.project.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class ClientController {

    private BasketService basketService;

    @PostMapping("basket_in") // 장바구니 추가
    public String basket_in(HttpSession session, int bcount, String cname, String mname, int mprice) { // 장바구니 담기 클릭시
        BasketVo basketVo = new BasketVo(); // BasketVo 객체 생성
        String kid = (String) session.getAttribute("email"); // session에 유지되고 있는 고객 id값 가져오기.
        String scode = (String) session.getAttribute("scode"); // session에 유지되고 있는 매장코드값 가져오기
        int basicprice = mprice;
        log.info("#category.do Post kid:" + kid + ", scode:" + scode + ", senior:" + bcount + ", cname:" + cname);
        log.info("#category.do Post mname: " + mname);
        log.info("#category.do Post mprice: " + mprice);

        List<BasketVo> blist = basketService.selectByMname(kid, mname); // 장바구니에 추가중인 고객 kid, 장바구니에 추가할 메뉴 이름
        log.info("#basket_in.do bcount1: " + bcount);
        log.info("#basket_in.do blist.size: " + blist.size());
        mprice = mprice * bcount; // 상품가격 = 상품가격 * 상품의개수
        if (blist.size() != 0) { // blist 가 0이 아니라는건 해당 고객(kid) 가 이미 장바구니에 물품을 추가 했다는 의미
            int get_bcount = blist.get(0).getBcount(); // 그럼 이미 추가한 메뉴의 수량을 가져오고
            int get_mprice = blist.get(0).getMprice(); // 추가 한 메뉴의 가격을 가져 옵니다.
            bcount = bcount + get_bcount; // jsp에서 받아온 bcount 에 BasketTable 에서 가져온 bcount를 더함
            mprice = mprice + get_mprice; // jsp에서 받아온 mprice 에 BasketTable 에서 가져온 mpirce를 더함
            basketVo.setBcount(bcount); // set
            basketVo.setKid(kid);
            basketVo.setMname(mname);
            basketVo.setMprice(mprice);
            basketService.updateAll(basketVo); // 이건 업데이트
            log.info("#basket_in.do bcount2: " + bcount);
            return "redirect:client_category.do";
        } else { // blist 가 0 이라는건 장바구니에 해당하는 메뉴가 없다는 뜻.
            basketVo.setMname(mname);
            basketVo.setBcount(bcount);
            basketVo.setMprice(mprice);
            basketVo.setKid(kid);
            basketVo.setBasicprice(basicprice);
            basketService.insertAll(basketVo); // 장바구니에 추가
            return "redirect:client_category.do"; // 카테고리로 다시 이동
        }
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
}
