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
import last.project.store.domain.OrderListVo;
import last.project.store.domain.ReviewVo;
import last.project.store.service.BasketService;
import last.project.store.service.OrderListService;
import last.project.store.service.ReviewService;
import last.project.store.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@AllArgsConstructor
public class ClientController {

    private BasketService basketService;
    private ReviewService reviewService;
    private OrderListService orderListService;

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
        int total_mprice = 0;
        ArrayList<Long> seqList = new ArrayList<Long>();
        for (int i = 0; i < blist.size(); i++) {
            total_mprice += blist.get(i).getMprice();
        }
        for (int i = 0; i < blist.size(); i++) {
            seqList.add(blist.get(i).getBaseq());
        }
        for (int i = 0; i < seqList.size(); i++) {
            log.info("#basket.do seqList: " + seqList.get(i));
        }
        log.info("basket.do total_mprice: " + total_mprice);
        mv.addObject("blist", blist); // 장바구니 리스트 전송
        mv.addObject("total_mprice", total_mprice);
        mv.addObject("seqList", seqList);

        return mv;
    }

    @RequestMapping("client_review_click")
    @ResponseBody
    public List<HashMap<String, Object>> client_review_click(long rseq, HttpSession session) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        String scode = (String) session.getAttribute("scode");
        log.info("client_review_click rseq: " + rseq);
        log.info("client_review_click scode: " + scode);
        map.put("scode", scode);
        map.put("rseq", rseq);
        List<HashMap<String, Object>> rlist = reviewService.selectByRseq(map);
        return rlist;
    }

    @PostMapping("client_order_menu_click")
    @ResponseBody
    public HashMap<String, Object> client_order_menu_click(long oseq, HttpSession session) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        String kid = (String) session.getAttribute("email");
        String scode = (String) session.getAttribute("scode");
        log.info("oseq:" + oseq);
        map.put("kid", kid);
        map.put("scode", scode);
        map.put("oseq", oseq);
        List<OrderListVo> olist = orderListService.selectAllClient(map);
        long totalPrice = 0l;
        int count = 0;
        HashMap<String, Object> maps = new HashMap<String, Object>();
        maps.put("sname", olist.get(0).getSname());
        maps.put("ostate", olist.get(0).getOstate());
        if (olist.get(0).getMname2() == null) {
            count = 1;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname3() == null) {
            count = 2;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname4() == null) {
            count = 3;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname5() == null) {
            count = 4;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname6() == null) {
            count = 5;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname7() == null) {
            count = 6;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname8() == null) {
            count = 7;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname9() == null) {
            count = 8;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7() + olist.get(0).getMprice8();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            mname[7] = olist.get(0).getMname8();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            mprice[7] = olist.get(0).getMprice8();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            olcount[7] = olist.get(0).getOlcount8();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else if (olist.get(0).getMname10() == null) {
            count = 9;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7() + olist.get(0).getMprice8() + olist.get(0).getMprice9();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            mname[7] = olist.get(0).getMname8();
            mname[8] = olist.get(0).getMname9();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            mprice[7] = olist.get(0).getMprice8();
            mprice[8] = olist.get(0).getMprice9();
            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            olcount[7] = olist.get(0).getOlcount8();
            olcount[8] = olist.get(0).getOlcount9();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        } else {
            count = 10;
            String[] mname = new String[count];
            Long[] mprice = new Long[count];
            int[] olcount = new int[count];

            totalPrice = olist.get(0).getMprice1() + olist.get(0).getMprice2() + olist.get(0).getMprice3()
                    + olist.get(0).getMprice4() + olist.get(0).getMprice5() + olist.get(0).getMprice6()
                    + olist.get(0).getMprice7() + olist.get(0).getMprice8() + olist.get(0).getMprice9()
                    + olist.get(0).getMprice10();
            maps.put("count", count);
            maps.put("oseq", oseq);
            mname[0] = olist.get(0).getMname1();
            mname[1] = olist.get(0).getMname2();
            mname[2] = olist.get(0).getMname3();
            mname[3] = olist.get(0).getMname4();
            mname[4] = olist.get(0).getMname5();
            mname[5] = olist.get(0).getMname6();
            mname[6] = olist.get(0).getMname7();
            mname[7] = olist.get(0).getMname8();
            mname[8] = olist.get(0).getMname9();
            mname[9] = olist.get(0).getMname10();
            maps.put("mname", mname);
            mprice[0] = olist.get(0).getMprice1();
            mprice[1] = olist.get(0).getMprice2();
            mprice[2] = olist.get(0).getMprice3();
            mprice[3] = olist.get(0).getMprice4();
            mprice[4] = olist.get(0).getMprice5();
            mprice[5] = olist.get(0).getMprice6();
            mprice[6] = olist.get(0).getMprice7();
            mprice[7] = olist.get(0).getMprice8();
            mprice[8] = olist.get(0).getMprice9();
            mprice[9] = olist.get(0).getMprice10();

            maps.put("mprice", mprice);
            olcount[0] = olist.get(0).getOlcount1();
            olcount[1] = olist.get(0).getOlcount2();
            olcount[2] = olist.get(0).getOlcount3();
            olcount[3] = olist.get(0).getOlcount4();
            olcount[4] = olist.get(0).getOlcount5();
            olcount[5] = olist.get(0).getOlcount6();
            olcount[6] = olist.get(0).getOlcount7();
            olcount[7] = olist.get(0).getOlcount8();
            olcount[8] = olist.get(0).getOlcount9();
            olcount[9] = olist.get(0).getOlcount10();
            maps.put("olcount", olcount);
            maps.put("totalPrice", totalPrice);
            maps.put("oldate", olist.get(0).getOldate());
            return maps;
        }

    }
}
